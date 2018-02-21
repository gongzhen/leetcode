//
//  LC543.m
//  LC
//
//  Created by ULS on 2/14/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC543.h"
#import "TreeNode.h"

@interface LC543()

- (NSInteger)diameterOfBinaryTree:(TreeNode *)root;

@end

@implementation LC543

- (NSInteger)diameterOfBinaryTree:(TreeNode *)root {
    int max = 0;
    [self dfs:root max:&max];
    return max;
}

- (NSInteger)dfs:(TreeNode *)node max:(int *)max{
    if(node == NULL) {
        return 0;
    }
    
    NSInteger left = [self dfs:node.left max:max];
    NSInteger right = [self dfs:node.right max:max];
    *max = (int)MAX(*max, (left + right));
    //// return left + right + 1; //// Don't return left + right + 1
    return MAX(left, right) + 1; /// Return left and right's max.
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
    DLog(@"d: %ld", [self diameterOfBinaryTree:node1]); /// 3
}

@end
