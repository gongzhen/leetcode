//
//  NSBlockOperationTest.m
//  LC
//
//  Created by Zhen Gong on 5/8/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "NSBlockOperationTest.h"

@implementation NSBlockOperationTest

- (void)test {
    [self testStackOverFlow:^{
        NSLog(@"testStackOverFlow finished.");
    }];
    [self test1];
    // [self testSnapChat];
    // [self testStackOverFlow];
    NSInteger result =0;
    for (NSInteger i=0; i<10000; i++) {
        result = i;
    }
    DLog(@"Your operation block %ld",result);
}

// https://stackoverflow.com/questions/43545417/nsblockoperation-is-not-waiting-on-dependency-before-executing
// Start UPLOAD 1
// Completed UPLOAD 1
// Start DELETE 1
// Completed DELETE 1
//
// Start UPLOAD 2
// Completed UPLOAD 2
// Start DELETE 2
// Start UPLOAD 3
// Completed DELETE 2
// Start DELETE 3
// Completed UPLOAD 3
// Completed DELETE 3
//
// Start UPLOAD 4
// Start DELETE 4
// Completed UPLOAD 4
// Completed DELETE 4
//
// Start UPLOAD 5
// Start DELETE 5
// Completed UPLOAD 5
// Start UPLOAD 6
// Completed DELETE 5
// Start DELETE 6
// Completed UPLOAD 6
// Start UPLOAD 7
// Completed DELETE 6

- (void)testStackOverFlow:(void(^)(void))completion {
//    NSOperationQueue *operationQueue = [NSOperationQueue mainQueue];
//    operationQueue.maxConcurrentOperationCount = 1;
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    operationQueue.maxConcurrentOperationCount = 4;
    
    // pretend there are 100 images that need to be uploaded and information in a SQLite DB
    // waiting to be deleted upon successful upload of the image.
    // Upload 1 image at a time, upon successful upload, delete the respective DB info then move to the next image
//    for (__block int i = 1; i < 100; i++) {
//        NSOperation * UPLOAD = [self createNewOperationWithInt:i Message:@"UPLOAD"];
//        NSOperation * DELETE = [self createNewOperationWithInt:i Message:@"DELETE"];
//        [DELETE addDependency:UPLOAD];
//        [operationQueue addOperation:UPLOAD];
//        [operationQueue addOperation:DELETE];
//    }
    NSOperation * UPLOAD = [self createNewOperationWithInt:0 Message:@"UPLOAD"];
    NSOperation * DELETE = [self createNewOperationWithInt:0 Message:@"DELETE"];
    [DELETE addDependency:UPLOAD];
    [operationQueue addOperation:UPLOAD];
    [operationQueue addOperation:DELETE];
}

- (NSBlockOperation *) createNewOperationWithInt:(int)i Message:(NSString*)message {
    NSBlockOperation * operation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"Start %@ %i", message ,i);
        if ([message isEqualToString:@"UPLOAD"]) {
            NSInteger result =0 ;
            for (NSInteger i=0; i<10000; i++) {
                result = i;
            }
            DLog(@"Your operation block %ld",result);
             [NSThread sleepForTimeInterval:1]; //Pretend there is Network latency on upload
        }

        if ([message isEqualToString:@"DELETE"]) {
            NSInteger result =0 ;
            for (NSInteger i=0; i<10000; i++) {
                result = i;
            }
            DLog(@"Your operation block %ld",result);
            [NSThread sleepForTimeInterval:0.5]; //Pretend the SQLDB is being accessed
        }
        NSLog(@"Finished %@ %i",message ,i);
    }];
    operation.queuePriority = NSOperationQueuePriorityNormal;
    operation.qualityOfService = NSOperationQualityOfServiceUtility;
    operation.completionBlock = ^{
       NSLog(@"Completed %@ %i",message , i);
    };
    return operation;
}

- (void)testSnapChat {
    NSBlockOperation *operation0 = [NSBlockOperation blockOperationWithBlock:^{
        DLog(@"operation0: %@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        DLog(@"operation1: %@", [NSThread currentThread]);
    }];

    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        DLog(@"operation2: %@", [NSThread currentThread]);
    }];
    // op0 and op1 will execute first.
    [operation2 addDependency:operation0];
    [operation2 addDependency:operation1];
    [operation1 start]; // 1 and 0 ops will run first.
    [operation0 start];
    [operation2 start]; // 2 has to run at the last.
}

- (void)test1 {
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        DLog(@"operation1: %@", [NSThread currentThread]);
    }];
    
    [operation1 start]; /// operation1: will execute.
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        DLog(@"operation2: %@", [NSThread currentThread]);
    }];
    
    DLog(@"Before add block ");
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:operation2];
    DLog(@"After add block ");
    
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        NSInteger result =0 ;
        for (NSInteger i=0; i<10000; i++) {
            result = i;
        }
        DLog(@"Your operation block %ld",result);
    }];
    [operation3 addExecutionBlock:^{
        DLog(@"Added execution block ");
    }];
    DLog(@"Before add block ");
    [operationQueue addOperation:operation3];
    DLog(@"After add block");
    
    /// test adddependency
    NSBlockOperation *operation4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"operation 4 is running.");
        NSLog(@"The block operation ended, Do something such as show a successmessage etc");
    }];
    
    NSBlockOperation *operation5 = [NSBlockOperation blockOperationWithBlock:^{
        //This is the worker block operation
        NSLog(@"operation 5 is running.");
        [self methodOne];
    }];
    
    // Makes the receiver dependent on the completion of the specified operation.
    // The receiver is not considered ready to execute until all of its dependent operations have finished executing.
    [operation4 addDependency:operation5];
    [operation5 start];
    [operation4 start];
}

-(void)methodOne {
    NSLog(@"is testMethodOne running on main thread? ANS - %@",[NSThread isMainThread]? @"YES":@"NO");
    for (int i = 0; i<5; i++) {
        NSLog(@"sleeps for 1 sec and i is %d",i);
        sleep(1);
    }
}

@end
