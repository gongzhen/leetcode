//
//  GCDTest.m
//  LC
//
//  Created by ULS on 4/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "GCDTest.h"

@implementation GCDTest

- (void)test {
    /// test gcd group
    [self testGCDGroup];
}

- (void)testGCDGroup {
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 10000; index ++) {
        }
        NSLog(@"完成了任务1");
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 20000; index ++) {
        }
        NSLog(@"完成了任务2");
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 200000; index ++) {
        }
        NSLog(@"完成了任务3");
        
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 400000; index ++) {
        }
        NSLog(@"完成了任务4");
        
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 1000000; index ++) {
        }
        NSLog(@"完成了任务5");
        
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        // 等前面的异步操作都执行完毕后，回到主线程...
        NSLog(@"都完成了");
    });
    
}

@end
