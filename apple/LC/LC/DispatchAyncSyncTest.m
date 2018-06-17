//
//  DispatchAyncSyncTest.m
//  LC
//
//  Created by Zhen Gong on 6/13/18.
//  Copyright © 2018 ULS. All rights reserved.
//  https://www.cnblogs.com/ziyi--caolu/p/4900650.html
//

#import "DispatchAyncSyncTest.h"

@interface DispatchAyncSyncTest()

// @property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation DispatchAyncSyncTest

#pragma mark - Private
- (dispatch_queue_t)queue {
    static dispatch_queue_t queue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = dispatch_queue_create("com.gongzhen.dispatch", DISPATCH_QUEUE_CONCURRENT);
    });
    return queue;
}

- (void)test {
//    dispatch_queue_t queue = dispatch_queue_create("com.gongzhen.dispatch", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_sync(self.queue, ^{
            NSLog(@"11  %@",[NSThread currentThread]);
        });
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_sync(self.queue, ^{
            NSLog(@"22  %@",[NSThread currentThread]);
        });
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_sync(self.queue, ^{
            NSLog(@"33  %@",[NSThread currentThread]);
        });
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_sync(self.queue, ^{
            NSLog(@"44  %@",[NSThread currentThread]);
        });
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_sync(self.queue, ^{
            NSLog(@"55  %@",[NSThread currentThread]);
        });
    });
}
@end
