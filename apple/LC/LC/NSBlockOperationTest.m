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
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        DLog(@"%@", [NSThread currentThread]);
    }];
    
    [operation start];
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        DLog(@"%@", [NSThread currentThread]);
    }];
    
    DLog(@"Before add block ");
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc]init];
    [operationQueue addOperation:operation2];
    DLog(@"After add block");
    
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
}

@end
