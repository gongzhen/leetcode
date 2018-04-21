//
//  LC265.m
//  LC
//
//  Created by Zhen Gong on 4/21/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC265.h"

@implementation LC265

- (int)minCostII:(int** )costs row:(int)row k:(int)k {
    if(row == 0 || k == 0) {
        return 0;
    }
    
    int min1 = -1, min2 = -1;
    
    for(int i = 0; i < row; i++) {
        int last1 = min1, last2 = min2;
        min1 = 1;
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
    int res = [self minCostII:ptr row:3 k:3];
    DLog(@"res:%d", res);
    free(ptr);
}
@end
