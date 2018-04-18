//
//  LC85.m
//  LC
//
//  Created by Admin  on 4/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC85.h"
#import "NSMutableArray+Stack.h"

@implementation LC85

- (int)maximalRectangle:(char** )matrix row:(int)row col:(int)col {
    if(row == 0 || col == 0) {
        return 0;
    }
    
    int* left = (int *)calloc(col, sizeof(int));
    int* right = (int *)calloc(col, sizeof(int));
    for(int i = 0; i < col; i++) {
        right[i] = col;
    }
    int* height = (int *)calloc(col, sizeof(int));
    int res = 0;
    for(int i = 0; i < row; i++) {
        int currentLeft = 0, currentRight = col;
        for(int j = 0; j < col; j++) {
            if(matrix[i][j] == '1') {
                left[j] = MAX(left[j], currentLeft);
            } else {
                left[j] = 0;
                currentLeft = j + 1;
            }
            
        }
        
        for(int j = col - 1; j >= 0; j--) {
            if(matrix[i][j] == '1') {
                right[j] = MIN(right[j], currentRight);
            } else {
                right[j] = col;
                currentRight = j;
            }
        }
        
        for(int j = 0; j < col; j++) {
            if(matrix[i][j] == '1') {
                height[j]++;
            } else {
                height[j] = 0;
            }
        }
        
        for(int j = 0; j < col; j++) {
            res = MAX(res, (right[j] - left[j]) * height[j]);
        }
    }
    free(left);
    free(right);
    free(height);
    return res;
}

- (int)maximalRectangle_stack:(char** )matrix row:(int)row col:(int)col {
    if(row == 0 || col == 0) {
        return 0;
    }
    
    int* height = (int *)calloc(col + 1, sizeof(int));
    int res = 0;
    
    for(int i = 0; i < row; i++) {
        NSMutableArray *stack = [[NSMutableArray alloc] init];
        for(int j = 0; j < col + 1; j++) {
            if(j < col) {
                if(matrix[i][j] == '1') {
                    height[j]++;
                } else {
                    height[j] = 0;
                }
            }
            
            if(stack.count == 0 || height[[[stack peek] intValue]] <= height[j]) {
                [stack push:@(j)];
            } else {
                while(stack.count != 0 && height[[[stack peek] intValue]] > height[j]) {
                    int current = height[[[stack pop] intValue]] * (stack.count == 0 ? j : (j - [[stack peek] intValue] - 1));
                    res = MAX(res, current);
                }
                [stack push:@(j)];
            }
        }
    }
    return res;
}

- (void)test {
    char* grid[4] = {"10100", "10111", "11111", "10010"};
    char** board = (char **)malloc(4 * sizeof(char *));
    for(int i = 0; i < 4; i++) {
        board[i] = (char *)malloc(4 * sizeof(char));
    }
    
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 5; j++) {
            board[i][j] = grid[i][j];
        }
    }
    int res = [self maximalRectangle:board row:4 col:5];
    int res2 = [self maximalRectangle_stack:board row:4 col:5];
    DLog(@"res:%d", res);
    DLog(@"res2:%d", res2);
    for(int i = 0; i < 4; i++) {
        free(board[i]);
    }
    free(board);
}
@end
