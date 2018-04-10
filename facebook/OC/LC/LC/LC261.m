//
//  LC261.m
//  LC
//
//  Created by ULS on 2/22/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC261.h"
#import "NSMutableArray+Queue.h"

@interface LC261()

- (BOOL)validTree:(int)n edges:(int **)edges row:(int)row col:(int)col;

@end

@implementation LC261
/**
 261. Graph Valid Tree
 Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree.
 
 For example:
 
 Given n = 5 and edges = [[0, 1], [0, 2], [0, 3], [1, 4]], return true.
 
 Given n = 5 and edges = [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]], return false.
 
 Note: you can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.
 */

- (BOOL)validTree:(int)n edges:(int **)edges row:(int)row col:(int)col {
    /// Check n - 1 equals row. (n == 5, then 0, 1, 2, 3, 4 rows)
    if(n == 0 || n - 1 != row) {
        return NO;
    }
    
    /// graph to save the edges.
    NSMutableDictionary *graph = [[NSMutableDictionary alloc] init];
    for(int i = 0; i < n; i++) { /// allocate memory space for each i : 0, 1, 2, 3, n - 1;
        [graph setObject:[NSMutableArray array] forKey:@(i)];
    }
    
    /// create graph.
    for(int i = 0; i < row; i++) {
        int s = edges[i][0];
        int e = edges[i][1];
        [[graph objectForKey:@(s)] addObject:@(e)];
        [[graph objectForKey:@(e)] addObject:@(s)];
    }
    
    /// queue for push and pop
    NSMutableArray *queue = [NSMutableArray queue];
    /// set for recording element,
    NSMutableSet *set = [[NSMutableSet alloc] init];
    
    [queue offer:@(0)];
    [set addObject:@(0)];
    
    int visited = 0;
    
    while(queue.count != 0) {
        int node = [[queue poll] intValue];
        visited++;
        NSArray *neighbors = (NSArray *)[graph objectForKey:@(node)];
        for(NSNumber *num in neighbors) {
            if(![set containsObject:num]) {
                [set addObject:num];
                [queue offer:num];
            }
        }
    }
    return visited == n;
}

- (void)test {
    int grid[4][2] = {{0, 1}, {0, 2}, {0, 3}, {1, 4}};
    int** edges = (int **)malloc(4 * sizeof(int *));
    for(int i = 0; i < 4; i++) {
        edges[i] = (int *)malloc(2 * sizeof(int));
    }
    
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 2; j++) {
            edges[i][j] = grid[i][j];
        }
    }
    /// 0, 1, 2, 3, 4
    DLog(@"res:%d", [self validTree:5 edges:edges row:4 col:2]);
}

@end
