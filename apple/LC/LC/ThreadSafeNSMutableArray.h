//
//  ThreadSafeNSMutableArray.h
//  LC
//
//  Created by Zhen Gong on 6/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC.h"

@interface ThreadSafeNSMutableArray : NSObject

- (void)addObject:(_Nonnull id)anObject;
- (void)insertObject:(_Nonnull id)anObject atIndex:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(_Nonnull id)anObject;
- (NSUInteger)count;
- (_Nonnull id)objectAtIndex:(NSUInteger)index;
- (_Nonnull instancetype)init NS_DESIGNATED_INITIALIZER;
- (_Nonnull instancetype)initWithCapacity:(NSUInteger)numItems NS_DESIGNATED_INITIALIZER;
- (void)iterateArray;
@end
