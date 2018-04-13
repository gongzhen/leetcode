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
    // [self testGCDGroup2];
}

- (void)testGCDGroup2{
    /// https://www.jianshu.com/p/6faea7ef35bc
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"group one start");
    dispatch_group_async(group, queue, ^{
        dispatch_async(queue, ^{
            sleep(5); //这里线程睡眠1秒钟，模拟异步请求
            NSLog(@"group one finish");
        });
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"group finished");
    });
}

- (void)testGCDGroup {
    /// https://knightsj.github.io/2017/01/13/%E6%B5%85%E6%98%BE%E6%98%93%E6%87%82%E8%AE%B2%E8%A7%A3%E7%9A%84iOS%E5%A4%9A%E7%BA%BF%E7%A8%8B%E6%8A%80%E6%9C%AF-GCD/
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 100; index ++) {
        }
        NSLog(@"完成了任务1");
    });

    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 200; index ++) {
        }
        NSLog(@"完成了任务2");
    });

    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 2000; index ++) {
        }
        NSLog(@"完成了任务3");
        
    });

    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 400; index ++) {
        }
        NSLog(@"完成了任务4");
        
    });

    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 1000000; index ++) {
        }
        NSLog(@"完成了任务5");
        
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 等前面的异步操作都执行完毕后，回到主线程...
        NSLog(@"都完成了");
    });
    int i = 0;
    while(i != 10000000) {
        i++;
    }
    NSLog(@"group is over.");
    
}

@end
