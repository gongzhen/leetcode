//
//  TreeNode.m
//  LC
//
//  Created by Admin  on 3/4/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

- (instancetype)initWith:(id)val {
    if(self = [super init]) {
        _val = val;
        _left = NULL;
        _right = NULL;
    }
    return self;
}

@end
