//
//  LC236.m
//  LC
//
//  Created by Admin  on 2/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC236.h"
#import "LCTreeNode.h"

@interface LC236()

- (LCTreeNode *)lowestCommonAncestor:(LCTreeNode *)root p:(LCTreeNode *)p q:(LCTreeNode *)q;

@end

@implementation LC236

- (LCTreeNode *)lowestCommonAncestor:(LCTreeNode *)root p:(LCTreeNode *)p q:(LCTreeNode *)q {
    if(root == NULL) {
        return NULL;
    }
    
    if(root == p || root == q) {
        return root;
    }
    
    LCTreeNode *left = [self lowestCommonAncestor:root.left p:p q:q];
    LCTreeNode *right = [self lowestCommonAncestor:root.right p:p q:q];
    
    if(left != NULL && right != NULL) {
        return root;
    } else if (left == NULL && right != NULL) {
        return right;
    } else if (left != NULL && right == NULL) {
        return left;
    }
    return NULL;
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
    
    DLog(@"res:%ld", [self lowestCommonAncestor:node1 p:node3 q:node4].val);
    DLog(@"res:%ld", [self lowestCommonAncestor:node3 p:node1 q:node5].val);
}

@end
