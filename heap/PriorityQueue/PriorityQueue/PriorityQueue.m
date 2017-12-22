//
//  PriorityQueue.m
//  PriorityQueue
//
//  Created by Admin  on 12/21/17.
//  Copyright © 2017 Admin . All rights reserved.
//  https://github.com/raywenderlich/swift-algorithm-club/blob/master/Heap/Heap.swift
//  https://github.com/atljeremy/PriorityQueue-ObjC/blob/master/PriorityQueue/PriorityQueue.m
//  http://blog.csdn.net/WEN525765/article/details/38293781

#import "PriorityQueue.h"
#import <limits.h>

static const int DEFAULT_INITIAL_CAPACITY = 11;
@interface PriorityQueue()

@property(assign, nonatomic)NSUInteger modCount;
@property(assign, nonatomic)NSUInteger size;
@property(copy, nonatomic) NSMutableArray* queue;

@end

@implementation PriorityQueue

- (instancetype)init {
    if(self = [super init]) {
        _size = 0;
        _modCount = 0;
        _queue = [NSMutableArray arrayWithCapacity:DEFAULT_INITIAL_CAPACITY];
        for(NSInteger i = 0; i < DEFAULT_INITIAL_CAPACITY; i++) {
            [_queue addObject:[NSNull null]];
        }
    }
    return self;
}

- (NSNumber *)poll {
    if(_size == 0) {
        return nil;
    }
    
    NSInteger s = --_size;
    _modCount++;
    NSNumber *result = _queue[0];
    NSNumber *x = _queue[s];
    [_queue removeObjectAtIndex:s];
    [_queue replaceObjectAtIndex:s withObject:[NSNull null]];
    if(s != 0) {
        //siftDown(0, x);
        [self siftDown:0 x:x];
    }
    return result;
}

- (Boolean)offer:(NSNumber *)e {
    if(e == nil) {
        NSException *e = [NSException exceptionWithName:@"NullPointerException"
                                                 reason:@"object is null"
                                               userInfo:nil];
        @throw e;
    }
    
    _modCount++;
    NSUInteger i = _size;
    if(i >= _queue.count) {
        //grow(i + 1);
    }
    _size = i + 1;
#if kIsProductionEnvironment == 0
    DLog(@"_size:%ld", _size);
#endif
    if(i == 0) {
        _queue[0] = e;
    } else {
        // shiftUp(i, e);
        [self shiftUp:i x:e];
    }
    return true;
}

- (Boolean)isEmpty {
    return _size == 0;
}

- (void)grow:(NSInteger)minCapacity {
    NSInteger oldCapacity = _queue.count;
    NSInteger newCapacity = oldCapacity + ((oldCapacity < 64) ? (oldCapacity + 2) : (oldCapacity >> 1));
    
    if(newCapacity < 0) {
        newCapacity = LONG_MAX;
    }
    
    if(newCapacity < minCapacity) {
        newCapacity = minCapacity;
    }
    // Arrays.copyOf(queue, newCapacity);
}

- (void)shiftUp:(NSInteger)k x:(NSNumber *)x {
    // comparator != nil
    [self siftUpComparable:k x:x];
}

- (void)siftUpComparable:(NSInteger)k x:(NSNumber *)x {
#if kIsProductionEnvironment == 0
    DLog(@"k:%ld", k);DLog(@"x:%@", x);
#endif
    while( k > 0) {
        NSInteger parent = (k - 1) / 2;
        NSNumber *e = _queue[parent];
        if([x integerValue] > [e integerValue]) {
            break;
        }
        _queue[k] = e;
        k = parent;
    }
    _queue[k] = x;
}

- (void)siftDown:(int)k x:(NSNumber *)x {
    // comparator != nil
    [self siftDownComparable:k x:x];
}

- (void)siftDownComparable:(NSInteger)k x:(NSNumber *)x {
    NSInteger half = _size / 2;

#if kIsProductionEnvironment == 0
    DLog(@"_size:%ld", _size);
#endif
    
    while(k < half) {
        NSInteger child = (k * 2) + 1;
        NSNumber *c = _queue[child];
        
        NSInteger right = child + 1;
        if(right < _size && [c integerValue] > [_queue[right] integerValue]) {
            c = _queue[right];
        }
        
        if([x integerValue] < [c integerValue]) {
            break;
        }
        _queue[k] = c;
        k = child;
    }
#if kIsProductionEnvironment == 0
    DLog(@"k:%ld", [x integerValue]);
#endif
    _queue[k] = x;
}

@end
