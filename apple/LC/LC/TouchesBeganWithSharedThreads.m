//
//  TouchesBeganWithSharedThreads.m
//  LC
//
//  Created by Zhen Gong on 6/30/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "TouchesBeganWithSharedThreads.h"

@interface TouchesBeganWithSharedThreads()

@property(assign)NSInteger tickets;
@property(strong, nonatomic) dispatch_queue_t queue;

@end

@implementation TouchesBeganWithSharedThreads

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queue = dispatch_queue_create("saleTicketsWithDispatchQueueBarrier", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)test {
    [self touchesBegan:[NSSet set]];
    sleep(100);
    NSLog(@"TouchesBeganWithSharedThreads end here.");
}

- (void)touchesBegan:(NSSet *)touches {
    
    // test 1 without new thread
    self.tickets = 20;
    
//    [self saleTickets];
    // test 2 with adding new thread
    
//    NSThread *t1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicketsWithAddingThreads) object:nil];
//    t1.name = @"售票员 A";
//    [t1 start];
//
//    NSThread *t2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicketsWithAddingThreads) object:nil];
//    t2.name = @"售票员 B";
//    [t2 start];
    
    // test 3 mutul lock for two threads.
    
//    NSThread *t1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicketsWithMutulLockForTwoThreads) object:nil];
//    t1.name = @"售票员 A";
//    [t1 start];
//
//    NSThread *t2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicketsWithMutulLockForTwoThreads) object:nil];
//    t2.name = @"售票员 B";
//    [t2 start];

    
    // test 4 gcd barrier for mutul threads.
    NSThread *t1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicketsWithDispatchQueueBarrier) object:nil];
    t1.name = @"售票员 A";
    [t1 start];

    NSThread *t2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicketsWithDispatchQueueBarrier) object:nil];
    t2.name = @"售票员 B";
    [t2 start];
}

- (void)saleTicketsWithMutulLockForTwoThreads {
    
    while (YES) {
        [NSThread sleepForTimeInterval:1.0];
        
        @synchronized(self) {
            if (self.tickets > 0) {
                self.tickets--;
                NSLog(@"剩余票数 %ld %@", self.tickets, [NSThread currentThread]);
                continue;
            }
        }
        NSLog(@"没票了 %@", [NSThread currentThread]);
        break;
    }
}

- (void)saleTickets {
    while (YES) {
        if (self.tickets > 0) {
            self.tickets--;
            NSLog(@"剩余票数 %ld %@", self.tickets, [NSThread currentThread]);
        } else {
            NSLog(@"没票了 %@", [NSThread currentThread]);
            break;
        }
    }
}

- (void)saleTicketsWithAddingThreads {
    while (YES) {
        // 模拟休眠
        [NSThread sleepForTimeInterval:1.0];
        
        if (self.tickets > 0) {
            self.tickets--;
            NSLog(@"剩余票数 %ld %@", self.tickets, [NSThread currentThread]);
        } else {
            NSLog(@"没票了 %@", [NSThread currentThread]);
            break;
        }
    }
}

- (void)saleTicketsWithDispatchQueueBarrier {    
    dispatch_barrier_async(self.queue, ^{
        while (YES) {
            [NSThread sleepForTimeInterval:1.0];
            if (self.tickets > 0) {
                self.tickets--;
                NSLog(@"剩余票数 %ld %@", self.tickets, [NSThread currentThread]);
            } else {
                NSLog(@"没票了 %@", [NSThread currentThread]);
                break;
            }
        }
    });
}

@end
