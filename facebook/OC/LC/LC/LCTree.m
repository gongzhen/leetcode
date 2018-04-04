//
//  LCTree.m
//  LC
//
//  Created by ULS on 2/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LCTree.h"
#import "LCTreeNode.h"
#import "NSMutableArray+Stack.h"

@interface LCTree()

@end

@implementation LCTree

- (void)inorder:(LCTreeNode *)node {
    if(node == NULL) {
        return;
    }
    
    [self inorder:node.left];
    DLog(@"node:%ld, ", node.val);
    [self inorder:node.right];
}

- (void)inorderBFS:(LCTreeNode *)node {
    if(node == NULL) {
        return;
    }
    
    NSMutableArray *stack = [NSMutableArray array];
    LCTreeNode *current = node;
    while(current != nil || ![stack empty]) {
        while(current != NULL) {
            [stack push:current];
            current = current.left;
        }
        current = [stack pop];
        DLog(@"node:%ld, ", current.val);
        current = current.right;
    }
}


- (void)preorder:(LCTreeNode *)node {
    if(node == NULL) {
        return;
    }
    
    DLog(@"node:%ld, ", node.val);
    [self preorder:node.left];
    [self preorder:node.right];
}

- (void)preorderBFS:(LCTreeNode *)node {
    if(node == nil) {
        return;
    }
    
    NSMutableArray *stack = [NSMutableArray array];
    [stack push:node];
    while(![stack empty]) {
        LCTreeNode *_node = [stack pop];
        DLog(@"node:%ld, ", _node.val);
        if(_node.right != nil) {
            [stack push:_node.right];
        }
        if(_node.left != nil) {
            [stack push:_node.left];
        }
    }
}

- (void)postorder:(LCTreeNode *)node {
    if(node == NULL) {
        return;
    }
    
    [self postorder:node.left];
    [self postorder:node.right];
    DLog(@"node:%ld, ", node.val);
}

- (void)postorderBFS:(LCTreeNode *)node {
    if(node == NULL) {
        return;
    }
    
    LCTreeNode *prev = nil;
    LCTreeNode *current = node;
    NSMutableArray *stack = [NSMutableArray array];
    
    while(current != nil || ![stack empty]) {
        while(current != nil) {
            [stack push:current];
            current = current.left;
        }
        current = [stack pop];
        if(current.right != nil && prev != current.right) {
            [stack push:current];
            current = current.right;
        } else {
            DLog(@"node:%ld, ", current.val);
            prev = current;
            current = nil;
        }
    }
}

- (LCTreeNode *)bst {
    LCTreeNode *node1 = [[LCTreeNode alloc] initWith:1];
    LCTreeNode *node2 = [[LCTreeNode alloc] initWith:2];
    LCTreeNode *node3 = [[LCTreeNode alloc] initWith:3];
    LCTreeNode *node4 = [[LCTreeNode alloc] initWith:4];
    LCTreeNode *node5 = [[LCTreeNode alloc] initWith:5];
    node3.left = node1;
    node1.right = node2;
    node3.right = node5;
    node5.left = node4;
    return node3;
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
    [self inorder:node1];
    [self inorderBFS:node1];
    [self preorder:node1];
    [self preorderBFS:node1];
    [self postorder:node1];
    [self postorderBFS:node1];
}

@end
