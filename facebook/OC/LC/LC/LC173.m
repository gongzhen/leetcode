//
//  LC173.m
//  LC
//
//  Created by ULS on 4/2/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC173.h"
#import "NSMutableArray+Stack.h"
#import "LCTreeNode.h"

@interface LC173() {
    NSMutableArray *_stack;
    LCTreeNode* _root;
}

- (BOOL)hasNext;
- (int)next;

@end

@implementation LC173

-(instancetype)initWithRoot:(LCTreeNode *)root {
    if(self = [super init]) {
        _stack = [NSMutableArray array];
        LCTreeNode *ptr = root;
        while(ptr != NULL) {
            [_stack push:ptr];
            ptr = ptr.left;
        }
    }
    return self;
}

- (BOOL)hasNext {
    if(_stack.count == 0) {
        return NO;
    }
    return YES;
}

- (int)next {
    LCTreeNode *top = [_stack pop];
    LCTreeNode *current = top;
    if(current != NULL && current.right != NULL) {
        current = current.right;
        while (current != NULL) {
            [_stack push:current];
            current = current.left;
        }
    }
    return (int)top.val;
}

- (void)test {
    /**
             3
          1      5
            2  4
     */

    while([self hasNext]) {
        DLog(@"next:%d", [self next]);
    }
}

@end
