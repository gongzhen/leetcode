//
//  LC207.m
//  LC
//
//  Created by Zhen Gong on 3/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC207.h"
#import "Queue.h"

@interface LC207()

- (BOOL)canFinish:(int)numCourses prerequisites:(int **)prerequisites row:(int)row col:(int)col;

@end

@implementation LC207

- (BOOL)canFinish:(int)numCourses prerequisites:(int **)prerequisites row:(int)row col:(int)col {
    if(row == 0 || col == 0) {
        return NO;
    }
    
    NSMutableArray *graph = [NSMutableArray arrayWithCapacity:numCourses];
    for(int i = 0; i < numCourses; i++) {
        [graph addObject:[NSMutableArray array]];
    }
    
    int* indegree = (int *)calloc(numCourses, sizeof(int));
    for(int i = 0; i < row; i++) {
        /// [1,0] ==> start first class: 0 then next class: 1.
        int first = prerequisites[i][1];
        int next = prerequisites[i][0];
        [[graph objectAtIndex:first] addObject:@(next)];
        indegree[next]++;
    }
    
    Queue *queue = [Queue queue];
    for(int i = 0; i < numCourses; i++) {
        if(indegree[i] == 0) {
            [queue offer:@(i)];
        }
    }
    __block int count = 0;
    while(![queue isEmpty]) {
        int top = ((NSNumber *)[queue poll]).intValue;
        NSArray *list = [graph objectAtIndex:top];
        [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            int n = ((NSNumber *)obj).intValue;
            count++;
            DLog(@"%d", count);
            indegree[n]--;
            if(indegree[n] == 0) {
                [queue offer:@(n)];
            }
        }];
    }
    DLog(@"%d", count == row);
    return count == row;
}

- (void)test {
//    int grid[2][2] = {{1, 0}, {0, 1}};
//    int **prerequisites = (int **)malloc(2 * sizeof(int *));
//    for(int i = 0; i < 2; i++) {
//        prerequisites[i] = (int *)malloc(2 * sizeof(int));
//    }
//    for(int i = 0; i < 2; i++) {
//        for(int j = 0; j < 2; j++) {
//            prerequisites[i][j] = grid[i][j];
//        }
//    }
//    [self canFinish:2 prerequisites:prerequisites row:2 col:2];
    
    int grid[5][2] = {{ 1, 0 }, { 2, 0 }, { 3, 1 }, { 3, 2 }, { 2, 4 }};
    int **prerequisites = (int **)malloc(5 * sizeof(int *));
    for(int i = 0; i < 5; i++) {
        prerequisites[i] = (int *)malloc(2 * sizeof(int));
    }
    for(int i = 0; i < 5; i++) {
        for(int j = 0; j < 2; j++) {
            prerequisites[i][j] = grid[i][j];
        }
    }
    [self canFinish:5 prerequisites:prerequisites row:5 col:2];
}

@end
