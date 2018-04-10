//
//  LC48.m
//  LC
//
//  Created by ULS on 4/9/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC48.h"

@implementation LC48
/// http://www.cnblogs.com/yrbbest/p/4436352.html
/// Remember row + 1 / 2
/// Remember co / 2
- (void)rotate:(int** )matrix row:(int)row col:(int)col {
    
    for(int i = 0; i < (row + 1) / 2 ; i++) {
        for(int j = 0; j < col / 2; j++) {
            int tmp = matrix[i][j];
            matrix[i][j] = matrix[row - j - 1][i];
            matrix[row - j - 1][i] = matrix[row - i - 1][row - j - 1];
            matrix[row - i - 1][row - j - 1] = matrix[j][col - i - 1];
            matrix[j][col - i - 1] = tmp;
            [self printMatrix:matrix row:row col:col];
            DLog(@"\n---------------------------------------");
        }
    }
}

- (void)printMatrix:(int** )matrix row:(int)row col:(int)col {
    for(int i = 0; i < row; i++) {
        for(int j = 0; j < col; j++) {
            printf("\t%d", matrix[i][j]);
        }
        printf("\n");
    }
}

/// row == col
- (void)test {
//    int matrix[3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
//    /// int (*ptr)[3] = matrix;
//    int** ptr = (int **)malloc(sizeof(int *) * 3);
//    for(int i = 0; i < 3; i++) {
//        ptr[i] = matrix[i];
//    }
//    [self printMatrix:ptr row:3 col:3];
//    DLog(@"\n---------------------------------------");
//    [self rotate:ptr row:3 col:3];

    int matrix[4][4] = {{5, 1, 9, 11}, {2, 4, 8, 10}, {13, 3, 6, 7}, {15, 14, 12, 16}};
    /// int (*ptr)[3] = matrix;
    int** ptr = (int **)malloc(sizeof(int *) * 4);
    for(int i = 0; i < 4; i++) {
        ptr[i] = matrix[i];
    }
    [self printMatrix:ptr row:4 col:4];
    DLog(@"\n---------------------------------------");
    [self rotate:ptr row:4 col:4];
    
}


@end
