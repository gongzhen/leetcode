//
//  DispatchSemaphoreTest.m
//  LC
//
//  Created by Zhen Gong on 9/6/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "DispatchSemaphoreTest.h"

@implementation DispatchSemaphoreTest

- (void)test {
    // [self testDispatchSemaphoreTest];
    // [self testDispatchSemaphoreTest_1];
    // [self testDispatchSemaphoreTest_2];
    //  [self testDispatchSemaphoreTest_3];
//    [self testDispatchSemaphoreTest_4];
//     [self testDispatchSemaphoreTest_5];
    [self testDispatchSemaphoreTest_6];
    sleep(15);
}

// https://yq.aliyun.com/articles/27432?spm=a2c4e.11153940.0.0.57f73f97OUUSbr
- (void)testDispatchSemaphoreTest
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(10);
    dispatch_queue_t queue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (int i = 0; i < 15; i++) {
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_group_async(group, queue, ^{
            NSLog(@"print %d", i);
            sleep(2);
            dispatch_semaphore_signal(semaphore);
        });
    }
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
}

/**
 *
 *　　下面再展示一个信号量能实现的示例，而且这个示例是来自面试官的问题
 *　　问题需求：两个异步任务嵌套，如何保证在内部的异步任务先执行？
 *
 *　　本人分析：没指明在什么队列中取出任务，我先假设串行队列。
 *　　如果是串行队列的话，由于串行队列FIFO，先创建的任务肯定先执行，执行完毕之后再执行下一个任务
 *　　如果是串行队列中有两个异步任务嵌套，那么外部的异步任务一定先执行，因为外部的任务先创建，先进队列的，然后因为队列FIFO.
*　　 总结：如果要两个异步任务嵌套，并且保证在内部的异步任务先执行，那么一定需要并发队列。
 
 */
- (void)testDispatchSemaphoreTest_1
{
    // 要解决面试的问题，本人立马想到使用GCD的信号量的知识，下面是本人立马通过代码实现了解决了这个问题：
    
    // 开始让信号量为0,当信号量小于0的时候,当前线程会停下等待
    dispatch_semaphore_t dispatchSemaphore = dispatch_semaphore_create(0);
    dispatch_queue_t queue = dispatch_queue_create("zhengong.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        dispatch_async(queue, ^{
            sleep(2);
            NSLog(@"--1--");
            NSLog(@"%@",[NSThread currentThread]);
            // 发送一个信号量，就会让那个信号量加1
            dispatch_semaphore_signal(dispatchSemaphore);
        });
        // 信号量等待就会让信号量减1
        dispatch_semaphore_wait(dispatchSemaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"--2--");
        NSLog(@"%@",[NSThread currentThread]);
    });
}

- (void)testDispatchSemaphoreTest_2
{
    // https://stackoverflow.com/questions/4326350/how-do-i-wait-for-an-asynchronously-dispatched-block-to-finish
    NSLog(@"%@",[NSThread currentThread]);
    __block BOOL finished = NO;
    dispatch_semaphore_t dispatchSemaphore = dispatch_semaphore_create(0);
    dispatch_queue_t queue = dispatch_queue_create("zhengong.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        int i = 0;
        for (i = 0; i < 5; i++) {
        }
        sleep(3);
        NSLog(@"---- print i here ----:%d", finished);
        NSLog(@"%@",[NSThread currentThread]);
        // 发送一个信号量，就会让那个信号量加1
        finished = YES;
        dispatch_semaphore_signal(dispatchSemaphore);
        NSLog(@"finished: %d", finished);
    });
    NSLog(@"before finished DISPATCH_TIME_FOREVER: %d", finished);
    dispatch_semaphore_wait(dispatchSemaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"after finished DISPATCH_TIME_FOREVER: %d", finished);
}

- (void)testDispatchSemaphoreTest_3
{
    NSArray *values = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K"];
    NSLog(@"%f", CFAbsoluteTimeGetCurrent());
    [self performSelectorWithAttributes:values success:^{
        NSLog(@"Finished all Operations %f", CFAbsoluteTimeGetCurrent());
    }];
}

- (void)performSelectorWithAttributes:(NSArray<NSString *> *)attributes success:(void (^)(void))success
{
    // __block dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    for (NSString *attribute in attributes) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self performOperationWithAttributeAndWait:attribute];
            // dispatch_semaphore_signal(semaphore);
        });
        // dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    }
    success();
}

- (void)performOperationWithAttributeAndWait:(NSString *)attribute
{
    NSLog(@"attribute is %@ at %f", attribute, CFAbsoluteTimeGetCurrent());
}

- (void)testDispatchSemaphoreTest_4
{
    // https://www.jianshu.com/p/643075d84061
    dispatch_semaphore_t signal;
    signal= dispatch_semaphore_create(1);
    __block long x =0;   NSLog(@"0_x:%ld",x);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        sleep(1);
        NSLog(@"waiting");
        x = dispatch_semaphore_signal(signal);
        NSLog(@"1_x:%ld",x);
        sleep(2);
        NSLog(@"waking");
        x = dispatch_semaphore_signal(signal);
        NSLog(@"2_x:%ld",x);
        sleep(3);
        NSLog(@"waking");
        x = dispatch_semaphore_signal(signal);
    });//
    dispatch_time_t duration = dispatch_time(DISPATCH_TIME_NOW, 1*1000*1000*1000); //超时1秒//
    dispatch_semaphore_wait(signal, duration);
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"3_x:%ld",x);
    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"wait 2");
    NSLog(@"4_x:%ld",x);
//    x = dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
//    NSLog(@"wait 3");
//    NSLog(@"5_x:%ld",x);
}

- (void)testDispatchSemaphoreTest_5 {
    NSLog(@"DEMA");
    dispatch_semaphore_t signal = dispatch_semaphore_create(0);
    [self testSemaphore5Block:^{
        NSLog(@"LEMA");
        dispatch_semaphore_signal(signal);
    }];
    dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    NSLog(@"ZEMA");
}

- (void)testSemaphore5Block:(void (^)(void))emptyBlock {
    emptyBlock();
}

// http://dbworku.com/2015/11/29/semphore-in-gcd/
- (void)testDispatchSemaphoreTest_6 {
    dispatch_queue_t defaultQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSUInteger MAX_CONCURRENT = 2;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(MAX_CONCURRENT);
    for(int i = 0; i < 999; i++) {
        dispatch_async(defaultQueue, ^{
            NSLog(@"INTENSIVE TASK %@", [NSThread currentThread]);
            dispatch_semaphore_signal(semaphore);
        });
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    }
}


@end
