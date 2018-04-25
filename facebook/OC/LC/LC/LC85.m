//
//  LC85.m
//  LC
//
//  Created by Admin  on 4/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC85.h"
#import "NSMutableArray+Stack.h"
#import "QuickSort.h"

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
    [QuickSort printCharMatrix:matrix row:row col:col];
    DLog(@"for loop --------------------------------------------------------------------------");
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
        [QuickSort printIntArray:left size:col];
        for(int j = col - 1; j >= 0; j--) {
            if(matrix[i][j] == '1') {
                right[j] = MIN(right[j], currentRight);
            } else {
                right[j] = col;
                currentRight = j;
            }
        }
        
        [QuickSort printIntArray:right size:col];
        for(int j = 0; j < col; j++) {
            if(matrix[i][j] == '1') {
                height[j]++;
            } else {
                height[j] = 0;
            }
        }
        [QuickSort printIntArray:height size:col];
        
        for(int j = 0; j < col; j++) {
            res = MAX(res, (right[j] - left[j]) * height[j]);
            DLog(@"(res:%d = right[%d]:%d - left[%d]:%d) * height[j:%d]:%d",res, j, right[j], left[j], left[j], j, height[j]);
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
    [QuickSort printCharMatrix:matrix row:row col:col];
    DLog(@"for loop --------------------------------------------------------------------------");
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
            [QuickSort printIntArray:height size:col];
            DLog(@"for stack--------------------------------------------------------------------------");
            [stack printStack];
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
    
//    char* grid[1] = {"1"};
//    char** board = (char **)malloc(1 * sizeof(char *));
//    for(int i = 0; i < 1; i++) {
//        board[i] = (char *)malloc(1 * sizeof(char));
//    }
//
//    for(int i = 0; i < 1; i++) {
//        board[i] = grid[i];
//    }
//    int res = [self maximalRectangle:board row:1 col:1];
//    int res2 = [self maximalRectangle_stack:board row:1 col:1];
//    DLog(@"res:%d", res);
//    DLog(@"res2:%d", res2);
//    free(board);
}

@end
