//
//  LC314.m
//  LC
//
//  Created by ULS on 2/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC314.h"
#import "NSMutableArray+Queue.h"
#import "TreeNode.h"

@interface LC314()

- (NSArray *)verticalOrder:(TreeNode *)root;

@end

@implementation LC314

- (NSArray *)verticalOrder:(TreeNode *)root {
    NSMutableArray* res = [NSMutableArray array];
    if(root == NULL) {
        return res;
    }
    
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    NSMutableArray *colQueue = [NSMutableArray array]; /// -2, -1, 0, 1, 2
    NSMutableArray *queue = [NSMutableArray array];    ///
    
    [colQueue offer:@0]; /// root's col is 0
    [queue offer:root];  /// queue hold TreeNode
    NSInteger min = 0;
    NSInteger max = 0;
    while(queue.count != 0) {
        TreeNode *node = [queue poll];
        NSNumber* colNum = [colQueue poll];
        
        if([map objectForKey:colNum] == NULL) {
            [map setObject:[NSMutableArray array] forKey:colNum];
        }
        
        [[map objectForKey:colNum] addObject:node];
        if(node.left != NULL) {
            [queue offer:node.left];
            [colQueue offer:@([colNum intValue] - 1)];
            min = MIN(min, [colNum intValue] - 1);
        }
        if(node.right != NULL) {
            [queue offer:node.right];
            [colQueue offer:@([colNum intValue] + 1)];
            max = MAX(max, [colNum intValue] + 1);
        }
    }
    
    for(NSInteger i = min; i <= max; i++) {
        [res addObject:[map objectForKey:@(i)]];
    }
    return [res copy];
}

- (void)test {
    TreeNode *node3 = [[TreeNode alloc] initWith:3];
    TreeNode *node9 = [[TreeNode alloc] initWith:9];
    TreeNode *node20 = [[TreeNode alloc] initWith:20];
    TreeNode *node15 = [[TreeNode alloc] initWith:15];
    TreeNode *node7 = [[TreeNode alloc] initWith:7];
    node3.left = node9;
    node3.right = node20;
    
    node20.left = node15;
    node20.right = node7;
    NSArray *res = [self verticalOrder:node3];
    for(NSArray *list in res) {
        for(TreeNode* node in list) {
            DLog(@"%ld", node.val);
        }
        DLog(@"---------------------------");
    }
    
}

@end
