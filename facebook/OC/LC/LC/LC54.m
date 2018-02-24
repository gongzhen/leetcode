//
//  LC54.m
//  LC
//
//  Created by ULS on 2/23/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC54.h"

@interface LC54()

-(NSArray *)spiralOrder:(int **)matrix row:(int)row col:(int)col;

@end

@implementation LC54

-(NSArray *)spiralOrder:(int **)matrix row:(int)row col:(int)col {
    int beginRow = 0;
    int beginCol = 0;
    int endRow = row - 1;
    int endCol = col - 1;
    NSMutableArray *res = [NSMutableArray array];
    while(beginRow <= endRow && beginCol <= endCol) {
        for(int i = beginCol; i <= endCol; i++) {
            [res addObject:@(matrix[beginRow][i])];
        }
        beginRow++;
        
        for(int i = beginRow; i <= endRow; i++) {
            [res addObject:@(matrix[i][endCol])];
        }
        endCol--;
        
        /// check beginRow and endRow.
        /// beiginRow == endRow is okey.
        if(beginRow <= endRow) {
            /// [1, 2]
            //  [3, 4]
            for(int i = endCol; i>= beginCol; i--) {
                [res addObject:@(matrix[endRow][i])];
            }
        }
        endRow--;
        
        if(beginCol <= endCol) {
            for(int i = endRow; i>= beginRow; i--) {
                [res addObject:@(matrix[i][beginCol])];
            }
        }
        beginCol++;
    }
    
    return [res copy];
}

- (void)test {
//    int** matrix;
//    int grid[3][3] = {{1, 2, 3},
//                      {4, 5, 6 },
//                      {7, 8, 9}};
//    matrix = (int **)malloc(3 * sizeof(int *));
//    for(int i = 0; i < 3; i++) {
//        matrix[i] = (int *)malloc(3 * sizeof(int));
//    }
//
//    for(int i = 0; i < 3; i++) {
//        for(int j = 0; j < 3; j++) {
//            matrix[i][j] = grid[i][j];
//        }
//    }
//
//    NSArray *res = [self spiralOrder:matrix row:3 col:3];
//    [res enumerateObjectsUsingBlock:^(NSNumber*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"%ld", [obj integerValue]);
//    }];
    
//    int** matrix;
//    int grid[2][2] = {{1, 2},
//                      {4, 5}};
//    matrix = (int **)malloc(2 * sizeof(int *));
//    for(int i = 0; i < 2; i++) {
//        matrix[i] = (int *)malloc(2 * sizeof(int));
//    }
//
//    for(int i = 0; i < 2; i++) {
//        for(int j = 0; j < 2; j++) {
//            matrix[i][j] = grid[i][j];
//        }
//    }
//
//    NSArray *res = [self spiralOrder:matrix row:2 col:2];
//    [res enumerateObjectsUsingBlock:^(NSNumber*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"%ld", [obj integerValue]);
//    }];
    
    int** matrix;
    int grid[1][2] = {{1, 2}};
    matrix = (int **)malloc(1 * sizeof(int *));
    for(int i = 0; i < 1; i++) {
        matrix[i] = (int *)malloc(1 * sizeof(int));
    }

    for(int i = 0; i < 1; i++) {
        for(int j = 0; j < 2; j++) {
            matrix[i][j] = grid[i][j];
        }
    }

    NSArray *res = [self spiralOrder:matrix row:1 col:2];
    [res enumerateObjectsUsingBlock:^(NSNumber*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"%ld", [obj integerValue]);
    }];

}

@end
