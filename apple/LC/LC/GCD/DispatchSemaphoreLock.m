//
//  DispatchSemaphoreLock.m
//  LC
//
//  Created by Zhen Gong on 10/8/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "DispatchSemaphoreLock.h"

@interface DispatchSemaphoreLock()

@property (strong, nonatomic) dispatch_semaphore_t moneySemaphore;

@end

@implementation DispatchSemaphoreLock

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.moneySemaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)drawMoney
{
    dispatch_semaphore_wait(self.moneySemaphore, DISPATCH_TIME_FOREVER);
    
    [super drawMoney];
    
    dispatch_semaphore_signal(self.moneySemaphore);
}

- (void)saveMoney
{
    dispatch_semaphore_wait(self.moneySemaphore, DISPATCH_TIME_FOREVER);
    
    [super saveMoney];
    
    dispatch_semaphore_signal(self.moneySemaphore);
}

@end
