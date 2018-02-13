//
//  LC297.m
//  LC
//
//  Created by ULS on 2/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC297.h"
#import "NSMutableArray+Queue.h"

@interface TreeNode:NSObject

@property(assign)NSInteger val;
@property(nonatomic, strong) TreeNode* left;
@property(nonatomic, strong) TreeNode* right;

@end

@implementation TreeNode

- (instancetype)initWith:(NSInteger)x {
    if(self = [super init]) {
        self.val = x;
        self.left = NULL;
        self.right = NULL;
    }
    return self;
}

@end

@interface LC297()

- (NSString *)serialize:(TreeNode *)node;
- (TreeNode *)deserialize:(NSString *)data;

@end

@implementation LC297

- (void)printTree:(TreeNode *)node {
    if(node == NULL) {
        return;
    }
    DLog(@"node:%ld", node.val);
    [self printTree:node.left];
    [self printTree:node.right];
}

- (NSString *)serialize:(TreeNode *)node {
    NSMutableString *str = [NSMutableString string];
    [self dfs:node str:str];
    return str;
}

- (void)dfs:(TreeNode *)node str:(NSMutableString *)str {
    if(node == NULL) {
        [str appendString:@"#,"];
        return;
    }
    [str appendString:[NSString stringWithFormat:@"%ld,", node.val]];
    [self dfs:node.left str:str];
    [self dfs:node.right str:str];
    /// 1, 2, #, #, 3, 4, #, #, 5,#, #.
}

- (TreeNode *)deserialize:(NSString *)data {
    NSArray *dataArray = [data componentsSeparatedByString:@","];
    if(dataArray.count == 0) {
        return NULL;
    }
    
    NSMutableArray *pq = [NSMutableArray array];
    for(NSString *str in dataArray) {
        DLog(@"str:%@", str);
        [pq offer:str];/// 1, 2, #, #, 3, 4, #, #,  5, #, #
    }
    
    return [self bfs:pq];
}

- (TreeNode *)bfs:(NSMutableArray *)queue {
    if(queue.count == 0) {
        return NULL;
    }
    NSString *str = (NSString *)[queue peek];
    if([str isEqualToString:@"#"]) {
        [queue poll];
        return NULL;
    }
    /// queue poll will return interger value.
    TreeNode *node = [[TreeNode alloc] initWith:[[queue poll] integerValue]];
    node.left = [self bfs:queue];
    node.right = [self bfs:queue];
    return node;
}

- (void)test {
    TreeNode *node1 = [[TreeNode alloc] initWith:1];
    TreeNode *node2 = [[TreeNode alloc] initWith:2];
    TreeNode *node3 = [[TreeNode alloc] initWith:3];
    TreeNode *node4 = [[TreeNode alloc] initWith:4];
    TreeNode *node5 = [[TreeNode alloc] initWith:5];
    node1.left = node2;
    node1.right = node3;
    node3.left = node4;
    node3.right = node5;
    NSString *data =  [self serialize:node1];
    DLog(@"%@",data);
    TreeNode *root = [self deserialize:data];
    [self printTree:root];
}

@end
