//
//  NSMutableArray+ThreadSafe.h
//  LC
//
//  Created by Zhen Gong on 10/4/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray<ObjectType> (ThreadSafe)

- (instancetype)initForThreadSafe;
- (ObjectType)first;
- (ObjectType)last;
- (void)append:(ObjectType)element;
- (void)append:(ObjectType)element atIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
