//
//  LC257.m
//  LC
//
//  Created by ULS on 3/31/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC257.h"
#import "LCTreeNode.h"

@interface LC257()

- (NSArray *)binaryTreePaths:(LCTreeNode *)root;

@end

@implementation LC257
/**
    1
  /   \
 2     3
  \
   5
 
 ["1->2->5", "1->3"]
 */
- (NSArray *)binaryTreePaths:(LCTreeNode *)root {
    NSMutableString* path = [NSMutableString string];
    NSMutableArray *res = [NSMutableArray array];
    [self dfs:root path:path res:res];
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"obj:%@", obj);
    }];
    return res;
}

- (void)dfs:(LCTreeNode *)node path:(NSString *)path res:(NSMutableArray *)res {
    if(node == NULL) {
        return;
    }
    if(node.left == NULL && node.right == NULL) {
        path = [NSString stringWithFormat:@"%@%ld", path, node.val];
        [res addObject:path];
        return;
    }
    path = [NSString stringWithFormat:@"%@%ld", path, node.val];
    DLog(@"path:%@", path);
    if(node.left != NULL) {
        [self dfs:node.left path:[NSString stringWithFormat:@"%@->",path] res:res];
    }
    if(node.right != NULL) {
        [self dfs:node.right path:[NSString stringWithFormat:@"%@->",path] res:res];
    }
}

- (void)test {
    /**
             1
        2         3
      4   5
     */
    LCTreeNode *node1 = [[LCTreeNode alloc] initWith:1];
    LCTreeNode *node2 = [[LCTreeNode alloc] initWith:2];
    LCTreeNode *node3 = [[LCTreeNode alloc] initWith:3];
    LCTreeNode *node4 = [[LCTreeNode alloc] initWith:4];
    LCTreeNode *node5 = [[LCTreeNode alloc] initWith:5];
    node1.left = node2;
    node1.right = node3;
    node2.left = node4;
    node2.right = node5;
    [self binaryTreePaths:node1];
}
@end
