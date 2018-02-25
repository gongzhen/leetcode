//
//  TreeLinkNode.m
//  LC
//
//  Created by ULS on 2/24/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "TreeLinkNode.h"

@implementation TreeLinkNode

- (instancetype)initWith:(NSInteger)x {
    if(self = [super init]) {
        self.val = x;
        self.left = NULL;
        self.right = NULL;
        self.next = NULL;
    }
    return self;
}

@end
