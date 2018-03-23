//
//  LC111.m
//  LC
//
//  Created by Admin  on 3/21/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC111.h"
#import "LCTreeNode.h"

@interface LC111()

- (int)minDepth:(LCTreeNode *)root;

@end

@implementation LC111

- (int)minDepth:(LCTreeNode *)root {
    if(root == NULL) {
        return 0;
    }
    else if (root.left != NULL && root.right != NULL) {
        DLog(@"root:%ld", root.val);
        return 1 + MIN([self minDepth:root.left], [self minDepth:root.right]);
    } else if(root.left != NULL) {
        DLog(@"root:%ld", root.val);
        return 1 + [self minDepth:root.left];
    }
    DLog(@"root:%ld", root.val);
    return 1 + [self minDepth:root.right];
}

- (int)minDepth_1:(LCTreeNode *)root {
    if(root == NULL) {
        return 0;
    }
    /// left == NULL then go right
    else if (root.left == NULL) {
        DLog(@"root:%ld", root.right == NULL ? 0 : root.right.val);
        return 1 + [self minDepth_1:root.right];
    }
    /// right == NULL then go left
    else if (root.right == NULL) {
        DLog(@"root:%ld", root.left == NULL ? 0 : root.left.val);
        return 1 + [self minDepth_1:root.left];
    }
    DLog(@"root:%ld ==> root.left:%ld. root.right:%ld", root.val,root.left.val, root.right.val);
    return 1 + MIN([self minDepth_1:root.left], [self minDepth_1:root.right]);
}

- (int)minDepth_2:(LCTreeNode *)root {
    if(root == NULL) {
        return 0;
    }
    DLog(@"root:%ld", root.val);
    int left = [self minDepth_2:root.left];
    int right = [self minDepth_2:root.right];
    DLog(@"root:%ld ==> left:%d right:%d",root.val, left, right);
    return (left == 0 || right == 0) ? 1 + left + right : MIN(left, right) + 1;
}

/**
             1
         2      3
             4     5
           6
 */
- (void)test {
    LCTreeNode *node1 = [[LCTreeNode alloc] initWith:1];
    LCTreeNode *node2 = [[LCTreeNode alloc] initWith:2];
    LCTreeNode *node3 = [[LCTreeNode alloc] initWith:3];
    LCTreeNode *node4 = [[LCTreeNode alloc] initWith:4];
    LCTreeNode *node5 = [[LCTreeNode alloc] initWith:5];
    LCTreeNode *node6 = [[LCTreeNode alloc] initWith:6];
    node1.left = node2;
    node1.right = node3;
    node3.left = node4;
    node3.right = node5;
    node4.left = node6;
    int len = [self minDepth_2:node1];
    DLog(@"%d", len);
}
@end
