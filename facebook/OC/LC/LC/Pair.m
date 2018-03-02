//
//  Pair.m
//  LC
//
//  Created by Admin  on 3/1/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "Pair.h"

@implementation Pair

- (instancetype)initWith:(int)x y:(int)y {
    if(self = [super init]) {
        _x = x;
        _y = y;
    }
    return self;
}

@end
