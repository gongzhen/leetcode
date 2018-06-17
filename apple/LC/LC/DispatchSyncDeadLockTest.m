//
//  DispatchSyncDeadLockTest.m
//  LC
//
//  Created by Zhen Gong on 6/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "DispatchSyncDeadLockTest.h"
// https://blog.csdn.net/kongdeqin/article/details/53171678
// https://blog.csdn.net/bravegogo/article/details/51152907
/*
 首先答案是会发生死锁，我们看看官方文档关于dispatch_sync的解释：
 
 Submits a block to a dispatch queue like dispatch_async(), however
 dispatch_sync() will not return until the block has finished.
 
 Calls to dispatch_sync() targeting the current queue will result
 in dead-lock. Use of dispatch_sync() is also subject to the same
 multi-party dead-lock problems that may result from the use of a mutex.
 Use of dispatch_async() is preferred.
 
 Unlike dispatch_async(), no retain is performed on the target queue. Because
 calls to this function are synchronous, the dispatch_sync() "borrows" the
 reference of the caller.
 
 As an optimization, dispatch_sync() invokes the block on the current
 thread when possible.
 
 如果dispatch_sync()的目标queue为当前queue，会发生死锁(并行queue并不会)。使用dispatch_sync()会遇到跟我们在pthread中使用mutex锁一样的死锁问题。
 

 */
@implementation DispatchSyncDeadLockTest

- (void)test {
    NSLog(@"1");
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"2");
//    });
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_sync(queue, ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}
@end
