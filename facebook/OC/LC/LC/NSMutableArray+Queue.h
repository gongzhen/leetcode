//
//  NSMutableArray+Queue.h
//  LC
//
//  Created by ULS on 2/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Queue)

+ (instancetype)queue;
- (void)offer:(id)obj;
- (id)poll;
- (id)peek;

@end
