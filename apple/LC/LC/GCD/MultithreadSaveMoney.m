//
//  MultithreadSaveMoney.m
//  LC
//
//  Created by Zhen Gong on 10/8/19.
//  Copyright © 2019 ULS. All rights reserved.
//
// https://github.com/ITyongzhen/iOS-ManyLocks/blob/master/iOS-LockDemo/iOS-LockDemo/iOSManyLocks/YZMutexLock.m
// https://github.com/ITyongzhen?tab=repositories

#import "MultithreadSaveMoney.h"

@interface MultithreadSaveMoney()

@property (assign, nonatomic) NSInteger money;

@end

@implementation MultithreadSaveMoney

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.money = 100;
        self.queue = dispatch_queue_create("dispatch_queue", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}


- (void)test {
    [self testWithProblems];
}

- (void)testWithProblems {
    dispatch_async(self.queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saveMoney];
        }
    });
    
    dispatch_async(self.queue, ^{
        for (int i = 0; i < 5; i++) {
            [self drawMoney];
        }
    });
}

/**
 save money
 */
- (void)saveMoney
{
    NSInteger oldMoney = self.money;
    sleep(.2);
    oldMoney += 10;
    self.money = oldMoney;
    
    NSLog(@"存10元，还剩%ld元 - %@", oldMoney, [NSThread currentThread]);
}

/**
 取钱
 */
- (void)drawMoney
{
    NSInteger oldMoney = self.money;
    sleep(.2);
    oldMoney -= 20;
    self.money = oldMoney;
    
    NSLog(@"取20元，还剩%ld元 - %@", oldMoney, [NSThread currentThread]);
}

@end
