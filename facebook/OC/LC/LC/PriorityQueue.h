//
//  PriorityQueue.h
//  LC
//
//  Created by ULS on 3/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PriorityQueue : NSObject

@property (copy, nonatomic) NSComparator comparator;

- (instancetype)initWithCapacity:(NSInteger)capacity;
- (instancetype)init;
- (BOOL)offer:(id)e;
- (id)poll;
- (id)peek;
- (BOOL)isEmpty;
- (void)testPQ;
- (void)printPQ;


@end
