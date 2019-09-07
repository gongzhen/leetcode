//
//  ColorSetObject.m
//  HooView
//
//  Created by Zhen Gong on 6/29/18.
//  Copyright © 2018 Yahoo. All rights reserved.
//

#import "ColorSetObject.h"

@implementation ColorSetObject

-(instancetype)initWithColor:(NSString *)color count:(NSInteger)count {
    if(self = [super init]) {
        _color = [color copy];
        _count = count;
    }
    return self;
}
@end
