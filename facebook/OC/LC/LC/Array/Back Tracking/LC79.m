//
//  LC79.m
//  LC
//
//  Created by ULS on 2/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC79.h"

@interface LC79() {
    int dir[4][2];
}

- (BOOL)exist:(char** )board row:(int)row col:(int)col word:(char *)word;
- (BOOL)exist:(NSArray* )board word:(char *)word;

@end

@implementation LC79

- (instancetype)init {
    if(self = [super init]) {
        dir[0][0] = 0;
        dir[0][1] = 1;
        dir[1][0] = 0;
        dir[1][1] = -1;
        dir[2][0] = 1;
        dir[2][1] = 0;
        dir[3][0] = -1;
        dir[3][1] = 0;
    }
    return self;
}

- (BOOL)exist:(char** )board row:(int)row col:(int)col word:(char *)word {
    if(row == 0 || col == 0) {
        return NO;
    }
    
    int **visited = (int **)malloc(sizeof(int *) * row);
    for(int i = 0; i < row; i++) {
        visited[i] = calloc(col, sizeof(int *));
    }
    
    for(int i = 0; i < row; i++) {
        for(int j = 0; j < col; j++) {
            if(board[i][j] == word[0]) {
                if([self dfs:board row:row col:col x:i y:j visited:visited word:word idx:0]) {
                    return YES;
                }
            }
        }
    }
    return NO;
}

- (BOOL)dfs:(char **)board row:(int)row col:(int)col x:(int)x y:(int)y visited:(int **)visited word:(char*)word idx:(int)idx {
//    DLog(@"%ld, idx:%d, x:%d, y:%d, row:%d, col:%d", strlen(word), idx, x, y, row, col);
    if(x < 0 || y < 0 || x >= row || y >= col || visited[x][y] == 1 || board[x][y] != word[idx] || idx >= strlen(word)) {
        return NO;
    }
//    DLog(@"%ld, idx:%d, x:%d, y:%d, row:%d, col:%d, visited[x][y]:%d", strlen(word), idx, x, y, row, col, visited[x][y]);
    if(idx + 1== strlen(word)) {
        return YES;
    }
    visited[x][y] = 1;
    
//    DLog(@"%ld, idx:%d, x:%d, y:%d, row:%d, col:%d, visited[x][y]:%d", strlen(word), idx, x, y, row, col, visited[x][y]);
    BOOL isExist = [self dfs:board row:row col:col x:x + 1 y:y visited:visited word:word idx:idx + 1]
    || [self dfs:board row:row col:col x:x - 1 y:y visited:visited word:word idx:idx + 1]
    || [self dfs:board row:row col:col x:x y:y + 1 visited:visited word:word idx:idx + 1]
    || [self dfs:board row:row col:col x:x y:y - 1 visited:visited word:word idx:idx + 1];
    if(isExist == YES) {
        return YES;
    }
    
    visited[x][y] = 0;
//    DLog(@"%ld, idx:%d, x:%d, y:%d, row:%d, col:%d, visited[x][y]:%d", strlen(word), idx, x, y, row, col, visited[x][y]);
    return NO;
}

- (BOOL)exist:(NSArray<NSArray *> *)board word:(char *)word
{
    int row = (int)board.count;
    int col = 0;
    if ([board objectAtIndex:0]) {
        NSArray* array = (NSArray *)[board objectAtIndex:0];
        col = (int)[array count];
    }
    
    int **visited = [ArraysUtility generateBoolMatrix:row col:col];
    
    for (int i = 0; i < row; i++) {
        for(int j = 0; j < col; j++) {
            if ([self DFS:board row:row col:col x:i y:j visited:visited word:word idx:0] == true) {
                return true;
            }
        }
    }
    return false;
}

- (BOOL)DFS:(NSArray<NSArray *> *)board row:(int)row col:(int)col x:(int)x y:(int)y visited:(int **)visited word:(char *)word idx:(int)idx
{
    if (x < 0 || y < 0 || x >= row || y >= col || visited[x][y] == 1) {
        return false;
    }
    char c = [[[board objectAtIndex:x] objectAtIndex:y] charValue];
    if (c != word[idx]) {
        return false;
    }
    if (idx == strlen(word) - 1) {
        return true;
    }
    visited[x][y] = 1;
    for (int i = 0; i < 4; i++) {
        int nx = x + dir[i][0];
        int ny = y + dir[i][1];
        if ([self DFS:board row:row col:col x:nx y:ny visited:visited word:word idx:idx + 1] == true) {
            return true;
        }
    }
    visited[x][y] = 0;
    return false;
}


- (void)test {
    char temp[3][4] = {{'A','B','C','E'}, {'S','F','C','S'}, {'A','D','E','E'}};
    char** grid;
    grid = (char **)malloc(sizeof(char *) * 3);
    for(int i = 0; i < 3; i++) {
        grid[i] = (char *)malloc(sizeof(char *) * 4);
    }
    
    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 4; j++) {
            grid[i][j] = temp[i][j];
        }
    }
    
    DLog(@"%d", [self exist:grid row:3 col:4 word:"ABCCED"]);
    DLog(@"%d", [self exist:grid row:3 col:4 word:"SEE"]);
    DLog(@"%d", [self exist:grid row:3 col:4 word:"ABCB"]);
    
    NSArray<NSArray *> *matrix = [ArraysUtility generateCharMatrix:grid row:3 col:4];
    BOOL result = [self exist:matrix word: "ABCCED"];
    [PrintHelper printInteger: result];
    result = [self exist:matrix word: "SEE"];
    [PrintHelper printInteger: result];
    result = [self exist:matrix word: "ABCB"];
    [PrintHelper printInteger: result];
}
@end
