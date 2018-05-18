//
//  DispatchBlockWaitTest.m
//  LC
//
//  Created by Zhen Gong on 5/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "DispatchBlockWaitTest.h"

@implementation DispatchBlockWaitTest

- (void)test {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.starming.gcddemo.serialqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_block_t block = dispatch_block_create(0, ^{
        NSLog(@"star");
        [NSThread sleepForTimeInterval:5.f];
        NSLog(@"end");
    });
    dispatch_async(serialQueue, block);
    //设置DISPATCH_TIME_FOREVER会一直等到前面任务都完成
    dispatch_block_wait(block, DISPATCH_TIME_FOREVER);
    NSLog(@"ok, now can go on");
}
@end
