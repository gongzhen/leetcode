//
//  LC207.m
//  LC
//
//  Created by ULS on 2/21/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC207.h"
#import "NSMutableArray+Queue.h"

@interface LC207()

- (BOOL)canFinish:(int)numCourses  prerequisites:(NSMutableArray *)prerequisites;
@end

@implementation LC207

- (BOOL)canFinish:(int)numCourses  prerequisites:(NSMutableArray *)prerequisites {
    NSMutableArray *edges = [NSMutableArray arrayWithCapacity:numCourses];
    int* degree = (int *)calloc(numCourses, sizeof(int));
    /// edges is a graph which is arraylist of arraylist.
    for(int i = 0; i < numCourses; i++) {
        [edges addObject:[NSMutableArray array]];
    }
    
    for(int i = 0; i < [prerequisites count]; i++) {
//        DLog(@"prerequisites objectAtIndex:i] :%@",  [[prerequisites objectAtIndex:i] objectAtIndex:0]);
//        DLog(@"prerequisites objectAtIndex:i] :%@",  [[prerequisites objectAtIndex:i] objectAtIndex:1]);
        int prev = [[[prerequisites objectAtIndex:i] objectAtIndex:0] intValue];
        int next = [[[prerequisites objectAtIndex:i] objectAtIndex:1] intValue];
        degree[prev]++;
        [[edges objectAtIndex:next] addObject:@(prev)];
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
        if(degree[i] == 0) {
            [queue offer:@(i)];
        }
    }
    
    int count = 0;
    while(queue.count != 0) {
        int course = [[queue poll] intValue];
        count++;
        int size = (int)[[edges objectAtIndex:course] count];
        for(int i = 0; i < size; i++) {
            int pointer = [[[edges objectAtIndex:course] objectAtIndex:i] intValue];
            degree[pointer]--;
            if(degree[pointer] == 0) {
                [queue offer:@(pointer)];
            }
        }
    }
    
    return count == numCourses;
}

- (void)test {
    NSMutableArray *prerequisites = [NSMutableArray array];
    int numCourses = 2;
    NSArray *array1 = @[@1, @0];
    [prerequisites addObject:array1];
    NSArray *array2 = @[@0, @1];
    [prerequisites addObject:array2];
    
    DLog(@"res:%d", [self canFinish:numCourses prerequisites:prerequisites]);
    [prerequisites removeAllObjects];
}
@end
