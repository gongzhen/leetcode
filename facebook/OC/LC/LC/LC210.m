//
//  LC210.m
//  LC
//
//  Created by ULS on 2/21/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC210.h"
#import "NSMutableArray+Queue.h"

@interface LC210()

- (NSArray *)findOrder:(int)numCourses prerequisites:(NSArray *)prerequisites;

@end

@implementation LC210

- (NSArray *)findOrder:(int)numCourses prerequisites:(NSArray *)prerequisites {
    NSMutableArray *edges = [NSMutableArray arrayWithCapacity:numCourses]; /// edges is list of list with size numCourses
    for(int i = 0; i < numCourses; i++) {
        [edges addObject:[NSMutableArray array]]; /// add empty array. [0, 1, 2, ... numCourses - 1]
    }
    
    int* indegree = (int *)calloc(numCourses, sizeof(int)); /// degree is array with 0 initialized .
    
    for(int i = 0; i < prerequisites.count; i++) {
        int prev = [[[prerequisites objectAtIndex:i] objectAtIndex:1] intValue]; /// prereq[i][1] is prev course
        int next = [[[prerequisites objectAtIndex:i] objectAtIndex:0] intValue]; /// prereq[i][0] is next course
        indegree[next]++; /// degree update prev
        [[edges objectAtIndex:prev] addObject:@(next)]; /// build edges.
    }
    
//    [edges enumerateObjectsUsingBlock:^(NSMutableArray*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"course:%ld {", idx);
//        [obj enumerateObjectsUsingBlock:^(NSNumber*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSLog(@"%d, ", [obj intValue]);
//        }];
//        NSLog(@"}");
//    }];
    
    NSMutableArray *queue = [NSMutableArray array];
    for(int i = 0; i < numCourses; i++) {
        if(indegree[i] == 0) {
            [queue offer:@(i)];
        }
    }
    
    int* order = (int *)calloc(numCourses, sizeof(int));
    int count = 0;
    while(queue.count != 0) {
        int course = [[queue poll] intValue];
        order[count] = course;
        DLog(@"count:%d => course:%d", count, course);
        count++;
        int size = (int)[[edges objectAtIndex:course] count];
        for(int i = 0; i < size; i++) {                 int pointer = [[[edges objectAtIndex:course] objectAtIndex:i] intValue];
            indegree[pointer]--;
            if(indegree[pointer] == 0) {
                [queue offer:@(pointer)];
            }
        }
    }
    if(count == numCourses) {
        NSMutableArray *res = [NSMutableArray arrayWithCapacity:numCourses];
        for(int i = 0; i < numCourses; i++) {
            [res addObject:@(order[i])];
        }
        return [res copy];
    }
    return [NSArray array];
}

- (void)test {
    NSMutableArray *prerequisites = [NSMutableArray array];
    int numCourses = 4;
    NSArray *array2 = @[@2, @0];
    [prerequisites addObject:array2];
    NSArray *array3 = @[@3, @1];
    [prerequisites addObject:array3];
    NSArray *array4 = @[@3, @2];
    [prerequisites addObject:array4];
    NSArray *array1 = @[@1, @0];
    [prerequisites addObject:array1];

    NSArray *res = [self findOrder:numCourses prerequisites:prerequisites];
    DLog(@"res:%@", res);
}

@end
