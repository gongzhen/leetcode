//
//  LC95.m
//  LC
//
//  Created by ULS on 4/2/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC95.h"
#import "LCTreeNode.h"

@interface LC95()

- (NSArray<LCTreeNode *> *)generateTrees:(int)n;

@end

@implementation LC95

- (NSArray *)generateTrees:(int)n {
    return [self dfs:1 e:n];
}

- (NSArray *)dfs:(int)s e:(int)e {
    NSMutableArray *res = [NSMutableArray array];
    if(s > e) {
        [res addObject:[NSNull null]];
        return res;
    }
    
    for(int i = s; i <= e; i++) {
        NSArray *left = [self dfs:s e:i - 1];
        NSArray *right = [self dfs:i + 1 e:e];
        for(LCTreeNode *leftNode in left) {
            for(LCTreeNode *rightNode in right) {
                LCTreeNode *root = [[LCTreeNode alloc] initWith:i];
                root.left = leftNode;
                root.right = rightNode;
                [res addObject:root];
            }
        }
    }
    return res;
}

- (void)postorder:(LCTreeNode *)node {
    if([node isEqual:[NSNull null]]) {
        return;
    }
    
    [self postorder:node.left];
    [self postorder:node.right];
    DLog(@"node:%ld, ", node.val);
}

- (void)test {
    NSArray<LCTreeNode *> *res = [self generateTrees:3];
    [res enumerateObjectsUsingBlock:^(LCTreeNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self postorder:obj];
        DLog(@"---------------------");
    }];
}
@end
