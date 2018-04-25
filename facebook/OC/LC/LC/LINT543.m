//
//  LINT543.m
//  LC
//
//  Created by ULS on 3/22/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LINT543.h"
#import "PriorityQueue.h"
#import "QuickSort.h"
#import "Pair.h"
#import "PQNode.h"
/// https://github.com/misspink1011/LintCode
/// https://zhengyang2015.gitbooks.io/lintcode/kth_largest_in_n_arrays_543.html

@interface LINT543()

/// Kth Largest in N Arrays 543
- (int)kthInArrays:(int **)arrays row:(int)row col:(int)col k:(int)k;

@end

@implementation LINT543

- (int)kthInArrays:(int **)arrays row:(int)row col:(int)col k:(int)k {
    // sort each array of arrays
    for(int i = 0; i < row; i++) {        
        [QuickSort quickSortInt:arrays[i] size:col];
        [QuickSort printIntArray:arrays[i] size:col];
    }
    
    /// Create a heap and add the largest number to heap.
    /// PriorityQueue *pq = [[PriorityQueue alloc] initWithCapacity:row];
    PriorityQueue *pq = [[PriorityQueue alloc] init];
    pq.comparator = ^(PQNode*  _Nonnull obj1, PQNode*  _Nonnull obj2) {
        DLog(@"obj1:%@ === obj2:%@", obj1, obj2);
        if(obj1.val > obj2.val) {
            return NSOrderedAscending;
        } else if (obj1.val < obj2.val) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    };
    
    for(int i = 0; i < row; i++) {
        PQNode *node = [[PQNode alloc] initWithRow:i col:col - 1 val:arrays[i][col - 1]];
        DLog(@"node:%@, node.row:%d, node.col:%d, node.val:%d", node, node.row, node.col, node.val);
        [pq offer:node];
    }
    
    for(int i = 0; i < k; i++) {
        PQNode* temp = [pq poll];
        DLog(@"temp:%@, temp.row:%d, temp.col:%d, temp.val:%d", temp, temp.row, temp.col, temp.val);
        if(i == k - 1) { /// reacth the number
            return temp.val;
        }
        if(temp.col > 0) { /// check col > 0 for col - 1.
            PQNode *node = [[PQNode alloc] initWithRow:temp.row col:temp.col - 1 val:arrays[temp.row][temp.col - 1]];
            DLog(@"node:%@, node.row:%d, node.col:%d, node.val:%d", node, node.row, node.col, node.val);
            [pq offer:node];
        }
    }
    return -1;
}

- (void)test {
    int matrix[2][5] = {{9, 3, 2, 4, 8}, {1, 2, 3, 4, 2}};
    int** arrays = (int **)malloc(sizeof(int *) * 2);
    for(int i = 0; i < 2; i++) {
        arrays[i] = matrix[i];
    }
//    int res = [self kthInArrays:arrays row:2 col:5 k:1];
//    DLog(@"res:%d", res);
//    res = [self kthInArrays:arrays row:2 col:5 k:2];
//    DLog(@"res:%d", res);
    int res = [self kthInArrays:arrays row:2 col:5 k:6];
    DLog(@"res:%d", res);

//    int matrix[2][5] = {{9, 3, 2, 4, 7}, {8, 4, 3, 2, 1}};
//    int** arrays = (int **)malloc(sizeof(int *) * 2);
//    for(int i = 0; i < 2; i++) {
//        arrays[i] = matrix[i];
//    }
//    int res = [self kthInArrays:arrays row:2 col:5 k:3];
//    DLog(@"res:%d", res);
}

- (void)testPQ {
    
    PriorityQueue *pq = [[PriorityQueue alloc] init];
//    pq.comparator = ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//        Pair *node1 = (Pair *)obj1;
//        Pair *node2 = (Pair *)obj2;
//        DLog(@"node1:%d === node2.val:%d", node1.x, node2.x);
//        if(node1.x > node2.x) {
//            return NSOrderedAscending;
//        }
//        return NSOrderedDescending;
//    };
//    Pair *n1 = [[Pair alloc] initWith:1 y:1];
//    Pair *n2 = [[Pair alloc] initWith:1 y:2];
//    Pair *n3 = [[Pair alloc] initWith:2 y:2];
//    Pair *n4 = [[Pair alloc] initWith:2 y:2];
//    [pq offer:n1];
//    [pq offer:n2];
//    [pq offer:n3];
//    [pq offer:n4];
//    [pq printPQ];
//    while(![pq isEmpty]) {
//        Pair *top = [pq poll];
//        DLog(@"top:%@, top.x:%d, top.y:%d", top, top.x, top.y);
//    }
    
    pq.comparator = ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *num1 = (NSNumber *)obj1;
        NSNumber *num2 = (NSNumber *)obj2;
        DLog(@"num1:%ld compare:num2:%ld", num1.integerValue, num2.integerValue);
        if([num1 integerValue] > [num2 integerValue]) {
            return NSOrderedAscending;
        } else if ([num1 integerValue] == [num2 integerValue]) {
            return NSOrderedSame;
        }
        return NSOrderedDescending;
    };

    [pq offer:@(4)];
    [pq offer:@(2)];
    [pq offer:@(1)];
    [pq offer:@(3)];
    DLog(@"pq count:%ld", pq.size);
    [pq printPQ];
    [pq remove:@(3)];
    DLog(@"pq count:%ld", pq.size);
    [pq printPQ];
    [pq remove:@(4)];
    DLog(@"pq count:%ld", pq.size);
    [pq printPQ];
    [pq remove:@(1)];
    DLog(@"pq count:%ld", pq.size);
    [pq printPQ];
    while(![pq isEmpty]) {
        NSNumber *top = [pq poll];
        DLog(@"top:%ld", [top integerValue]);
    }
    DLog(@"pq is empty:%d == true", [pq isEmpty]);
    [pq offer:@(4)];
    [pq offer:@(2)];
    [pq offer:@(1)];
    [pq offer:@(3)];
    [pq printPQ];
    DLog(@"pq count:%ld", pq.size);
    /// Error example
    // void *pointer = (void *)malloc(sizeof(void));
    // pointer = (void *)CFBridgingRetain(n1);
    // pointer = (__bridge void *)(n1); /// error pointer being freed was not allocated
    // pointer = (__bridge_retained void *)(n1);
    // free(pointer);
}

@end
