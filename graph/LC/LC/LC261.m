//
//  LC261.m
//  LC
//
//  Created by ULS on 3/9/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC261.h"
#import "Queue.h"

@interface LC261()

- (BOOL)validTree:(int)n edges:(int **)edges row:(int)row col:(int)col;

@end

@implementation LC261

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
    
    [graph enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSNumber *numKey = (NSNumber *)key;
        DLog(@"key:%ld", [numKey integerValue]);
        NSArray *array = (NSArray *)obj;
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSNumber *numValue = (NSNumber *)obj;
            NSLog(@"value:%ld", [numValue integerValue]);
        }];
    }];
    
    Queue *queue = [Queue queue];
    NSMutableSet *set = [NSMutableSet set];
    
    [queue offer:@(0)];
    [set addObject:@(0)];
    
    int visited = 0;
    
    while([queue isEmpty] == NO) {
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
