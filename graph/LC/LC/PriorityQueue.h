//
//  PriorityQueue.h
//  LC
//
//  Created by ULS on 3/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PriorityQueue : NSObject

- (BOOL)offer:(id)e;
- (id)poll;
- (void)testPQ;

@end
