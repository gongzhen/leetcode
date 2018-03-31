//
//  PriorityQueue.h
//  LC
//
//  Created by ULS on 3/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PriorityQueue <__covariant ObjectType> : NSObject

@property (copy, nonatomic) NSComparator comparator;

- (instancetype)initWithCapacity:(NSInteger)capacity;
- (instancetype)init;
- (BOOL)offer:(ObjectType)e;
- (ObjectType)poll;
- (ObjectType)peek;
- (BOOL)isEmpty;
- (void)testPQ;
- (void)printPQ;


@end
