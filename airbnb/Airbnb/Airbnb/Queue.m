//
//  Queue.m
//  Airbnb
//
//  Created by Zhen Gong on 9/18/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import "Queue.h"

// Private extension, typically hidden in the main implementation file.
@interface Queue()
{
    NSInteger _capacity;
    NSMutableArray* _mutArray;
    dispatch_queue_t _dispatchQueue;
}

@end

@implementation Queue

- (instancetype)initWith:(NSInteger)capacity
{
    if (self = [super init]) {
        _capacity = capacity;
        _mutArray = [NSMutableArray array];
        _dispatchQueue = dispatch_queue_create_with_target("dispatch_serial_queue", DISPATCH_QUEUE_SERIAL, DISPATCH_TARGET_QUEUE_DEFAULT);
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"queue is released.");
}

- (BOOL)offer:(id)e
{
    __block BOOL addElement;
    dispatch_sync(_dispatchQueue, ^{
        NSLog(@"%@", self->_dispatchQueue);
        addElement = [self add:e];
    });
    return addElement;
}

- (id)poll
{
    if (_mutArray == nil || _mutArray.count == 0) {
        return nil;
    }
    __block id lastObj = nil;
    dispatch_sync(_dispatchQueue, ^{
        lastObj = [self->_mutArray objectAtIndex:self->_mutArray.count - 1];
        [self->_mutArray removeObjectAtIndex:self->_mutArray.count - 1];
    });
    return lastObj;
}

- (NSUInteger)size
{
    return _mutArray.count;
}

- (void)printQueue
{
    if (_mutArray == nil || _mutArray.count == 0) {
        return;
    }
    [_mutArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@", obj);
    }];
}

- (BOOL)add:(id)e
{
    [self addLast:e];
    return YES;
}

- (void)addLast:(id)element {
    if (_mutArray.count + 1 > _capacity) {
        [_mutArray removeObjectAtIndex:0];
    }
    [_mutArray addObject:element];
}

@end
