//
//  LC286.m
//  LC
//
//  Created by Admin  on 2/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC286.h"
#import "NSMutableArray+Queue.h"
#import "Pair.h"

@interface LC286() {
    int dir[4][2];
}

- (void)wallsAndGates:(int **)rooms row:(int)row col:(int)col;

@end

@implementation LC286

- (instancetype)init {
    if(self = [super init]) {
        ///{{0, 1}, {0, -1}, {1, 0}, {-1, 0}}
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

- (void)wallsAndGates:(int **)rooms row:(int)row col:(int)col {
    if(row == 0 || col == 0) {
        return;
    }
    
    NSMutableArray *queue = [NSMutableArray queue];
    
    for(int i = 0; i < row; i++) {
        for(int j = 0; j < col; j++) {
            printf("\t%d", rooms[i][j]);
            if(rooms[i][j] == 0) {
                [queue offer:[[Pair alloc] initWith:i y:j]];
            }
        }
        printf("\n");
    }
    printf("\n");
    
    int x = 0;
    int y = 0;
    
    while(queue.count != 0) {
        Pair *top = (Pair *)[queue poll];
        for(int i = 0; i < 4; i++) {
            x = top.x + dir[i][0];
            y = top.y + dir[i][1];
            if(x < 0 || y < 0 || x >= row || y >= col || rooms[x][y] != INT_MAX) {
                continue;
            }
            rooms[x][y] = rooms[top.x][top.y] + 1;
            /// push INT_MAX spot to queue and find the INT_MAX nearby.
            [queue offer:[[Pair alloc] initWith:x y:y]];
        }
    }
    
    for(int i = 0; i < row; i++) {
        for(int j = 0; j < col; j++) {
            printf("\t%d", rooms[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}


- (void)test {
    int **rooms;
    int grid[4][4] = {  {INT_MAX, -1, 0, INT_MAX},
                        {INT_MAX, INT_MAX, INT_MAX, -1},
                        {INT_MAX, -1, INT_MAX, -1},
                        {0, -1, INT_MAX, INT_MAX}
                    };
    rooms = (int **)malloc(4 * sizeof(int *));
    for(int i = 0; i < 4; i++) {
        rooms[i] = (int *)malloc(4 * sizeof(int));
    }
    
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
            rooms[i][j] = grid[i][j];
        }
    }
    [self wallsAndGates:rooms row:4 col:4];
}

@end
