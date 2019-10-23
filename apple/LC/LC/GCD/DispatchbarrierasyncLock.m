//
//  DispatchbarrierasyncLock.m
//  LC
//
//  Created by Zhen Gong on 10/8/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "DispatchbarrierasyncLock.h"

@interface DispatchbarrierasyncLock()

@end

@implementation DispatchbarrierasyncLock

- (void)test {
    [self drawMoney];
    [self saveMoney];
}

- (void)drawMoney
{
    dispatch_barrier_async(self.queue, ^{
        for (int i = 0; i < 5; i++) {
            [super drawMoney];
        }
    });
}

- (void)saveMoney
{
    dispatch_barrier_async(self.queue, ^{
        for (int i = 0; i < 5; i++) {
            [super saveMoney];
        }
    });
}

@end
