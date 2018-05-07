//
//  LC48.m
//  LC
//
//  Created by Admin  on 5/6/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC48.h"

@implementation LC48

- (void)rotate:(int** )matrix rows:(int)rows cols:(int)cols {
    if(rows == 0 || cols == 0) {
        return;
    }
    
    for(int i = 0; i < (rows + 1) / 2; i++) {
        for(int j = 0; j < cols / 2; j++) {
            int temp = matrix[i][j];
            
        }
    }
}

- (void)test {
    int** matrix;
    int grid[3][3] = {{1, 2, 3},
                      {4, 5, 6 },
                      {7, 8, 9}};
    matrix = (int **)malloc(3 * sizeof(int *));
    for(int i = 0; i < 3; i++) {
        matrix[i] = (int *)malloc(3 * sizeof(int));
    }

    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 3; j++) {
            matrix[i][j] = grid[i][j];
        }
    }
}
@end
