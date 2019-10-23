//
//  UnfairLock.m
//  LC
//
//  Created by Zhen Gong on 10/8/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "UnfairLock.h"
#import <os/lock.h>

@interface UnfairLock()

@property (assign, nonatomic) os_unfair_lock moneyLock;

@end

@implementation UnfairLock


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)test {
    [self saveMoneyWithUnfairlock];
}

- (void)saveMoneyWithUnfairlock
{
    dispatch_async(self.queue, ^{
        for (int i = 0; i < 5; i++) {
            os_unfair_lock_lock(&self->_moneyLock);
            [super saveMoney];
            os_unfair_lock_unlock(&self->_moneyLock);
        }
    });
    
    dispatch_async(self.queue, ^{
        for (int i = 0; i < 5; i++) {
            os_unfair_lock_lock(&self->_moneyLock);
            [super drawMoney];
            os_unfair_lock_unlock(&self->_moneyLock);
        }
    });
}

@end
