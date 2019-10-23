//
//  ConsumerProducer.m
//  LC
//
//  Created by Zhen Gong on 10/8/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "ConsumerProducer.h"

@interface ConsumerProducer()

@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) dispatch_semaphore_t semaphore;

@end

@implementation ConsumerProducer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
        self.semaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)test {
    NSTimer *timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(produceFuncWithNumber:) userInfo:nil repeats:YES];
    NSRunLoop *currentLoop = [NSRunLoop currentRunLoop];
    
    [currentLoop addTimer:timer forMode:NSRunLoopCommonModes];
    [currentLoop run];
    [timer fire];
}

- (void)produceFuncWithNumber:(NSInteger)number {
    number = random() % 10;
    dispatch_queue_t queue = dispatch_queue_create("produceFunc", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        [self.array addObject:@(number)];
        NSLog(@"生产了%lu 个",(unsigned long)self.array.count);
        dispatch_semaphore_signal(self.semaphore);
    });
    [self consumerFunc];
}

//消费者
- (void)consumerFunc{
    dispatch_queue_t t1 = dispatch_queue_create("consumerFunc", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(t1, ^{
        while (YES) {
            if (self.array.count > 0) {
                dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
                NSLog(@"消费了%lu 个",(unsigned long)self.array.count);
                [self.array removeLastObject];
                [self reload];
                dispatch_semaphore_signal(self.semaphore);
            } else {
                NSLog(@"没有消费%lu 个",(unsigned long)self.array.count);
                [self reload];
            }
        }
    });
}

-(void)reload{
    NSLog(@"休眠1秒");
    sleep(1);
}

@end
