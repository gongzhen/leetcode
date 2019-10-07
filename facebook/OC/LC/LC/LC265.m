//
//  LC265.m
//  LC
//
//  Created by Zhen Gong on 4/21/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC265.h"
#import "QuickSort.h"

@implementation LC265

/**
 
 There are a row of n houses, each house can be painted with one of the k colors. The cost of painting each house with
 a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.
 
 The cost of painting each house with a certain color is represented by a n x k cost matrix. For example,costs[0][0]
 is the cost of painting house 0 with color 0; costs[1][2] is the cost of painting house 1 with color 2, and so on...
 Find the minimum cost to paint all houses.
 
 Note:
 All costs are positive integers.
 
 Follow up:
 Could you solve it in O(nk) runtime?
 
 */
/// http://www.cnblogs.com/yrbbest/p/5020937.html
- (int)minCostII_2:(int** )costs row:(int)row k:(int)k {
    [QuickSort printIntMatrix:costs row:row col:k];
    if(row == 0 || k == 0) {
        return 0;
    }
    
    NSInteger minCost = 0;
    NSInteger secondMinCost = 0;
    NSInteger lastColor = 0;
    
    for(int i = 0; i < row; i++) {
        NSInteger curMin = NSIntegerMax;
        NSInteger curSecondMin = NSIwntegerMax;
        int curColor = 0;
        for(int j = 0; j < k; j++) {
            int curCost = 0;
            if(j == lastColor) {
                curCost = costs[i][j] + (int)secondMinCost;
            } else {
                curCost = costs[i][j] + (int)minCost;
            }
            
            if(curCost < curMin) {
                curSecondMin = curMin;
                curMin = curCost;
                curColor = j;
            } else if (curCost < curSecondMin) {
                curSecondMin = curCost;
            }
        }
        minCost = curMin;
        secondMinCost = curSecondMin;
        lastColor = curColor;
    }
    return (int)minCost;
}
- (int)minCostII:(int** )costs row:(int)row k:(int)k {
    [QuickSort printIntMatrix:costs row:row col:k];
    if(row == 0 || k == 0) {
        return 0;
    }
    
    int min1 = -1, min2 = -1;
    
    for(int i = 0; i < row; i++) {
        int last1 = min1, last2 = min2;
        min1 = -1;
        min2 = -1;
        for(int j = 0; j < k; j++) {
            if(j != last1) {
                costs[i][j] += last1 < 0 ? 0 : costs[i-1][last1];
            } else {
                costs[i][j] += last2 < 0 ? 0 : costs[i-1][last2];
            }
            if(min1 < 0 || costs[i][j] < costs[i][min1]) {
                min2 = min1;
                min1 = j;
            } else {
                min2 = j;
            }
        }
    }
    return costs[row - 1][min1];
}

- (void)test {
    int cost[3][3] = {{14,2,11},{11,14,5},{14,3,10}};
    int** ptr = (int **)malloc(sizeof(int *) * 3);
    for(int i = 0; i < 3; i++) {
        ptr[i] = cost[i];
    }
    int res = [self minCostII_2:ptr row:3 k:3];
    DLog(@"res:%d", res);
    free(ptr);
}
@end
