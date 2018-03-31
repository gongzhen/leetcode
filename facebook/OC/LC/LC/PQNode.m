//
//  PQNode.m
//  LC
//
//  Created by ULS on 3/31/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "PQNode.h"

@implementation PQNode

- (instancetype)initWithRow:(int)row col:(int)col val:(int)val {
    if(self = [super init]) {
        _row = row;
        _col = col;
        _val = val;
    }
    return self;
}

@end
