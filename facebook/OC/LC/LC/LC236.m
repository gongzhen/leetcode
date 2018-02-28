//
//  LC236.m
//  LC
//
//  Created by Admin  on 2/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC236.h"
#import "TreeNode.h"

@interface LC236()

- (TreeNode *)lowestCommonAncestor:(TreeNode *)root p:(TreeNode *)p q:(TreeNode *)q;

@end

@implementation LC236

- (TreeNode *)lowestCommonAncestor:(TreeNode *)root p:(TreeNode *)p q:(TreeNode *)q {
    if(root == NULL) {
        return NULL;
    }
    
    if(root == p || root == q) {
        return root;
    }
    
    TreeNode *left = [self lowestCommonAncestor:root.left p:p q:q];
    TreeNode *right = [self lowestCommonAncestor:root.right p:p q:q];
    
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
    TreeNode *node1 = [[TreeNode alloc] initWith:1];
    TreeNode *node2 = [[TreeNode alloc] initWith:2];
    TreeNode *node3 = [[TreeNode alloc] initWith:3];
    TreeNode *node4 = [[TreeNode alloc] initWith:4];
    TreeNode *node5 = [[TreeNode alloc] initWith:5];
    node1.left = node2;
    node1.right = node3;
    node2.left = node4;
    node2.right = node5;
    
    DLog(@"res:%ld", [self lowestCommonAncestor:node1 p:node3 q:node4].val);
    DLog(@"res:%ld", [self lowestCommonAncestor:node3 p:node1 q:node5].val);
}

@end
