//
//  LRUCache.m
//  LRUCache
//
//  Created by Zhen Gong on 12/25/17.
//  Copyright © 2017 Zhen Gong. All rights reserved.
//

#import "LRUCache.h"

@interface LRUCache ()

@property (nonatomic, readonly, nonnull) NSMutableDictionary <NSString *, id<LRUEntry>> *cache;

@end

NS_INLINE void LRUCacheAssertHeadAndTail(LRUCache *cache)
{
    
}

@implementation LRUCache
{
    NSInteger _mutationCheckInteger;
}

- (instancetype)init
{
    return [self initWithEntries:nil delegate:nil];
}

- (instancetype)initWithEntries:(nullable NSArray *)arrayOfLRUEntries delegate:(nullable id<LRUCacheDelegate>)delegate
{
    if(self = [super init]) {
        _cache = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark setting
- (void)addEntry:(id<LRUEntry>)entry
{
    if(entry == nil) {
        return;
    }
    
    if(entry == _headEntry) {
        return;
    }
    
    NSString *identifier = entry.LRUEntryIdentifier;
    if(identifier == nil) {
        return;
    }
    
    
    _cache[identifier] = entry;
}

#pragma mark private

- (void)moveEntryToFront:(id<LRUEntry>)entry
{
    if(_headEntry == entry) {
        return;
    }
    
    id<LRUEntry> previous = entry.previousLRUEntry;
    
    if(entry == _tailEntry) {
        _tailEntry = previous;
    }
    
    previous.nextLRUEntry = entry.nextLRUEntry;
    entry.nextLRUEntry.previousLRUEntry = previous;
    entry.previousLRUEntry = nil;
    entry.nextLRUEntry = _headEntry;
    _headEntry.previousLRUEntry = entry;
    _headEntry = entry;
    
    _mutationCheckInteger++;
}

@end
