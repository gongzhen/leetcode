//
//  TreeNode.m
//  LC
//
//  Created by ULS on 2/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LCTreeNode.h"

@implementation LCTreeNode

- (instancetype)initWith:(NSInteger)x {
    if(self = [super init]) {
        self.val = x;
        self.left = NULL;
        self.right = NULL;
    }
    return self;
}

@end
