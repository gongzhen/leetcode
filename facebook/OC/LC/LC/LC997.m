//
//  LC997.m
//  LC
//
//  Created by ULS on 3/31/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC997.h"
#import "PriorityQueue.h"
#import "PQNode.h"

@interface LC997()

- (NSArray *)mergekSortedArrays:(int **)arrays row:(int)row col:(int)col;

@end

@implementation LC997

/// Merge k Sorted Arrays
- (NSArray *)mergekSortedArrays:(int **)arrays row:(int)row col:(int)col {
    if(row == 0 || col == 0) {
        return [NSArray array];
    }
    
    PriorityQueue<PQNode *>* pq = [[PriorityQueue alloc] init];
    pq.comparator = ^NSComparisonResult(PQNode * _Nonnull obj1, PQNode * _Nonnull obj2) {
        ///obj1 is the coming object, obj2 is the previous object
        DLog(@"obj1:%d obj2:%d", obj1.val, obj2.val);
        if(obj1.val == obj2.val) {
            return NSOrderedSame;
        } else if (obj1.val > obj2.val) {/// coming is larger than previous, so it is descending
            return NSOrderedDescending;
        }
        return NSOrderedAscending; /// coming is less than previous, so it is ascending.
    };
    
    NSMutableArray *res = [NSMutableArray array];
    for(int i = 0; i < row; i++) {
        [pq offer:[[PQNode alloc] initWithRow:i col:0 val:arrays[i][0]]];
    }
    
    [pq printPQ];
    
    while(![pq isEmpty]) {
        PQNode *top = [pq poll];
        DLog(@"top:%d", top.val);
        [res addObject:@(top.val)];
        if(top.col < col - 1) {
            [pq offer:[[PQNode alloc] initWithRow:top.row col:top.col + 1 val:arrays[top.row][top.col + 1]]];
        }
    }
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber *num = (NSNumber *)obj;
        DLog(@"obj:%ld", [num integerValue]);
    }];
    return res;
}

- (void)test {
    int grid[3][4] = {
                      {2, 5, 8, 12},
                      {4, 9, 22, 23},
                      {3, 105, 106, 1000}
                      };
    int** matrix = (int **)malloc(sizeof(int *) * 3);
    for(int i = 0; i < 3; i++) {
        matrix[i] = (int *)malloc(sizeof(int) * 4);
    }
    
    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 4; j++) {
            matrix[i][j] = grid[i][j];
        }
    }
    
    [self mergekSortedArrays:matrix row:3 col:4];
    [self free_DoubleArray:matrix row:3 col:4];
}
@end
