//
//  Queue.h
//  Airbnb
//
//  Created by Zhen Gong on 9/18/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 // https://medium.com/ios-os-x-development/generics-in-objective-c-8f54c9cfbce7
 Similarly, the keyword__contravariant enables us to cast
 Queue<Sup *> to Queue<Sub *> . However, it is not permitted
 to use both __contravariant and __covariant at the same for
 type declaration.
 In conclusion, __covariant is to indicate that subtypes
 are acceptable, and __contravariant to indicate that
 supertypes are acceptable. This can be seen in many cases
 such as the interface of NSArray.
 */

@interface Queue<__covariant ObjectType> : NSObject

- (instancetype)initWith:(NSInteger)capacity;
- (BOOL)offer:(ObjectType)e;
- (NSUInteger)size;
- (nullable ObjectType)poll;
- (void)printQueue;

@end

NS_ASSUME_NONNULL_END
