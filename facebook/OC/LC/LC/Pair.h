//
//  Pair.h
//  LC
//
//  Created by Admin  on 3/1/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pair : NSObject

@property(assign)int x;
@property(assign)int y;

- (instancetype)initWith:(int)x y:(int)y;

@end
