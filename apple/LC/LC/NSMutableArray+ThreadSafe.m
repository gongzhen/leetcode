//
//  NSMutableArray+ThreadSafe.m
//  LC
//
//  Created by Zhen Gong on 10/4/19.
//  Copyright © 2019 ULS. All rights reserved.
//
// https://basememara.com/creating-thread-safe-arrays-in-swift/
// https://stackoverflow.com/questions/40574606/extension-for-category-nsmutablearray-objective-c

#import "NSMutableArray+ThreadSafe.h"

@interface NSMutableArray()

@property (nonatomic, strong) dispatch_queue_t concurrentQueue;

@end

@implementation NSMutableArray(ThreadSafe)

- (instancetype)initForThreadSafe {
    if (self = [self init]) {
        self.concurrentQueue = dispatch_queue_create("threadsafe.concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (id)first{
    __block id first = nil;
    if (self.count == 0) {
        return nil;
    }
    dispatch_sync(self.concurrentQueue, ^{
        first = [self objectAtIndex:0];
    });
    return first;
}

- (id)last{
    __block id first = nil;
    NSUInteger length = self.count;
    if (length == 0) {
        return nil;
    }
    dispatch_sync(self.concurrentQueue, ^{
        first = [self objectAtIndex:length - 1];
    });
    return first;
}

- (void)append:(id)element {
    dispatch_barrier_async(self.concurrentQueue, ^{
        [self addObject:element];
    });
}

- (void)append:(id)element atIndex:(NSUInteger)index {
    if (index >= self.count) {
        return;
    }
    dispatch_barrier_async(self.concurrentQueue, ^{
        [self insertObject:element atIndex:index];
    });
}

@end
