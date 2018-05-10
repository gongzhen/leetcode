//
//  OSSpinLockTest.m
//  LC
//
//  Created by Zhen Gong on 5/9/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "OSSpinLockTest.h"

@implementation OSSpinLockTest

- (void)test {
    __block OSSpinLock oslock = OS_SPINLOCK_INIT;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        DLog(@"线程1 准备上锁");
        
        OSSpinLockLock(&oslock);
        
        sleep(4);
        
        DLog(@"线程1");
        
        OSSpinLockUnlock(&oslock);
        
        DLog(@"线程1 解锁成功");
        
        NSLog(@"--------------------------------------------------------");
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"线程2 准备上锁");
        
        OSSpinLockLock(&oslock);
        
        NSLog(@"线程2");
        
        OSSpinLockUnlock(&oslock);
        
        NSLog(@"线程2 解锁成功");
        
    });
    sleep(18);
}
@end
