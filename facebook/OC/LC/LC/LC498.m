//
//  LC498.m
//  LC
//
//  Created by Admin  on 3/30/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC498.h"

@interface LC498()

- (int *)findDiagonalOrder:(int **)matrix row:(int)row col:(int)col size:(int *)size ;

@end

@implementation LC498

- (int *)findDiagonalOrder:(int **)matrix row:(int)row col:(int)col size:(int *)size {
    if(row == 0) {
        return NULL;
    }
    
    int* res = (int *)malloc(sizeof(int) * row * col);
    
    int m = 0;
    int n = 0;
    int d = 1;
    for(int i = 0; i < row * col; i++) {
        res[i] = matrix[m][n];
        m -= d;
        n += d;
        
        if(m >= row) {
            m = row - 1;
            n += 2;
            d = -d;
        }
        if(n >= col) {
            n = col - 1;
            m += 2;
            d = -d;
        }
        if(m <0) {
            m = 0;
            d = -d;
        }
        if(n < 0) {
            n = 0;
            d = -d;
        }
    }
    *size = row * col;
    return res;
}

- (void)test {
    int grid[3][3] = {{ 1, 2, 3 }, {4, 5, 6}, {7, 8, 9}};
    int** matrix = (int **)malloc(sizeof(int *) * 3);
    for(int i = 0; i < 3; i++) {
        matrix[i] = malloc(sizeof(int) * 3);
    }
    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 3; j++) {
            matrix[i][j] = grid[i][j];
        }
    }
    int returnSize = 0;
    int* res = [self findDiagonalOrder:matrix row:3 col:3 size:&returnSize];
    for(int i = 0; i < returnSize; i++) {
        printf("%d\n", res[i]);
    }
}
@end
