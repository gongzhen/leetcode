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

- (UndirectedGraphNode *)cloneGraphBFSJZ:(UndirectedGraphNode *)node;
- (UndirectedGraphNode *)cloneGraphBFS:(UndirectedGraphNode *)node;
- (UndirectedGraphNode *)cloneGraph:(UndirectedGraphNode *)node;

@end

@implementation LC133

- (UndirectedGraphNode *)cloneGraphBFSJZ:(UndirectedGraphNode *)node {
    if(node == nil) {
        return nil;
    }
    
    NSMutableArray *queue = [NSMutableArray queue];
    NSMutableSet *set = [NSMutableSet set];
    
    [queue offer:node];
    [set addObject:node];
    
    while(queue.count != 0) {
        UndirectedGraphNode *head = (UndirectedGraphNode *)[queue poll];
        [head.neighbors enumerateObjectsUsingBlock:^(UndirectedGraphNode*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if(![set containsObject:obj]) {
                [set addObject:obj];
                [queue offer:obj];
            }
        }];
    }
    
    NSArray<UndirectedGraphNode *> *nodeList = [set allObjects];
    
    NSMutableDictionary<NSNumber *, UndirectedGraphNode *> *map = [[NSMutableDictionary alloc] init];;
    for(UndirectedGraphNode *key in nodeList){
        UndirectedGraphNode *newNode = [[UndirectedGraphNode alloc] initWith:key.label];
//        DLog(@"key:%@, newNode:%@", key, newNode);
        [map setObject:newNode forKey:@(key.label)];
//        DLog(@"key:%@, newNode:%@", key, [map objectForKey:@(key.label)]);
    }
    
    for(UndirectedGraphNode *key in nodeList) {
        UndirectedGraphNode *newNode = (UndirectedGraphNode *)[map objectForKey:@(key.label)];
//        DLog(@"key:%ld, newNode:%ld", key.label, newNode.label);
//        DLog(@"key:%@, newNode:%@", key, newNode);
//        DLog(@"newNode:%ld", ((UndirectedGraphNode *)[map objectForKey:@(key.label)]).label);
        for(UndirectedGraphNode *neighbor in key.neighbors) {
            UndirectedGraphNode *newNeighbor = [map objectForKey:@(neighbor.label)];
            [newNode.neighbors addObject:newNeighbor];
        }
    }
    /// [self printGraph:(UndirectedGraphNode *)[map objectForKey:@(node.label)]];
    return (UndirectedGraphNode *)[map objectForKey:@(node.label)];
}

- (UndirectedGraphNode *)cloneGraphBFS:(UndirectedGraphNode *)node {
    if(node == NULL) {
        return NULL;
    }
    
    NSMutableDictionary<NSNumber*, UndirectedGraphNode*> *map = [NSMutableDictionary dictionary];
    NSMutableArray *queue = [NSMutableArray queue];
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

- (void)printGraph:(UndirectedGraphNode *)node {
    if(node == nil) {
        return;
    }
    NSMutableArray *queue = [NSMutableArray queue];
    NSMutableSet *set = [NSMutableSet set];
    [queue offer:node];
    [set addObject:node];
    
    while(queue.count != 0) {
        UndirectedGraphNode *head = (UndirectedGraphNode *)[queue poll];
        DLog(@"head:%ld {", head.label);
        for(UndirectedGraphNode *neighbor in head.neighbors) {
            DLog(@"neighbor:%ld ", neighbor.label);
            if(![set containsObject:neighbor]) {
                [set addObject:neighbor];
                [queue offer:neighbor];
            }
        }
        DLog(@"}==================");
    }
}

- (void)test {
    UndirectedGraphNode *node0 = [[UndirectedGraphNode alloc] initWith:0];
    UndirectedGraphNode *node1 = [[UndirectedGraphNode alloc] initWith:1];
    UndirectedGraphNode *node2 = [[UndirectedGraphNode alloc] initWith:2];
    [node0.neighbors addObjectsFromArray:@[node1, node2]];
    [node1.neighbors addObject:node2];
    [node2.neighbors addObject:node2];
    UndirectedGraphNode *result = [self cloneGraphBFSJZ:node0];
    DLog(@"result.label:%ld", result.label);
    [self printGraph:result];
}

@end
