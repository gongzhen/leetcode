//
//  DispatchBarrierAsyncTest.m
//  LC
//
//  Created by Zhen Gong on 5/17/18.
//  Copyright © 2018 ULS. All rights reserved.
//  https://www.jianshu.com/p/fbe6a654604c

#import "DispatchBarrierAsyncTest.h"

@interface DispatchBarrierAsyncTest()

@property(strong, nonatomic)dispatch_queue_t isolationQueue;
@property(strong, nonatomic) NSMutableDictionary *counts;

@end

@implementation DispatchBarrierAsyncTest

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isolationQueue = dispatch_queue_create("com.starming.serialqueue", DISPATCH_QUEUE_CONCURRENT);
        _counts = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)test {
    [self setCount:10 forKey:@"ten"];
}

//改变setter
- (void)setCount:(NSUInteger)count forKey:(NSString *)key
{
    key = [key copy];
    //确保所有barrier都是async异步的
    DLog(@"Before setCount");
    dispatch_barrier_async(self.isolationQueue, ^(){
        if (count == 0) {
            [self.counts removeObjectForKey:key];
        } else {
            self.counts[key] = @(count);
        }
        DLog(@"Executing setCount");
    });
    DLog(@"After setCount");
    [self dispatchBarrierAsyncDemo];
}

- (void)dispatchBarrierAsyncDemo {
    //防止文件读写冲突，可以创建一个串行队列，操作都在这个队列中进行，没有更新数据读用并行，写用串行。
    dispatch_queue_t dataQueue = dispatch_queue_create("com.starming.gcddemo.dataqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(dataQueue, ^{
        [NSThread sleepForTimeInterval:2.f];
        NSLog(@"read data 1");
    });
    dispatch_async(dataQueue, ^{
        NSLog(@"read data 2");
    });
    //等待前面的都完成，在执行barrier后面的
    dispatch_barrier_async(dataQueue, ^{
        NSLog(@"write data 1");
        [NSThread sleepForTimeInterval:1];
    });
    dispatch_async(dataQueue, ^{
        [NSThread sleepForTimeInterval:1.f];
        NSLog(@"read data 3");
    });
    dispatch_async(dataQueue, ^{
        NSLog(@"read data 4");
    });
}

@end
