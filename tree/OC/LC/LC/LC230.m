//
//  LC230.m
//  LC
//
//  Created by Admin  on 3/30/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC230.h"
#import "TreeNode.h"
#import "NSMutableArray+Stack.h"

@interface LC230() {
    int _result;
    int _count;
}

- (int)kthSmallest:(TreeNode *)root k:(int)k;

@end

@implementation LC230

- (int)kthSmallest:(TreeNode *)root k:(int)k {
    _result = 0;
    _count = 0;
    // [self dfs:root k:k];
    _result = [self bfs_1:root k:k];
    return _result;
}

- (void)dfs:(TreeNode *)node k:(int)k {
    if(node == NULL) {
        return;
    }
    [self dfs:node.left k:k];
    _count++;
    if(_count == k) {
        _result = (int)node.val;
    }
    [self dfs:node.right k:k];
}
-(int)bfs_1:(TreeNode *)node k:(int)k {
    if(node == NULL) {
        return -1;
    }
    NSMutableArray *stack = [NSMutableArray array];
    while(node != NULL || [stack count] != 0) {
        while(node != NULL) {
            [stack push:node];
            node = node.left;
        }
        node = [stack pop];
        k--;
        if(k == 0) {
            return (int)node.val;
        }
        if(node != NULL && node.right != NULL) {
            node = node.right;
            while(node != NULL) {
                [stack push:node];
                node = node.right;
            }
        } else {
            node = NULL;
        }
    }
    return -1;
}

- (int)bfs:(TreeNode *)node k:(int)k {
    NSMutableArray *stack = [NSMutableArray array];
    while(node != NULL) {
        [stack push:node];
        node = node.left;
    }
    
    while(k != 0 && [stack count] != 0) {
        TreeNode *top = [stack pop];
        k--;
        if(k == 0) {
            return (int)top.val;
        }
        if(top != NULL &&  top.right != NULL) {
            top = top.right;
            while(top != NULL) {
                [stack push:top];
                top = top.left;
            }
        }

    }
    return -1;
}

- (void)test {
    TreeNode *node1 = [[TreeNode alloc] initWith:1];
    TreeNode *node2 = [[TreeNode alloc] initWith:2];
    TreeNode *node3 = [[TreeNode alloc] initWith:3];
    TreeNode *node4 = [[TreeNode alloc] initWith:4];
    TreeNode *node5 = [[TreeNode alloc] initWith:5];
    //      4
    //   3      5
    //1
    //  2
    node4.left = node3;
    node3.left = node1;
    node1.right = node2;
    node4.right = node5;
    int res = [self kthSmallest:node4 k:4];
    DLog(@"res:%d", res);
}
@end
