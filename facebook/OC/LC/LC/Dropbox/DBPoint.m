//
//  DBPoint.m
//  LC
//
//  Created by Zhen Gong on 11/12/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "DBPoint.h"

@implementation DBPoint

+ (instancetype)pointWithX:(NSInteger)x Y:(NSInteger)y {
    return [[DBPoint alloc] initWithX:x Y:y];
}

- (instancetype)initWithX:(NSInteger)x Y:(NSInteger)y {
    if(self = [super init]) {
        _x = x;
        _y = y;
    }
    return self;
}


@end

@implementation DBSize

+ (instancetype)sizeWithWidth:(NSInteger)width height:(NSInteger)height {
    return [[DBSize alloc] initWithWidth:width height:height];
}

- (instancetype)initWithWidth:(NSInteger)width height:(NSInteger)height {
    if(self = [super init]) {
        _width = width;
        _height = height;
    }
    return self;
}


@end
