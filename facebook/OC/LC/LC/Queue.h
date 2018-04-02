//
//  Queue.h
//  LC
//
//  Created by ULS on 2/22/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Entry;

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
