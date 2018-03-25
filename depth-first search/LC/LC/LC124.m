//
//  LC124.m
//  LC
//
//  Created by ULS on 3/24/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC124.h"
#import "LCTreeNode.h"

@interface LC124()

- (int)maxPathSum:(LCTreeNode *)root;

@end

@implementation LC124

- (int)maxPathSum:(LCTreeNode *)root {
    long int max = IntegerMIN;
    printf("%ld\n", max);
    [self dfs:root max:&max];
    return (int)max;
}

- (long)dfs:(LCTreeNode *)node max:(long *)max{
    if(node == NULL) {
        return 0;
    }
    long left = [self dfs:node.left max:max];
    long right = [self dfs:node.right max:max];
    *max = MAX(*max, left + right + node.val);
    printf("%ld\n", *max);
    return MAX(left, right) + (long)node.val;
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
    DLog(@"res:%d", [self maxPathSum:node1]); /// 11
}
@end
