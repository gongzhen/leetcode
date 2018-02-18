//
//  LC98.m
//  LC
//
//  Created by ULS on 2/17/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC98.h"
#import "TreeNode.h"

@interface LC98()

- (BOOL)isValidBST:(TreeNode *)node;

@end

@implementation LC98

- (BOOL)isValidBST:(TreeNode *)node {
    /// pass TreeNode* min and max.
    return [self dfs:node min:NULL max:NULL];
}

- (BOOL)dfs:(TreeNode *)node min:(TreeNode *)min max:(TreeNode *)max {
    if(node == NULL) {
        return YES;
    }
    
    if((min && node.val <= min.val) || (max && node.val >= max.val)) {
        return NO;
    }
    /// && don't use ||.
    return [self dfs:node.left min:min max:node] && [self dfs:node.right min:node max:max];
}

// wrong way.
//- (BOOL)isValidBST:(TreeNode *)node {
//    if(node == NULL) {
//        return YES;
//    }
//
//    if(node.left != NULL) {
//        if(node.val <= node.left.val) {
//            return false;
//        } else {
//            return [self isValidBST:node.left];
//        }
//    }
//}

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
    DLog(@"d: %d", [self isValidBST:node1]); /// 0
}

@end
