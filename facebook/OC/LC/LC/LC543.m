//
//  LC543.m
//  LC
//
//  Created by ULS on 2/14/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC543.h"
#import "LCTreeNode.h"

@interface LC543()

- (NSInteger)diameterOfBinaryTree:(LCTreeNode *)root;

@end

@implementation LC543

- (NSInteger)diameterOfBinaryTree:(LCTreeNode *)root {
    int max = 0;
    [self dfs:root max:&max];
    return max;
}

- (NSInteger)dfs:(LCTreeNode *)node max:(int *)max{
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
    LCTreeNode *node1 = [[LCTreeNode alloc] initWith:1];
    LCTreeNode *node2 = [[LCTreeNode alloc] initWith:2];
    LCTreeNode *node3 = [[LCTreeNode alloc] initWith:3];
    LCTreeNode *node4 = [[LCTreeNode alloc] initWith:4];
    LCTreeNode *node5 = [[LCTreeNode alloc] initWith:5];
    LCTreeNode *node6 = [[LCTreeNode alloc] initWith:6];
    LCTreeNode *node7 = [[LCTreeNode alloc] initWith:7];
    node1.left = node2;
    node1.right = node3;
    node2.left = node4;
    node2.right = node5;
    node4.right = node6;
    node5.left = node7;
    DLog(@"d: %ld", [self diameterOfBinaryTree:node1]); /// 3
}

@end
