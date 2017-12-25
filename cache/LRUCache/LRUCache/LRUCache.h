//
//  LRUCache.h
//  LRUCache
//
//  Created by Zhen Gong on 12/25/17.
//  Copyright © 2017 Zhen Gong. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LRUCacheDelegate;
@protocol LRUEntry;

@interface LRUCache : NSObject <NSFastEnumeration>

@property (nonatomic, weak, nullable) id<LRUCacheDelegate> delegate;
@property (nonatomic, readonly, nullable) id<LRUEntry> headEntry;
@property (nonatomic, readonly, nullable) id<LRUEntry> tailEntry;

- (NSUInteger)numberOfEntries;
- (nullable NSArray<id<LRUEntry>> *)allEntries;

- (void)addEntry:(nullable id<LRUEntry>)entry;

- (void)appendEntry:(nullable id<LRUEntry>)entry;

- (void)removeEntry:(nullable id<LRUEntry>)entry;

- (nullable id<LRUEntry>)removeTailEntry;

- (void)clearAllEntries;
@end

@protocol LRUCacheDelegate

@optional
- (void)cache:(nullable LRUCache *)cache didEvictEntry:(nullable id <LRUEntry>)entry;
- (BOOL)cache:(nullable LRUCache *)cache canEvictEntry:(nullable id <LRUEntry>)entry;

@end

@protocol LRUEntry <NSObject>

- (NSString *_Nullable)LRUEntryIdentifier;
- (BOOL)shouldAccessMoveLRUEntryToHead;

@property (nonatomic, nullable) id<LRUEntry> nextLRUEntry;
@property (nonatomic, nullable, weak) id <LRUEntry> previousLRUEntry;

@end
