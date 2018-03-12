//
//  PriorityQueue.h
//  LC
//
//  Created by ULS on 3/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PriorityQueue : NSObject

- (instancetype)initWithCapacity:(NSInteger)capacity;
- (instancetype)init;
- (BOOL)offer:(id)e;
- (id)poll;
- (BOOL)isEmpty;
- (void)testPQ;
- (void)printPQ;

@end
