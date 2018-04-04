//
//  LC129.m
//  LC
//
//  Created by Admin  on 3/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC129.h"
#import "LCTreeNode.h"
@interface LC129()

- (int)sumNumbers:(LCTreeNode *)root;

@end

@implementation LC129

- (int)sumNumbers:(LCTreeNode *)root {
    return [self dfs:root sum:0];
}

- (int)dfs:(LCTreeNode *)node sum:(int)sum {
    if(node == NULL) {
        return 0;
    }
    if(node.left == NULL && node.right == NULL) {
        DLog(@"node.val:%d sum:%d => 10 * sum:%d", (int)node.val, sum, (int)node.val + 10 * sum);
        return (int)node.val + sum * 10;
    }
    int left = [self dfs:node.left sum:(int)node.val + 10 * sum];
    DLog(@"left:%d", left);
    int right = [self dfs:node.right sum:(int)node.val + 10 * sum];
    DLog(@"right:%d", right);
    return left + right;
}

-(void)test {
    //           1
    //      2         3
    //    4   5
    LCTreeNode *node1 = [[LCTreeNode alloc] initWith:1];
    LCTreeNode *node2 = [[LCTreeNode alloc] initWith:2];
    LCTreeNode *node3 = [[LCTreeNode alloc] initWith:3];
    LCTreeNode *node4 = [[LCTreeNode alloc] initWith:4];
    LCTreeNode *node5 = [[LCTreeNode alloc] initWith:5];
    node1.left = node2;
    node1.right = node3;
    node2.left = node4;
    node2.right = node5;
    DLog(@"res:%d", [self sumNumbers:node1]);
}
@end
