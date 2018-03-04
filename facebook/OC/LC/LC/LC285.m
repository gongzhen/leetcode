//
//  LC285.m
//  LC
//
//  Created by ULS on 2/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC285.h"
#import "LCTreeNode.h"
#import "NSMutableArray+Stack.h"

@interface LC285()

- (LCTreeNode *)inorderSuccessor:(LCTreeNode *)node p:(LCTreeNode *)p;

@end

@implementation LC285

- (LCTreeNode *)inorderSuccessor:(LCTreeNode *)node p:(LCTreeNode *)p {
    if(node == nil) {
        return nil;
    }
    BOOL isFound = NO;
    NSMutableArray *stack = [NSMutableArray array];
    while(node != nil || ![stack empty]) {
        while(node != nil) {
            [stack push:node];
            node = node.left;
        }
        node = [stack pop];
        if(isFound) {
            return node;
        }
        if(node.val == p.val) {
            isFound = YES;
        }
        node = node.right;
    }
    return nil;
}

- (void)test {
    LCTreeNode *node1 = [[LCTreeNode alloc] initWith:1];
    LCTreeNode *node2 = [[LCTreeNode alloc] initWith:2];
    LCTreeNode *node3 = [[LCTreeNode alloc] initWith:3];
    LCTreeNode *node4 = [[LCTreeNode alloc] initWith:4];
    LCTreeNode *node5 = [[LCTreeNode alloc] initWith:5];
    node1.left = node2;
    node1.right = node3;
    node2.left = node4;
    node2.right = node5;
    /// root is node1
    LCTreeNode *res = [self inorderSuccessor:node1 p:node2];
    DLog(@"res:%ld", res.val);
}

@end
