//
//  DispatchApplyTest.m
//  LC
//
//  Created by Zhen Gong on 5/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "DispatchApplyTest.h"

@implementation DispatchApplyTest

- (void)test {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.starming.gcddemo.concurrentqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_apply(10, concurrentQueue, ^(size_t i) {
        NSLog(@"%zu",i);
    });
    NSLog(@"The end"); //这里有个需要注意的是，dispatch_apply这个是会阻塞主线程的。这个log打印会在dispatch_apply都结束后才开始执行
    [self dealWiththreadWithMaybeExplode:YES];
    NSLog(@"YES - NO");
    [self dealWiththreadWithMaybeExplode:NO];
}

- (void)dealWiththreadWithMaybeExplode:(BOOL)explode {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.starming.gcddemo.concurrentqueue",DISPATCH_QUEUE_CONCURRENT);
    if (explode) {
        //有问题的情况，可能会死锁
        for (int i = 0; i < 999 ; i++) {
            dispatch_async(concurrentQueue, ^{
                NSLog(@"wrong %d",i);
                //do something hard
            });
        }
    } else {
        //会优化很多，能够利用GCD管理
        dispatch_apply(999, concurrentQueue, ^(size_t i){
            NSLog(@"correct %zu",i);
            //do something hard
        });
    }
}

@end
