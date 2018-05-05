//
//  LC253.m
//  LC
//
//  Created by ULS on 2/11/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC253.h"
#import "Interval.h"
#define TESTPQ NO

@interface LC253PriorityQueue:NSObject

@property(nonatomic, copy) NSMutableArray<Interval *>* queue;
@property (assign) NSInteger size;

- (BOOL)offer:(Interval *)e;
- (Interval *)poll;

@end

@implementation LC253PriorityQueue

- (instancetype)initWithCapacity:(NSInteger)capacity {
    if(self = [super init]) {
        _queue = [[NSMutableArray alloc] initWithCapacity:capacity];
        _size = 0;
    }
    return self;
}

- (BOOL)offer:(Interval *)e {
    if(e == NULL) {
        return NO;
    }
    NSInteger i = _size;
    if(i >= _queue.count) {
        /// grow
        [self grow:(i + 1)];
    }
    _size = i + 1;
    if(i == 0) {
        [_queue addObject:e];
    } else {
        /// siftUp
        [self siftUp:i x:e];
    }
    return YES;
}

- (Interval *)poll {
    if(self.size == 0) {
        return NULL;
    }
    
    NSInteger s = --_size;
    Interval *result = [_queue objectAtIndex:0];
    Interval *x = [_queue objectAtIndex:s];
    [_queue removeObjectAtIndex:s];
    if(s != 0) {
        // siftDown
        [self siftDown:0 x:x];
    }
    return result;
    
}

//// private methods

- (void)siftUp:(NSInteger)idx x:(Interval *)x {
    ///todo: comparator
    [self siftUpComparable:idx x:x];
}

- (void)siftUpComparable:(NSInteger)idx x:(Interval *)x {
    Interval *key = x;
#if TESTPQ == YES
    DLog(@"key start:%ld end:%ld idx:%ld", key.start, key.end, idx);
#endif
    
    while(idx > 0) {
        NSInteger parent = (idx - 1) / 2;
        Interval *e = [_queue objectAtIndex:parent];
#if TESTPQ == YES
    DLog(@"e start:%ld end:%ld", e.start, e.end);
#endif
        if(key.end > e.end) { /// new value larger than parent value, then break and insert to the last.
            break;
        }
        if(_queue.count == idx) {
            [_queue addObject:e];
        } else if (_queue.count > idx){
            /// maybe never go here.
            [_queue replaceObjectAtIndex:idx withObject:e];
        }
#if TESTPQ == YES
    DLog(@"e start:%ld end:%ld at idx:%ld", e.start, e.end, idx);
#endif
        idx = parent;
    }
#if TESTPQ == YES
    DLog(@"key start:%ld end:%ld at idx:%ld", key.start, key.end, idx);
#endif
    
    if(_queue.count == idx) {
        [_queue addObject:key];
    } else if (_queue.count > idx){
        [_queue replaceObjectAtIndex:idx withObject:key];
    }
#if TESTPQ == YES
    [_queue enumerateObjectsUsingBlock:^(Interval * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"obj start:%ld end:%ld", obj.start, obj.end);
    }];
    DLog(@"---------------------------------------------")
#endif
}

- (void)grow:(NSInteger)minCapacity {
    if(minCapacity < 0) {
        return;
    }
    NSInteger oldCapacity = _queue.count;
    NSInteger newCapacity = (oldCapacity < 64) ? ((oldCapacity + 1) * 2) : ((oldCapacity / 2) * 3);
    if(newCapacity < 0) {
        /// overflow
        newCapacity = NSIntegerMax;
    }
    if (newCapacity < minCapacity){
        newCapacity = minCapacity;
    }
    NSArray *tempQueue = [_queue copy];
    _queue = [[NSMutableArray alloc] initWithCapacity:newCapacity];
    __weak LC253PriorityQueue *weakSelf = self;
    [tempQueue enumerateObjectsUsingBlock:^(Interval*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [weakSelf.queue addObject:obj];
    }];
}

- (void)siftDown:(NSInteger)idx x:(Interval *)x {
    /// todo comparator
    [self siftDownComparable:idx x:x];
}

- (void)siftDownComparable:(NSInteger)idx x:(Interval *)x {
    NSInteger half = self.size / 2;
    while (idx < half) {
        NSInteger leftChild = idx * 2 + 1;
        Interval *leftCh = [_queue objectAtIndex:leftChild];
        NSInteger rightChild = leftChild + 1;
        if(rightChild < self.size && leftCh.end > [_queue objectAtIndex:rightChild].end ) {
            leftChild = rightChild;
            leftCh = [_queue objectAtIndex:leftChild];
        }
        if(x.end <= leftCh.end) {
            break;
        }
        [_queue replaceObjectAtIndex:idx withObject:leftCh];
        idx = leftChild;
    }
    [_queue replaceObjectAtIndex:idx withObject:x];
}

@end

@interface LC253()

- (int)minMeetingRooms:(NSArray *) intervals;
- (int)minMeetingRoomsPQ:(NSArray *) intervals;

@end

@implementation LC253

- (int)minMeetingRoomsPQ:(NSArray *) intervals {
    if(intervals.count == 0) {
        return 0;
    }
    [intervals sortedArrayUsingComparator:^NSComparisonResult(Interval * _Nonnull obj1, Interval*  _Nonnull obj2) {
        return (obj1.start - obj2.start);
    }];
    
    LC253PriorityQueue *pq = [[LC253PriorityQueue alloc] initWithCapacity:intervals.count];
    [pq offer:[intervals objectAtIndex:0]];
    
    for(NSInteger i = 1; i < [intervals count]; i++) {
        Interval *interval = [pq poll];
        Interval *next = [intervals objectAtIndex:i];
        if(interval.end <= next.start) {
            interval.end = next.end;
        } else {
            [pq offer:[intervals objectAtIndex:i]];
        }
        [pq offer:interval];
    }
    return (int)pq.size;
}

- (int)minMeetingRooms:(NSArray *) intervals {
    if(intervals.count == 0) {
        return 0;
    }
    
    __block NSMutableArray *start = [NSMutableArray arrayWithCapacity:intervals.count];
    [intervals enumerateObjectsUsingBlock:^(Interval*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [start setObject:@(obj.start) atIndexedSubscript:idx];
    }];
    
    [start sortUsingComparator:^NSComparisonResult(NSNumber*  _Nonnull obj1, NSNumber*  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    __block NSMutableArray *end = [NSMutableArray arrayWithCapacity:intervals.count];
    [intervals enumerateObjectsUsingBlock:^(Interval*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [end setObject:@(obj.end) atIndexedSubscript:idx];
    }];
    
    [end sortUsingComparator:^NSComparisonResult(NSNumber*  _Nonnull obj1, NSNumber*  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    int count = 0;
    int endPtr = 0;
    /// [0,                     30]
    ///    [5, 10], [15, 20]
    /// i   i       i
    /// 0,  5,      15                           start
    ///       10 (end), 20(end),     30            end
    for(NSInteger i = 0; i < [intervals count]; i++) {
        NSInteger startTime = [[start objectAtIndex:i] integerValue];
        NSInteger endTime = [[end objectAtIndex:endPtr] integerValue];
        if(startTime < endTime) {
            count++;
        } else {
            endPtr++;
        }
    }
    return count;
}

- (void)testPQ {
    Interval* in1 = [[Interval alloc] initWith:0 e:30];
    Interval* in2 = [[Interval alloc] initWith:5 e:10];
    Interval* in3 = [[Interval alloc] initWith:15 e:20];
    Interval* in4 = [[Interval alloc] initWith:10 e:15];
    Interval* in5 = [[Interval alloc] initWith:15 e:25];
    LC253PriorityQueue *pq = [[LC253PriorityQueue alloc] initWithCapacity:5];
    [pq offer:in1];
    [pq offer:in2];
    [pq offer:in3];
    [pq offer:in4];
    [pq offer:in5];
    
    while(pq.size != 0) {
        DLog(@"pq = > %ld", [pq poll].end);
    }
}

- (void)test {
    Interval* in1 = [[Interval alloc] initWith:0 e:30];
    Interval* in2 = [[Interval alloc] initWith:5 e:10];
    Interval* in3 = [[Interval alloc] initWith:15 e:20];
    
    NSArray* intervals = @[in1, in2, in3];
    LC253PriorityQueue *pq = [[LC253PriorityQueue alloc] initWithCapacity:intervals.count];
    [pq offer:in1];
    [pq offer:in2];
    [pq offer:in3];
    
    [pq.queue enumerateObjectsUsingBlock:^(Interval * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"obj start:%ld end:%ld", obj.start, obj.end);
    }];
    DLog(@"res: %d", [self minMeetingRooms:intervals]);
    DLog(@"res: %d", [self minMeetingRoomsPQ:intervals]);
}

@end
