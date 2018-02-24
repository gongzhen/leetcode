//
//  LC297.m
//  LC
//
//  Created by ULS on 2/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC297.h"
#import "NSMutableArray+Queue.h"
#import "TreeNode.h"

@interface LC297()

- (NSString *)serialize:(TreeNode *)node;
- (TreeNode *)deserialize:(NSString *)data;

- (NSString *)serializeBFS:(TreeNode *)node;
- (TreeNode *)deserializeBFS:(NSString *)data;

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

- (NSString *)serializeBFS:(TreeNode *)node {
    if(node == nil) {
        return @"";
    }
    
    /// BFS: using queue to traverse the tree.
    NSMutableArray *queue = [NSMutableArray queue];
    [queue offer:node];
    
    /// Adding all tree node or [NSNull null] to queue.
    for(int i = 0; i < queue.count; i++) {
        TreeNode *head = [queue objectAtIndex:i];
        if([head isEqual:[NSNull null]]) {
            continue;
        }
        if(head.left == nil) {
            [queue offer:[NSNull null]];
        } else {
            [queue offer:head.left];
        }
        if(head.right == nil) {
            [queue offer:[NSNull null]];
        } else {
            [queue offer:head.right];
        }
    }
    
    /// remove the bottom null node.
    while([[queue lastObject] isEqual:[NSNull null]]) {
        // DLog(@"queue last:%@ size:%ld", [queue lastObject], [queue count]);
        [queue removeLastObject];
    }
    
    /// returned str will be formated like {1, 2, 3, #, 4}
    NSMutableString *str = [NSMutableString string];
    [str appendString:@"{"];
    /// str append first node from queue. it is alos the root node.
//    [str appendString:[NSString stringWithFormat:@"%ld", ((TreeNode *)[queue objectAtIndex:0]).val]];
    
    
    for(int i = 0; i < queue.count; i++) {
        id obj = [queue objectAtIndex:i];
//        DLog(@"NSNull class:%@", [NSNull class]);
//        DLog(@"NSNull null:%@", [NSNull null]);
        if([obj isEqual:[NSNull null]]) {
            [str appendString:@"#,"];
        } else {
            TreeNode *head = (TreeNode *)obj;
            [str appendString:[NSString stringWithFormat:@"%ld", head.val]];
            [str appendString:@","];
        }
    }
    /// Remove the last "," character,
    [str deleteCharactersInRange:NSMakeRange([str length] - 1, 1)];
    [str appendString:@"}"];
//    DLog(@"str:%@", str);
    return [str copy];
}

- (TreeNode *)deserializeBFS:(NSString *)data {
    if(data == nil || data.length == 0) {
        return nil;
    }
    
    if([data isEqualToString:@"{}"]) {
        return nil;
    }
    
    NSString* dataString = [data substringWithRange:NSMakeRange(1, data.length - 2)];
    DLog(@"dataString:%@", dataString);
    NSArray *dataArray = [dataString componentsSeparatedByString:@","];
    TreeNode *root = [[TreeNode alloc] initWith:[[dataArray objectAtIndex:0] intValue]];
    NSMutableArray *queue = [NSMutableArray queue];
    [queue offer:root];
    int index = 0;
    BOOL isLeft = YES;
    ///
    for(int i = 1; i < dataArray.count; i++) {
        if(![[dataArray objectAtIndex:i] isEqualToString:@"#"]) {
            TreeNode *node = [[TreeNode alloc] initWith:[[dataArray objectAtIndex:i] intValue]];
            if(isLeft == YES) {
                ((TreeNode *)[queue objectAtIndex:index]).left = node;
            } else {
                ((TreeNode *)[queue objectAtIndex:index]).right = node;
            }
            [queue offer:node];
        }
        
        /// no mather # or 1, 2, 3 value, we have to udapte index and isLeft
        if(!isLeft) {
            index++;
        }
        isLeft = !isLeft;
    }
    return root;
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
    [self printTree:node1];
//    NSString *data =  [self serialize:node1];
//    DLog(@"%@",data);
//    TreeNode *root = [self deserialize:data];
    NSString *data = [self serializeBFS:node1];
    TreeNode *root = [self deserializeBFS:data];
    DLog(@"%@", data);
    [self printTree:root];
}

@end
