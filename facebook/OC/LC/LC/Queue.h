//
//  Queue.h
//  LC
//
//  Created by ULS on 2/22/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Entry;

@interface Queue : NSObject

+ (instancetype)queue;
- (BOOL)offer:(id)e;
- (id)poll;
- (id)removeFirst;
- (id)remove:(Entry *)e;
- (id)peek;
- (id)getFirst;
- (BOOL)add:(id)e;
- (void)test;

@end
