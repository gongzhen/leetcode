//
//  ThreadSafeNSMutableArrayTest.m
//  LC
//
//  Created by Zhen Gong on 6/14/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "ThreadSafeNSMutableArrayTest.h"
#import "ThreadSafeNSMutableArray.h"

@interface ThreadSafeNSMutableArrayTest()
@property(strong, nonatomic)NSMutableArray *array;
@end

@implementation ThreadSafeNSMutableArrayTest

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [NSMutableArray array];
    }
    return self;
}

- (void)test {
    [self testReadTwoThread];
//    ThreadSafeNSMutableArray *array = [[ThreadSafeNSMutableArray alloc] init];

    
//    for(NSInteger i = 0; i < 10; i++) {
//        dispatch_async(queue, ^{
//            DLog(@"addObject:%@", @(i));
//            [array addObject:@(i)];
//            [array iterateArray];
//        });
//        dispatch_async(queue, ^{
//            [array iterateArray];
//        });
        
//        dispatch_async(queue, ^{
//            DLog(@"objectAtIndex[%ld]:%@", i, [array objectAtIndex:i]);
//        });
//    }
}

- (void)testReadOneThread {
    ThreadSafeNSMutableArray *obj = [[ThreadSafeNSMutableArray alloc] init];
    for(NSInteger i = 0; i < 10; i++) {
        [obj addObject:@(i)];
        NSLog(@"add:%@", [obj objectAtIndex:i]);
    }
    
    [obj iterateArray];
}

- (void)testReadTwoThread {
    // global concurrent queue
        dispatch_queue_t queue1 = dispatch_queue_create("com.gongzhen.queue1", DISPATCH_QUEUE_CONCURRENT);
        dispatch_queue_t queue2 = dispatch_queue_create("com.gongzhen.queue2", DISPATCH_QUEUE_CONCURRENT);
    ThreadSafeNSMutableArray *obj = [[ThreadSafeNSMutableArray alloc] init];
    dispatch_async(queue1, ^{
        for(NSInteger i = 0; i < 10; i++) {
            [obj addObject:@(i)];
            NSLog(@"++++++++++++add:%@", [obj objectAtIndex:i]);
        }
    });
    
    dispatch_async(queue2, ^{
        for(NSInteger i = 0; i < 10; i++) {
            [obj addObject:@(i)];
            NSLog(@"------------add:%@", [obj objectAtIndex:i]);
        }
    });
    
    dispatch_barrier_async(queue1, ^{
        [obj iterateArray];
    });
    

}


- (void)testBarrier {
     dispatch_queue_t queue = dispatch_queue_create("ThreadSafeNSMutableArrayTest", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue = dispatch_queue_create("ThreadSafeNSMutableArrayTest", DISPATCH_QUEUE_SERIAL);
    // add, remove and update
    dispatch_async(queue, ^{
        // add
        for (NSInteger index = 0; index < 10; index++) {
            NSLog(@"addObject:%ld", index);
            sleep(1);
            [self.array addObject:@(index)];
        }
    });
    dispatch_async(queue, ^{
        NSLog(@"objectAtIndex at count:%ld", self.array.count);
        for (NSInteger index = 0; index < self.array.count; index ++) {
            DLog(@"%@", [self.array objectAtIndex:index]);
        }
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"--------我是分割线--------");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"self.array.count:%ld", self.array.count);
    });
    
    // update
    dispatch_async(queue, ^{
        for (NSInteger index = 0; index < 10; index ++) {
            [self.array replaceObjectAtIndex:index withObject:@(index * 2)];
            NSLog(@"76 [%ld]:%@", index, [self.array objectAtIndex:index]);
        }
    });
    // update
    dispatch_async(queue, ^{
        for (NSInteger index = 0; index < 10; index ++) {
            if(index % 3 == 0) {
                [self.array replaceObjectAtIndex:index withObject:[NSNull null]];
                NSLog(@"replaceObjectAtIndex at index:%ld", index);
            }
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger index = 0; index < self.array.count; index ++) {
            DLog(@"[%ld]:%@", index, [self.array objectAtIndex:index]);
        }
    });
}

@end
