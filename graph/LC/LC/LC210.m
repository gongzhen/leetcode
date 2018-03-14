//
//  LC210.m
//  LC
//
//  Created by Admin  on 3/14/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC210.h"
#import "Queue.h"

@interface LC210()

- (NSArray *)findOrder:(int)numCourses prerequisites:(int **)prerequisites row:(int)row col:(int)col;

@end

@implementation LC210

- (NSArray *)findOrder:(int)numCourses prerequisites:(int **)prerequisites row:(int)row col:(int)col {
    if(row == 0 || col == 0) {
        return [NSArray array];
    }
    NSMutableArray<NSMutableArray *> *graph = [NSMutableArray array];
    for(int i = 0; i < numCourses; i++) {
        [graph addObject:[NSMutableArray array]];
    }
    
    int *indegree = (int *)calloc(numCourses, sizeof(int)); /// calloc!!! NOT malloc
    for(int i = 0; i < row; i++) {
        int prev = prerequisites[i][1]; //// REMEMBER PREV IS [1]
        int next = prerequisites[i][0]; //// REMEMBER NEXT IS [0]
        [[graph objectAtIndex:prev] addObject:@(next)];
        indegree[next]++;
    }
    
    Queue *queue = [Queue queue];
    for(int i = 0; i < numCourses; i++) {
        if(indegree[i] == 0) {
            [queue offer:@(i)];
        }
    }
    
    int *order = (int *)calloc(numCourses, sizeof(int));
    int idx = 0;
    while(![queue isEmpty]) {
        int course = [[queue poll] intValue];
        order[idx++] = course;
        NSInteger size = [graph objectAtIndex:course].count;
        for(int i = 0; i < size; i++) {
            int pointer = [[[graph objectAtIndex:course] objectAtIndex:i] intValue];
            indegree[pointer]--;
            if(indegree[pointer] == 0) {
                [queue offer:@(pointer)];
            }
        }
    }
    DLog(@"idx:%d", idx);
    if(idx == numCourses) {
        NSMutableArray *res = [NSMutableArray array];
        for(int i = 0; i < numCourses; i++) {
            [res addObject:@(order[i])];
        }
        return [res copy];
    }
    free(indegree);
    free(order);
    return [NSArray array];
}

- (void)test {
    int grid[4][2] = {{2, 0} ,{3, 1}, {3, 2}, {1, 0}};
    int **prerequisites = (int **)malloc(4 * sizeof(int *));
    for(int i = 0; i < 4; i++) {
        prerequisites[i] = (int *)calloc(2, sizeof(int));
    }
    
    for(int i = 0; i < 4; i++) {
        for(int j = 0; j < 2; j++) {
            prerequisites[i][j] = grid[i][j];
        }
    }
    
    NSArray *res = [self findOrder:4 prerequisites:prerequisites row:4 col:2];
    for(int i = 0; i < 4; i++) {
        free(prerequisites[i]);
    }
    free(prerequisites);
    DLog(@"res:%@", res);
}

@end
