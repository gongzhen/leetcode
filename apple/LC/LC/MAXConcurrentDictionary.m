//
//  MAXConcurrentDictionary.m
//  LC
//
//  Created by Zhen Gong on 8/26/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "MAXConcurrentDictionary.h"

@interface MAXConcurrentDictionary ()

@property (nonatomic, strong) NSMutableDictionary *internalDictionary;
@property (nonatomic, strong) NSMutableOrderedSet *enumeratorOrderedSet;
@property (nonatomic, strong) dispatch_queue_t _Nonnull queue;

@end

@implementation MAXConcurrentDictionary

#pragma mark - NSDictionary & NSMutableDictionary required overrides
// https://stackoverflow.com/questions/4789852/subclassing-nsmutabledictionary

- (instancetype)init {
    if (self = [super init]) {
        _internalDictionary = [NSMutableDictionary new];
        _enumeratorOrderedSet = [NSMutableOrderedSet new];
        _queue = dispatch_queue_create("com.MAXConcurrentDictionary", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (instancetype)initWithCapacity:(NSUInteger)numItems {
    if (self = [super initWithCapacity:numItems]) {
        _internalDictionary = [NSMutableDictionary new];
        _enumeratorOrderedSet = [NSMutableOrderedSet new];
        _queue = dispatch_queue_create("com.MAXConcurrentDictionary", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

/// read
- (NSUInteger)count {
    __block NSUInteger count = 0;
    dispatch_sync(self.queue, ^{
        count = self.internalDictionary.count;
    });
    return count;
}

/// read
- (id)objectForKey:(NSString *)aKey {
    __block id obj = nil;
    dispatch_sync(self.queue, ^{
        obj = self.internalDictionary[aKey];
    });
    return obj;
}

/// read
- (id)objectForKeyedSubscript:(id)key {
    __block id obj = nil;
    dispatch_sync(self.queue, ^{
        obj = self.internalDictionary[key];
    });
    return obj;
}

/// write
- (void)setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    dispatch_sync(self.queue, ^{
        self.internalDictionary[key] = obj;
        [self.enumeratorOrderedSet addObject:key];
    });
}

/// write
- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    dispatch_sync(self.queue, ^{
        self.internalDictionary[aKey] = anObject;
        [self.enumeratorOrderedSet addObject:aKey];
    });
}

/// write
- (void)removeObjectForKey:(id)aKey {
    dispatch_sync(self.queue, ^{
        [self.internalDictionary removeObjectForKey:aKey];
        [self.enumeratorOrderedSet removeObject:aKey];
    });
}

- (NSEnumerator *)keyEnumerator {
    return [self.enumeratorOrderedSet objectEnumerator];
}

@end
