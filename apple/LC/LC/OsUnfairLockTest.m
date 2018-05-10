//
//  OsUnfairLockTest.m
//  LC
//
//  Created by Zhen Gong on 5/9/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "OsUnfairLockTest.h"
// os_unfair_lock
#import <os/lock.h>

@implementation OsUnfairLockTest

- (void)test {
    os_unfair_lock_t unfairlock = &(OS_UNFAIR_LOCK_INIT);
    

    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        DLog(@"线程1 准备上锁");
        os_unfair_lock_lock(unfairlock);
        sleep(4);        
        DLog(@"线程1");
        os_unfair_lock_unlock(unfairlock);
        DLog(@"线程1 解锁成功");
        NSLog(@"--------------------------------------------------------");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        DLog(@"线程2 准备上锁");
        os_unfair_lock_lock(unfairlock);
        DLog(@"线程2");
        os_unfair_lock_unlock(unfairlock);
        DLog(@"线程2 解锁成功");
        NSLog(@"--------------------------------------------------------");
    });
}
@end
