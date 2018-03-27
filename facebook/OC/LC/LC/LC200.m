//
//  LC200.m
//  LC
//
//  Created by ULS on 2/14/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC200.h"
#import "Queue.h"
#import "Pair.h"

@interface LC200() {
    int dir[4][2];
}

- (NSInteger)numIslands:(char** )grid gridRowSize:(int)gridRowSize gridColSize:(int)gridColsize;
- (NSInteger)numIslandsBFS:(char** )grid gridRowSize:(int)gridRowSize gridColSize:(int)gridColsize;

@end

@implementation LC200

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

- (NSInteger)numIslands:(char** )grid gridRowSize:(int)gridRowSize gridColSize:(int)gridColsize {
    int m = gridRowSize;
    int n = gridColsize;
    DLog(@"m:%d, n:%d", m, n)
    NSInteger count = 0;

    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            if(grid[i][j] == '1') {
                [self dfs:grid m:m n:n x:i y:j];
                count++;
            }
        }
    }
    return count;
}

- (NSInteger)numIslandsBFS:(char** )grid gridRowSize:(int)gridRowSize gridColSize:(int)gridColsize {
    int m = gridRowSize;
    int n = gridColsize;
    DLog(@"m:%d, n:%d", m, n)
    NSInteger count = 0;
    
    for(int i = 0; i < m; i++) {
        for(int j = 0; j < n; j++) {
            if(grid[i][j] == '1') {
                [self bfs:grid m:m n:n x:i y:j];
                count++;
            }
        }
    }
    return count;
}

- (void)bfs:(char **)grid m:(int)m n:(int)n x:(int)x y:(int)y {
    Queue* pq = [Queue queue];
    [pq offer:[[Pair alloc] initWith:x y:y]];
    grid[x][y] = '0';
    
    while(![pq isEmpty]) {
        Pair *top = [pq poll];
        x = top.x;
        y = top.y;
        for(int i = 0; i < 4; i++) {
            int _x = x + dir[i][0];
            int _y = y + dir[i][1];
            if(_x < 0 || _y < 0 || _x >= m || _y >= n || grid[_x][_y] == '0') {
                continue;
            }
            [pq offer:[[Pair alloc] initWith:_x y:_y]];
            grid[_x][_y] = '0';
        }
    }
}

- (void)dfs:(char** )grid m:(int)m n:(int)n x:(int)x y:(int)y {
    if(x < 0 || y < 0 || x >= m || y >= n || grid[x][y] == '0') {
        return;
    }

    grid[x][y] = '0';
    for(int i = 0; i < 4; i++) {
        int _x = x + dir[i][0];
        int _y = y + dir[i][1];
        [self dfs:grid m:m n:n x:_x y:_y];
    }
}

- (void)test {
    char* temp[4] = {"11110", "11000", "00100", "00011"};
    /// 1: cannot do grid[4][5], you cannot pass to function(char** grid)
    /// 2: Create char** grid first.
    /// 3: malloc 4 and 5 for row and col.
    /// https://stackoverflow.com/questions/16724368/how-to-pass-a-2d-array-by-pointer-in-c
    /// 4:for each row from 0 to 4, malloc space for char[] as 5.
    /// 5: assign char to grid.
    /// Remember "abced" is immutable.
    char** grid;
    grid = (char**)malloc(4 * sizeof(*grid));
    for(int i = 0; i < 4; i++) {
        grid[i] = (char *)malloc(5);
    }
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < strlen(temp[0]); j++) {
            grid[i][j] = *(temp[i] + j);
        }
    }
    DLog(@"count:%ld", [self numIslands:grid gridRowSize:4 gridColSize:5]);
}

@end
