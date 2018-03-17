//
//  LC684.m
//  LC
//
//  Created by Admin  on 3/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC684.h"
#import "HashSet.h"

@interface LC684()

- (NSArray *)findRedundantConnection:(int **)edges row:(int)row col:(int)col;

@end

@implementation LC684

- (NSArray *)findRedundantConnection:(int **)edges row:(int)row col:(int)col {
    if(row == 0 || col == 0) {
        return @[];
    }
    
    NSMutableDictionary<NSNumber *, NSMutableArray *> *map = [NSMutableDictionary dictionary];
    for(int i = 0; i < row; i++) {
        int u = edges[i][0];
        int v = edges[i][1];
        HashSet* set = [[HashSet alloc] init];
        if([self dfs:map u:u v:v set:set]) {
            return @[@(u), @(v)];
        }
        if([map objectForKey:@(u)] == NULL) {
            [map setObject:[NSMutableArray array] forKey:@(u)];
        }
        NSMutableArray *listU = [map objectForKey:@(u)];
        [listU addObject:@(v)];
        [map setObject:listU forKey:@(u)];
        if([map objectForKey:@(v)] == NULL) {
            [map setObject:[NSMutableArray array] forKey:@(v)];
        }
        NSMutableArray *listV = [map objectForKey:@(v)];
        [listV addObject:@(u)];
        [map setObject:listV forKey:@(v)];
    }
    return @[];
}

- (BOOL)dfs:(NSMutableDictionary*)map u:(int)u v:(int)v set:(HashSet *)set {
    if(u == v) {
        return YES;
    }
    [set add:@(u)];
    if([map objectForKey:@(u)] == NULL || [map objectForKey:@(v)] == NULL) {
        return NO;
    }
    
    NSArray *list = [map objectForKey:@(u)];
    for(NSNumber *next in list) {
        if([set contains:next] == YES) {
            continue;
        }
        if([self dfs:map u:[next intValue] v:v set:set] == YES) {
            return YES;
        }
    }
    return NO;
}

- (void)test {
//    int grid[5][2] = {{1, 2} ,{2, 3} ,{3, 4} ,{1, 4} ,{1, 5}};
//    int **edges = (int **)malloc(5 * sizeof(int *));
//    for(int i = 0; i < 5; i++) {
//        edges[i] = (int *)malloc(2 * sizeof(int));
//    }
//
//    for(int i = 0; i < 5; i++) {
//        for(int j = 0; j < 2; j++) {
//            edges[i][j] = grid[i][j];
//        }
//    }
//    NSArray *res = [self findRedundantConnection:edges row:5 col:2];
//    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"%d", [obj intValue]);
//    }];
    
    int grid[3][2] = {{1, 2} ,{1, 3} ,{2, 3}};
    int **edges = (int **)malloc(3 * sizeof(int *));
    for(int i = 0; i < 3; i++) {
        edges[i] = (int *)malloc(2 * sizeof(int));
    }
    
    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 2; j++) {
            edges[i][j] = grid[i][j];
        }
    }
    NSArray *res = [self findRedundantConnection:edges row:3 col:2];
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"%d", [obj intValue]);
    }];
}

@end
