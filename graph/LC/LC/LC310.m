//
//  LC310.m
//  LC
//
//  Created by ULS on 3/9/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC310.h"

@interface LC310()

- (NSArray *)findMinHeightTrees:(int)n edges:(int **)edges row:(int)row col:(int)col;

@end

@implementation LC310

- (NSArray *)findMinHeightTrees:(int)n edges:(int **)edges row:(int)row col:(int)col {
    /// Check n - 1 equals row. (n == 5, then 0, 1, 2, 3, 4 rows)
    if(n == 0 || n - 1 != row) {
        return [NSArray array];
    }
    
    NSMutableArray<NSMutableArray *> *graph = [NSMutableArray array];
    for(int i = 0; i < n; i++) {
        [graph addObject:[NSMutableArray array]];
    }
    
    for(int i = 0; i < row; i++) {
        int e0 = edges[i][0];
        int e1 = edges[i][1];
        [[graph objectAtIndex:e0] addObject:@(e1)];
        [[graph objectAtIndex:e1] addObject:@(e0)];
    }
    
    [graph enumerateObjectsUsingBlock:^(NSMutableArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"idx:%ld", idx);
        [obj enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%d", [obj intValue]);
        }];
    }];
    
    NSMutableArray *leaves = [NSMutableArray array];
    for(int i = 0; i < n; i++) {
        NSArray *list = [graph objectAtIndex:i];
        if(list.count == 1) {
            [leaves addObject:@(i)];
        }
    }

    [leaves enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"leaves: %d", [obj intValue]);
    }];
    
    while(n > 2) {
        n -= leaves.count;
        NSMutableArray *tempList = [NSMutableArray array];
        for(NSNumber *n in leaves) {
            int i = [n intValue];
            /// We know leaves *n has only one element.
            int j = [[[graph objectAtIndex:i] objectAtIndex:0] intValue];
            [[graph objectAtIndex:j] removeObject:@(i)];
            if([[graph objectAtIndex:j] count] == 1) {
                [tempList addObject:@(j)];
            }
        }
        [leaves removeAllObjects];
        leaves = [tempList copy];
    }
    
    return [leaves copy];
}

- (void)test {
    int grid[5][2] = {{0, 3}, {1, 3}, {2, 3}, {4, 3}, {5, 4}};
    int** edges = (int **)malloc(5 * sizeof(int *));
    for(int i = 0; i < 5; i++) {
        edges[i] = (int *)malloc(2 * sizeof(int));
    }
    
    for(int i = 0; i < 5; i++) {
        for(int j = 0; j < 2; j++) {
            edges[i][j] = grid[i][j];
        }
    }
    /// 0, 1, 2, 3, 4
    NSArray *res = [self findMinHeightTrees:6 edges:edges row:5 col:2];
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"key: %d", [obj intValue]);
    }];
    
    int grid2[3][2] = {{1, 0}, {1, 2}, {1, 3}};
    int** edges2 = (int **)malloc(3 * sizeof(int *));
    for(int i = 0; i < 3; i++) {
        edges2[i] = (int *)malloc(2 * sizeof(int));
    }
    
    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 2; j++) {
            edges2[i][j] = grid2[i][j];
        }
    }
    /// 0, 1, 2, 3
    NSArray *res1 = [self findMinHeightTrees:4 edges:edges2 row:3 col:2];
    [res1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"key: %d", [obj intValue]);
    }];
    
}
@end
