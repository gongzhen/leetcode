//
//  DispatchGroupAsyncTest.m
//  LC
//
//  Created by Zhen Gong on 5/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "DispatchGroupAsyncTest.h"

@implementation DispatchGroupAsyncTest

- (void)test {
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.starming.gcddemo.concurrentqueue",DISPATCH_QUEUE_CONCURRENT);
//    dispatch_group_t group = dispatch_group_create();
//    //在group中添加队列的block
//    dispatch_group_async(group, concurrentQueue, ^{
//        [NSThread sleepForTimeInterval:2.f];
//        NSLog(@"1");
//    });
//    dispatch_group_async(group, concurrentQueue, ^{
//        NSLog(@"2");
//    });
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//    NSLog(@"go on");
    [self dispatchGroupNotifyDemo];
}

//dispatch_group_notify
- (void)dispatchGroupNotifyDemo {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.starming.gcddemo.concurrentqueue",DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, concurrentQueue, ^{
        for(int i = 0; i < 5; i++) {
            DLog(@"1");
        }
    });
    dispatch_group_async(group, concurrentQueue, ^{
        for(int i = 0; i < 5; i++) {
            DLog(@"2");
        }
    });
    dispatch_group_notify(group, concurrentQueue, ^{
        DLog(@"end");
    });
    DLog(@"dispatchGroupNotifyDemo can continue");
//    [self dispatchGroupWaitDemo];
}

//dispatch_group_wait
- (void)dispatchGroupWaitDemo {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.starming.gcddemo.concurrentqueue",DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    //在group中添加队列的block
    dispatch_group_async(group, concurrentQueue, ^{
        for(int i = 0; i < 5; i++) {
            DLog(@"1");
        }
    });
    dispatch_group_async(group, concurrentQueue, ^{
        for(int i = 0; i < 5; i++) {
            DLog(@"2");
        }
    });
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    DLog(@"dispatchGroupWaitDemo can continue");
}

@end
