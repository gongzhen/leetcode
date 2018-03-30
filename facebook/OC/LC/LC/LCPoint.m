//
//  LCPoint.m
//  LC
//
//  Created by ULS on 3/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LCPoint.h"

@implementation LCPoint

- (instancetype)initWith:(int)x y:(int)y {
    if(self = [super init]) {
        _x = x;
        _y = y;        
    }
    return self;
}

@end
