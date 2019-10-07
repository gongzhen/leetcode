//
//  Queue.h
//  LC
//
//  Created by ULS on 2/22/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Entry;

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

@property(nonatomic, readonly) NSInteger size;

+ (instancetype)queue;
- (BOOL)offer:(ObjectType)e;
- (ObjectType)poll;
- (ObjectType)removeFirst;
- (ObjectType)remove:(Entry *)e;
- (ObjectType)peek;
- (ObjectType)getFirst;
- (BOOL)add:(id)e;
- (BOOL)isEmpty;
- (void)test;

@end
