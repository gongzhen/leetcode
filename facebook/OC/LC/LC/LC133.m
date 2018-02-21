//
//  LC133.m
//  LC
//
//  Created by ULS on 2/17/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC133.h"
#import "UndirectedGraphNode.h"
#import "NSMutableArray+Queue.h"

@interface LC133()

- (UndirectedGraphNode *)cloneGraphBFS:(UndirectedGraphNode *)node;
- (UndirectedGraphNode *)cloneGraph:(UndirectedGraphNode *)node;

@end

@implementation LC133

- (UndirectedGraphNode *)cloneGraphBFS:(UndirectedGraphNode *)node {
    if(node == NULL) {
        return NULL;
    }
    
    NSMutableDictionary<NSNumber*, UndirectedGraphNode*> *map = [NSMutableDictionary dictionary];
    NSMutableArray *queue = [NSMutableArray array];
    [queue offer:node]; /// save old node
    [map setObject:[[UndirectedGraphNode alloc] initWith:node.label] forKey:@(node.label)]; /// new node.
    
    while(queue.count != 0) {
        UndirectedGraphNode *_node = [queue poll];
        NSArray *neighbors = _node.neighbors;
        for(UndirectedGraphNode *neighbor in neighbors) {
            if(![map objectForKey:@(neighbor.label)]) {
                [queue offer:neighbor];
                [map setObject:[[UndirectedGraphNode alloc] initWith:neighbor.label] forKey:@(neighbor.label)];
            }
            [((UndirectedGraphNode *)[map objectForKey:@(_node.label)]).neighbors addObject:neighbor];
        }
    }
    return (UndirectedGraphNode *)[map objectForKey:@(node.label)];
}

- (UndirectedGraphNode *)cloneGraph:(UndirectedGraphNode *)node {
    if(node == NULL) {
        return NULL;
    }
    
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    return [self dfs:node map:map];
    
}

- (UndirectedGraphNode *)dfs:(UndirectedGraphNode *) node map:(NSMutableDictionary *)map {
    if(node == NULL) {
        return NULL;
    }
    
    if([map objectForKey:@(node.label)]) {
        return (UndirectedGraphNode *)[map objectForKey:@(node.label)];
    }
    UndirectedGraphNode *cloneNode = [[UndirectedGraphNode alloc] initWith:node.label];
    [map setObject:cloneNode forKey:@(node.label)];
    NSMutableArray *neighbors = node.neighbors;
    for(UndirectedGraphNode *neighbor in neighbors) {
        [cloneNode.neighbors addObject:[self dfs:neighbor map:map]];
    }
    return cloneNode;
}

- (void)test {
    UndirectedGraphNode *node0 = [[UndirectedGraphNode alloc] initWith:0];
    UndirectedGraphNode *node1 = [[UndirectedGraphNode alloc] initWith:1];
    UndirectedGraphNode *node2 = [[UndirectedGraphNode alloc] initWith:2];
    [node0.neighbors addObject:node1];
    [node0.neighbors addObject:node2];
    [node1.neighbors addObject:node2];
    [node2.neighbors addObject:node2];
    UndirectedGraphNode *result = [self cloneGraphBFS:node1];
    DLog(@"result:%ld", result.label);

}

@end
