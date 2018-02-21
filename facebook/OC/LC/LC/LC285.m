//
//  LC285.m
//  LC
//
//  Created by ULS on 2/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC285.h"
#import "TreeNode.h"
#import "NSMutableArray+Stack.h"

@interface LC285()

- (TreeNode *)inorderSuccessor:(TreeNode *)node p:(TreeNode *)p;

@end

@implementation LC285

- (TreeNode *)inorderSuccessor:(TreeNode *)node p:(TreeNode *)p {
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
    TreeNode *node1 = [[TreeNode alloc] initWith:1];
    TreeNode *node2 = [[TreeNode alloc] initWith:2];
    TreeNode *node3 = [[TreeNode alloc] initWith:3];
    TreeNode *node4 = [[TreeNode alloc] initWith:4];
    TreeNode *node5 = [[TreeNode alloc] initWith:5];
    node1.left = node2;
    node1.right = node3;
    node2.left = node4;
    node2.right = node5;
    /// root is node1
    TreeNode *res = [self inorderSuccessor:node1 p:node2];
    DLog(@"res:%ld", res.val);
}

@end
