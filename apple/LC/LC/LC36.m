//
//  LC36.m
//  LC
//
//  Created by ULS on 4/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC36.h"

@implementation LC36

-(BOOL)isValidSudoku:(char** )board row:(int)row col:(int)col {
    if(row == 0 || col == 0) {
        return false;
    }
    
    for(int i = 0; i < row; i++) {
        NSMutableSet* rowSet = [[NSMutableSet alloc] init];
        NSMutableSet* colSet = [[NSMutableSet alloc] init];
        NSMutableSet* cubeSet = [[NSMutableSet alloc] init];
        for(int j = 0; j < col; j++) {
            if(board[i][j] != '.' && [rowSet containsObject:@(board[i][j])] == true) {
                return false;
            }
            [rowSet addObject:@(board[i][j])];
            if(board[j][i] != '.' && [colSet containsObject:@(board[j][i])] == true) {
                return false;
            }

            [rowSet addObject:@(board[j][i])];
            int rowIdx = 3 * (i / 3);
            int colIdx = 3 * (i % 3);
            if(board[rowIdx + j / 3][colIdx + j % 3] != '.' && [cubeSet containsObject:@(board[rowIdx + j / 3][colIdx + j % 3])] == true) {
                return false;
            }
            [cubeSet addObject:@(board[rowIdx + j / 3][colIdx + j % 3])];
        }
    }
    return true;
}

- (void)test {
    
}
@end
