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
//     [self testGCDGroup];
//     [self testGCDGroup2];
//    [self testGCDGroup2_2];
     [self testGCDGroup3];
//    [self testGCDGroup4];
    
}
/// Example from
/// https://knightsj.github.io/2017/01/13/%E6%B5%85%E6%98%BE%E6%98%93%E6%87%82%E8%AE%B2%E8%A7%A3%E7%9A%84iOS%E5%A4%9A%E7%BA%BF%E7%A8%8B%E6%8A%80%E6%9C%AF-GCD/
/// 
- (void)testGCDGroup4 {
    // concurrent queue with async
    dispatch_queue_t queue = dispatch_queue_create("testGCDGroup4", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 10000; index ++) {
        }
        NSLog(@"完成了任务1");
    });
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 20000; index ++) {
        }
        NSLog(@"完成了任务2");
    });
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 200000; index ++) {
        }
        NSLog(@"完成了任务3");
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"--------我是分割线 dispatch_barrier_async--------");
    });
    
    dispatch_barrier_sync(queue, ^{
        NSLog(@"--------我是分割线 dispatch_barrier_sync--------");
    });
    
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 400000; index ++) {
        }
        NSLog(@"完成了任务4");
    });
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 1000000; index ++) {
        }
        NSLog(@"完成了任务5");
    });
    dispatch_async(queue, ^{
        
        for (NSInteger index = 0; index < 1000; index ++) {
        }
        NSLog(@"完成了任务6");
    });
    sleep(5);
    NSLog(@"group is over.");
}

- (void)testGCDGroup3 {
    // concurrent queue with sync
    dispatch_queue_t queue = dispatch_queue_create("testGCDGroup3", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        for (NSInteger index = 0; index < 400000; index ++) {
        }
        NSLog(@"----任务 1---- current thread: %@", [NSThread currentThread]); // NEW THREAD
    });
    dispatch_sync(queue, ^{
        for (NSInteger index = 0; index < 4000; index ++) {
        }
        NSLog(@"----任务 2----- current thread: %@", [NSThread currentThread]); // MAIN THREAD
    });
    dispatch_sync(queue, ^{
        for (NSInteger index = 0; index < 40; index ++) {
        }
        NSLog(@"----任务 3----- current thread: %@", [NSThread currentThread]); // MAIN THREAD
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"----barrier-----");
        NSLog(@"--------我是分割线 dispatch_barrier_async--------");
    });
    
    dispatch_sync(queue, ^{
        for (NSInteger index = 0; index < 4000; index ++) {
        }
        NSLog(@"----任务 4----- current thread: %@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        for (NSInteger index = 0; index < 4000; index ++) {
        }
        NSLog(@"----任务 5----- current thread: %@", [NSThread currentThread]);
    });
    sleep(10);
    NSLog(@"group is over.");
}

- (void)testGCDGroup2{
    /// https://www.jianshu.com/p/6faea7ef35bc
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"group one start");
    dispatch_group_async(group, queue, ^{
        dispatch_async(queue, ^{
            // sleep(5); //这里线程睡眠1秒钟，模拟异步请求
            for(int i = 0; i < 5; i++) {
                sleep(1);
                NSLog(@"group one starting %d", i);
            }
            // NSLog(@"group one finish");
        });
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"group finished");
    });
    sleep(10);
    NSLog(@"group is over.");
}

- (void)testGCDGroup2_2{
    /// https://www.jianshu.com/p/6faea7ef35bc
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"group one start");
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        dispatch_async(queue, ^{
            //这里线程睡眠1秒钟，模拟异步请求
            for(int i = 0; i < 5; i++) {
                sleep(1);
                NSLog(@"group one starting %d", i);
            }
            NSLog(@"group one finish");
            dispatch_group_leave(group);
        });
    });
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"group finished");
    });
    sleep(15);
    NSLog(@"sleep is over.");
}

- (void)testGCDGroup {
    /// https://knightsj.github.io/2017/01/13/%E6%B5%85%E6%98%BE%E6%98%93%E6%87%82%E8%AE%B2%E8%A7%A3%E7%9A%84iOS%E5%A4%9A%E7%BA%BF%E7%A8%8B%E6%8A%80%E6%9C%AF-GCD/
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 10; index ++) {
            NSLog(@"------------完成了任务1------------");
        }
        NSLog(@"完成了任务1");
    });

    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 10; index ++) {
            NSLog(@"------------完成了任务2------------");
        }
        NSLog(@"完成了任务2");
    });

    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 10; index ++) {
            NSLog(@"------------完成了任务3------------");
        }
        NSLog(@"完成了任务3");
        
    });

    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 10; index ++) {
            NSLog(@"------------完成了任务4------------");
        }
        NSLog(@"完成了任务4");
        
    });

    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 执行1个耗时的异步操作
        for (NSInteger index = 0; index < 10; index ++) {
            NSLog(@"------------完成了任务5------------");
        }
        NSLog(@"完成了任务5");
        
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"都完成了");
    });
    sleep(10);
    NSLog(@"group is over.");
    
}

@end
