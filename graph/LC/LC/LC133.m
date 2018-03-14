//
//  LC133.m
//  LC
//
//  Created by Admin  on 3/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC133.h"
#import "UndirectedGraphNode.h"
#import "Queue.h"
#import "HashSet.h"

@interface LC133()

- (UndirectedGraphNode *)cloneGraphBFSJZ:(UndirectedGraphNode *)node;
- (UndirectedGraphNode *)cloneGraph:(UndirectedGraphNode *)node;

@end

@implementation LC133

- (UndirectedGraphNode *)cloneGraphBFSJZ:(UndirectedGraphNode *)node {
    if(node == NULL) {
        return NULL;
    }
    
    NSMutableDictionary<NSNumber *, UndirectedGraphNode *> *map = [NSMutableDictionary dictionary];
    Queue *queue = [Queue queue];
    HashSet *set = [[HashSet alloc] init];
    [queue offer:node];
    [set add:node];
    
    while(![queue isEmpty]) {
        UndirectedGraphNode *top = [queue poll];
        DLog(@"top:%ld", top.label);
        for(UndirectedGraphNode *neighbor in top.neighbors) {
            DLog(@"neighbor:%@", neighbor);
            /// Not working right now becauwe HashSet key is applying NSCopying and is copied everythime to put inside dictionary.
            if([set contains:neighbor] == NO) {
                [set add:neighbor];
                [queue offer:neighbor];
            }
        }
    }
    
    NSArray<UndirectedGraphNode *> *nodeList = [set arrayList];

    for(UndirectedGraphNode *node in nodeList) {
        [map setObject:[[UndirectedGraphNode alloc] initWith:node.label] forKey:@(node.label)];
    }
    
    for(UndirectedGraphNode *key in nodeList) {
        NSArray *neighbors = node.neighbors;
        for(UndirectedGraphNode *neighbor in neighbors) {
            [[map objectForKey:@(key.label)].neighbors addObject:[map objectForKey:@(neighbor.label)]];
        }
    }
    return [map objectForKey:@(node.label)];
}

- (UndirectedGraphNode *)cloneGraph:(UndirectedGraphNode *)node {
    if(node == NULL) {
        return NULL;
    }
    
    NSMutableDictionary<NSNumber *, UndirectedGraphNode *> *map = [NSMutableDictionary dictionary];
    Queue *queue = [Queue queue];
    [queue offer:node];
    [map setObject:[[UndirectedGraphNode alloc] initWith:node.label] forKey:@(node.label)];
    
    while(![queue isEmpty]) {
        UndirectedGraphNode *top = (UndirectedGraphNode *)[queue poll];
        NSArray *neighbors = top.neighbors;
        for(UndirectedGraphNode *node in neighbors) {
            if([map objectForKey:@(node.label)] == NULL) {
                [map setObject:[[UndirectedGraphNode alloc] initWith:node.label] forKey:@(node.label)];
                [queue offer:node];
            }
            [[map objectForKey:@(top.label)].neighbors addObject:[map objectForKey:@(node.label)]];
        }
    }
    return [map objectForKey:@(node.label)];
}

- (void)printGraph:(UndirectedGraphNode *)node {
    if(node == nil) {
        return;
    }
    Queue *queue = [Queue queue];
    NSMutableSet *set = [NSMutableSet set];
    [queue offer:node];
    [set addObject:node];
    
    while(![queue isEmpty]) {
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
    UndirectedGraphNode *result = [self cloneGraph:node0];
    // DLog(@"result.label:%ld", result.label);
    [self cloneGraphBFSJZ:result];
}

@end
