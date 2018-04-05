//
//  LC130.m
//  LC
//
//  Created by Admin  on 3/1/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC130.h"
#import "NSMutableArray+Queue.h"
#import "Pair.h"

@interface LC130()

- (void)sove:(char **)board row:(int)row col:(int)col;

@end

@implementation LC130

/**
 Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.
 
 A region is captured by flipping all 'O's into 'X's in that surrounded region.
 
 For example,
     X X X X
     X O O X
     X X O X
     X O X X
 
 */

- (void)sove:(char **)board row:(int)row col:(int)col {
    if(row == 0 || col == 0) {
        return;
    }
    
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
            printf("\t%c", board[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    
    /// visited matrix initialized to 0.
    int** visited = (int **)malloc(row * sizeof(int *));
    for(int i = 0; i < row; i++) {
        visited[i] = calloc(col, sizeof(int));
    }
    NSMutableArray *queue = [NSMutableArray queue];
    /// first row
    for(int j = 0; j < col; j++) {
        if(board[0][j] == 'O') {
            [queue offer:[[Pair alloc] initWith:0 y:j]];
            visited[0][j] = 1;
        }
    }
    
    /// last row
    for(int j = 0; j < col; j++) {
        if(board[row - 1][j] == 'O') {
            [queue offer:[[Pair alloc] initWith:row - 1 y:j]];
            visited[row - 1][j] = 1;
        }
    }
    
    // first col
    for(int i = 0; i < row; i++) {
        if(board[i][0] == 'O') {
            [queue offer:[[Pair alloc] initWith:i y:0]];
            visited[i][0] = 1;
        }
    }
    
    // last col
    for(int i = 0; i < row; i++) {
        if(board[i][col - 1] == 'O') {
            [queue offer:[[Pair alloc] initWith:i y:col - 1]];
            visited[i][col - 1] = 1;
        }
    }
    
    int x = 0;
    int y = 0;
    while(queue.count != 0) {
        Pair *top = (Pair *)[queue poll];
        for(int i = 0; i < 4; i++) {
            x = top.x + dir[i][0];
            y = top.x + dir[i][1];
            if(x < 0 || y < 0 || x >= 0 || y >= 0 || visited[x][y] == 1 || board[x][y] != 'O') {
                continue;
            }
            visited[x][y] = 1;
            /// visited is false and board is O
            printf("[x:%d][y:%d]\n", x, y);
            [queue offer:[[Pair alloc] initWith:x y:y]];
        }
    }
    
    for(int i = 0; i < row; i++) {
        for(int j = 0; j < col; j++) {
            if(visited[i][j] == 0 && board[i][j] == 'O') {
                board[i][j] = 'X';
            }
            printf("\t%c", board[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

- (void)test {
    char* grid[4] = {"OXXX", "XOOX", "XOOX", "XOXX"};
    char** board = (char **)malloc(4 * sizeof(char *));
    for(int i = 0; i < 4; i++) {
        board[i] = (char *)malloc(4 * sizeof(char));
    }
    
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
            board[i][j] = grid[i][j];
        }
    }
    
    [self sove:board row:4 col:4];
}

@end
