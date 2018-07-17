//
//  DispatchAfterCounterTest.m
//  LC
//
//  Created by Zhen Gong on 6/27/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "DispatchAfterCounterTest.h"

@implementation DispatchAfterCounterTest

- (void)test {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (2 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"-------延时执行--------");
    });
}

@end
