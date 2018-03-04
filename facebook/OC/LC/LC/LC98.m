//
//  LC98.m
//  LC
//
//  Created by ULS on 2/17/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC98.h"
#import "LCTreeNode.h"

@interface LC98()

- (BOOL)isValidBST:(LCTreeNode *)node;

@end

@implementation LC98

- (BOOL)isValidBST:(LCTreeNode *)node {
    /// pass LCTreeNode* min and max.
    return [self dfs:node min:NULL max:NULL];
}

- (BOOL)dfs:(LCTreeNode *)node min:(LCTreeNode *)min max:(LCTreeNode *)max {
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
//- (BOOL)isValidBST:(LCTreeNode *)node {
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
    LCTreeNode *node1 = [[LCTreeNode alloc] initWith:1];
    LCTreeNode *node2 = [[LCTreeNode alloc] initWith:2];
    LCTreeNode *node3 = [[LCTreeNode alloc] initWith:3];
    LCTreeNode *node4 = [[LCTreeNode alloc] initWith:4];
    LCTreeNode *node5 = [[LCTreeNode alloc] initWith:5];
    node1.left = node2;
    node1.right = node3;
    node2.left = node4;
    node2.right = node5;
    DLog(@"d: %d", [self isValidBST:node1]); /// 0
}

@end
