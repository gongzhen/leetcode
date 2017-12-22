//
//  PriorityQueue.h
//  PriorityQueue
//
//  Created by Admin  on 12/21/17.
//  Copyright © 2017 Admin . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PriorityQueue : NSObject

- (Boolean)isEmpty;
- (Boolean)offer:(NSNumber *_Nonnull)e;
- (nullable NSNumber *)poll;

@end
