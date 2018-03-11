//
//  Stack.h
//  LC
//
//  Created by ULS on 3/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

- (instancetype)initWithCapacity:(NSInteger)initialCapacity capacityIncrement:(NSInteger)capacityIncrement;
- (instancetype)initWithCapacity:(NSInteger)initialCapacity;
- (instancetype)init;
- (id)push:(id)obj;
- (id)pop;
- (id)peek;
- (BOOL)empty;
- (NSInteger)size;

@end
