//
//  PthreadMutexLocl.m
//  LC
//
//  Created by Zhen Gong on 10/8/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "PthreadMutexLocl.h"
#import <pthread.h>

@interface PthreadMutexLocl()

@property (assign, nonatomic) pthread_mutex_t moneyMutexLock;

@end

@implementation PthreadMutexLocl

- (instancetype)init
{
    self = [super init];
    if (self) {
            // 静态初始化
            // pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
            
            // 初始化属性
            pthread_mutexattr_t attr;
            pthread_mutexattr_init(&attr);
            pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
            // 初始化锁
            pthread_mutex_init(&_moneyMutexLock, &attr);
            // 销毁属性
            pthread_mutexattr_destroy(&attr);
                                   
            // 上面五行相当于下面一行
            // pthread_mutex_init(mutex, NULL); //传空，相当于PTHREAD_MUTEX_DEFAULT
    }
    return self;
}

- (void)test {
    [self saveMoneyWithMutexLock];
}

- (void)saveMoneyWithMutexLock
{
    dispatch_async(self.queue, ^{
        for (int i = 0; i < 5; i++) {
            pthread_mutex_lock(&self->_moneyMutexLock);
            [super saveMoney];
            pthread_mutex_unlock(&self->_moneyMutexLock);
        }
    });
    
    dispatch_async(self.queue, ^{
        for (int i = 0; i < 5; i++) {
            pthread_mutex_lock(&self->_moneyMutexLock);
            [super drawMoney];
            pthread_mutex_unlock(&self->_moneyMutexLock);
        }
    });
}

@end
