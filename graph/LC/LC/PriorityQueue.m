//
//  PriorityQueue.m
//  LC
//
//  Created by ULS on 3/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "PriorityQueue.h"
#define TESTPQ NO

@interface PriorityQueue()

@property (assign) NSInteger size;

- (BOOL)offer:(id)e;
- (id)poll;

@end

@implementation PriorityQueue {
    void **_pointer;
}

static int DEFAULT_INITIAL_CAPACITY = 11;

+ (instancetype)queue {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init {
    if(self = [super init]) {
        _pointer = (void **)malloc(DEFAULT_INITIAL_CAPACITY * sizeof(void *));
        _size = 0;
    }
    return self;
}

- (instancetype)initWithCapacity:(NSInteger)capacity {
    if(self = [super init]) {
        _size = 0;
        _pointer = (void **)malloc(capacity * sizeof(void *));
    }
    return self;
}

- (void)dealloc {
    for(int i = 0; i < _size; i++) {
        free(_pointer[i]);
    }
    free(_pointer);
    DLog(@"PriorityQueue _pointer dealloc");
}

- (BOOL)offer:(id)e {
    if(e == NULL) {
        return NO;
    }
    NSInteger i = _size;
    if(i >= _size) {
        /// grow
        // [self grow:(i + 1)];
    }
    _size = i + 1;
    if(i == 0) {
        // [_queue addObject:e];
        _pointer[0] = (__bridge void *)(e);
        // both fixed.
        // _pointer[0] = CFBridgingRetain(e);
    } else {
        /// siftUp
        [self siftUp:i x:e];
    }
    return YES;
}

- (id)poll {
    if(self.size == 0) {
        return NULL;
    }
    
    NSInteger s = --_size;
//    Interval *result = [_queue objectAtIndex:0];
    id result = (__bridge id)(_pointer[0]);
//    Interval *x = [_queue objectAtIndex:s];
    id x = (__bridge id)(_pointer[s]);
    _pointer[s] = NULL;
//    [_queue removeObjectAtIndex:s];
    if(s != 0) {
        // siftDown
        [self siftDown:0 x:x];
    }
    return result;
}

- (BOOL)isEmpty {
    return _size == 0;
}


//// private methods

- (void)siftUp:(NSInteger)idx x:(id)x {
    ///todo: comparator
    [self siftUpComparable:idx x:x];
}

- (void)siftDown:(NSInteger)idx x:(id)x {
    /// todo comparator
    [self siftDownComparable:idx x:x];
}

- (void)siftUpComparable:(NSInteger)idx x:(id)x {
    id key = x;
#if TESTPQ == YES
    
#endif
    
    while(idx > 0) {
        NSInteger parent = (idx - 1) / 2;
        id e = (__bridge id)(_pointer[parent]);
#if TESTPQ == YES
        
#endif
        if([self compareObject:key toObject:e] > 0) { /// new value larger than parent value, then break and insert to the last.
            break;
        }
        _pointer[idx] = (__bridge void *)(e);
#if TESTPQ == YES
#endif
        idx = parent;
    }
#if TESTPQ == YES
#endif
    _pointer[idx] = (__bridge void *)(key);
#if TESTPQ == YES
#endif
}

- (void)siftDownComparable:(NSInteger)idx x:(id)x {
    NSInteger half = self.size / 2;
    id key = x;
    while (idx < half) {
        NSInteger leftChild = idx * 2 + 1;
        id leftCh = (__bridge id)(_pointer[leftChild]);
        NSInteger rightChild = leftChild + 1;
        // leftCh.end > [_queue objectAtIndex:rightChild].end
        if(rightChild < self.size &&  [self compareObject:leftCh toObject:(__bridge id _Nonnull)(_pointer[rightChild])] > 0) {
            leftChild = rightChild;
            // leftCh = [_queue objectAtIndex:leftChild];
            leftCh = (__bridge id)(_pointer[leftChild]);
        }
        // if(x.end <= leftCh.end) {
        if ([self compareObject:key toObject:leftCh] <= 0) {
            break;
        }
        // [_queue replaceObjectAtIndex:idx withObject:leftCh];
        _pointer[idx] = (__bridge void *)(leftCh);
        idx = leftChild;
    }
    // [_queue replaceObjectAtIndex:idx withObject:x];
    _pointer[idx] = (__bridge void *)(key);
}

- (NSComparisonResult)compareObject:(id)e1 toObject:(nonnull id)e2 {
    if([e1 isKindOfClass:[NSNumber class]] && [e2 isKindOfClass:[NSNumber class]]) {
        return [self compareNSNumbers:e1 toObject:e2];
    } else if([e1 isKindOfClass:[NSString class]] && [e2 isKindOfClass:[NSString class]]) {
        return [self compareNSString:e1 toObject:e2];
    }
    return -2;
}

- (NSComparisonResult)compareNSNumbers:(NSNumber *)e1 toObject:(NSNumber *)e2 {
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [sort compareObject:e1 toObject:e2];
}


- (NSComparisonResult)compareNSString:(NSString *)e1 toObject:(NSString *)e2 {
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [sort compareObject:e1 toObject:e2];
}

- (void)testPQ {
    PriorityQueue *pq = [[PriorityQueue alloc] initWithCapacity:5];
    [pq offer:@1];
    [pq offer:@2];
    [pq offer:@3];
    [pq offer:@4];
    [pq offer:@5];
    
    while(pq.size != 0) {
        DLog(@"pq = > %d", [[pq poll] intValue]);
    }
}

- (void)printPQ {
    for(int i = 0; i < _size; i++) {
        DLog(@"%@", _pointer[i]);
    }
}

@end
