//
//  LC102.m
//  LC
//
//  Created by ULS on 4/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC102.h"
#import "LCTreeNode.h"

@implementation LC102

-(NSArray *)levelOrder:(LCTreeNode* )root {
    /// dfs
    NSMutableArray *res = [NSMutableArray array];
    [self dfs:res node:root height:0];
    return res;
}

- (void)dfs:(NSMutableArray *)list node:(LCTreeNode *)node height:(int)height {
    if(node == NULL) {
        return;
    }
    if(list.count <= height) {
        [list addObject:[NSMutableArray array]];
    }
    [[list objectAtIndex:height] addObject:@(node.val)];
    [self dfs:list node:node.left height:height + 1];
    [self dfs:list node:node.right height:height + 1];
}

- (LCTreeNode *)bst {
    /*
            3
     1              5
        2         4
     */
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
    LCTreeNode *root = [self bst];
    NSArray *result = [self levelOrder:root];
    [result enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *level = (NSArray *)obj;
        [level enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSNumber *node = (NSNumber *)obj;
            DLog(@"%ld", [node integerValue]);
        }];
        DLog(@"---------------------------------------------------------------");
    }];
}

@end
