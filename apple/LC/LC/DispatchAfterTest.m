//
//  DispatchAfterTest.m
//  LC
//
//  Created by Zhen Gong on 6/2/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "DispatchAfterTest.h"

@implementation DispatchAfterTest

- (void)test {
    CGFloat delayInSeconds = 3.0f;
    dispatch_queue_t mainQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    DLog(@"before dispatch_after");
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, mainQueue, ^{
        DLog(@"3 seconds to run TEST");
    });
    sleep(5);
}

@end
