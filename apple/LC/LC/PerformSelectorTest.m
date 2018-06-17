//
//  PerformSelectorTest.m
//  LC
//
//  Created by Zhen Gong on 6/2/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "PerformSelectorTest.h"

@implementation PerformSelectorTest

- (void)test {
    dispatch_queue_t queue = dispatch_queue_create("This is Concurrent queue", DISPATCH_QUEUE_CONCURRENT);
    [self performSelector:@selector(testDelay) onThread:[NSThread mainThread] withObject:nil waitUntilDone:NO];
    [self performSelectorOnMainThread:@selector(testDelay) withObject:nil waitUntilDone:NO];
    [self performSelector:@selector(testDelay) withObject:nil afterDelay:3 inModes:[NSArray arrayWithObject:NSDefaultRunLoopMode]];
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    dispatch_async(queue, ^{
        DLog(@"PerformSelectorTest");
        //这个selector不会执行，因为线程中没有runloop
         [self performSelector:@selector(testDelay) withObject:nil afterDelay:1];
        //代码会执行，因为采用了gcd方式
        [self testDispatch_after];
    });
    sleep(10);
}

-(void) testDelay{
    NSLog(@"testDelay被执行");
}

- (void)testDispatch_after {
    CGFloat delayInSeconds = 3.0f;
    dispatch_queue_t mainQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    DLog(@"before dispatch_after");
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, mainQueue, ^{
        DLog(@"3 seconds to run TEST");
    });
}

@end
