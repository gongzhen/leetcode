//
//  LC444.m
//  LC
//
//  Created by Admin  on 3/14/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC444.h"
#import "Queue.h"

@interface LC444()

- (BOOL)sequenceReconstruction:(int*)org orgSize:(int)orgSize seqs:(int**)seqs seqsRow:(int)seqsRow;

@end

@implementation LC444

- (BOOL)sequenceReconstruction:(int*)org orgSize:(int)orgSize seqs:(int**)seqs seqsRow:(int)seqsRow{
    if(orgSize == 0 || seqsRow == 0) {
        return NO;
    }
    
    NSMutableDictionary<NSNumber *, NSMutableSet *> *map = [NSMutableDictionary dictionary];
    NSMutableDictionary<NSNumber *, NSNumber *> *indegree = [NSMutableDictionary dictionary];
    
    for(int i = 0; i < orgSize; i++) {
        [map setObject:[NSMutableSet set] forKey:@(org[i])];
        [indegree setObject:@(0) forKey:@(org[i])];
    }
    
    int count = 0;
    for(int i = 0; i < seqsRow; i++) {
        int len = sizeof(seqs[i]) / sizeof(int);
        count += len;
        if(len >= 1 && (seqs[i][0] <= 0 || seqs[i][0] > orgSize)) {
            return NO;
        }
        for(int j = 1; j < len; j++) {
            if(seqs[i][j] <= 0 || seqs[i][j] > orgSize) {
                return NO;
            }
            NSMutableSet *set = [map objectForKey:@(seqs[i][j - 1])];
            if(![set containsObject:@(seqs[i][j])]) {
                [set addObject:@(seqs[i][j])];
                int num = [[indegree objectForKey:@(seqs[i][j])] intValue];
                [indegree setObject:@(num + 1) forKey:@(seqs[i][j])];
            }
        }
    }
    [map enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSMutableSet * _Nonnull obj, BOOL * _Nonnull stop) {
        DLog(@"key:%ld", [key integerValue]);
        [obj enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
            DLog(@"obj:%ld", [obj integerValue]);
        }];
        NSLog(@"________________________________");
    }];
    if(count < orgSize) {
        return NO;
    }
    
    Queue* queue = [Queue queue];
    [indegree.allKeys enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id num = [indegree objectForKey:obj];
        if([num intValue] == 0) {
            [queue offer:obj];
        }
    }];
    
    
    int cnt = 0;
    while([queue getSize] == 1) {
        NSNumber * ele = [queue poll];
        NSMutableSet *set = [map objectForKey:ele];
        [set enumerateObjectsUsingBlock:^(id  _Nonnull next, BOOL * _Nonnull stop) {
            int num = [[indegree objectForKey:next] intValue];
            [indegree setObject:@(num - 1) forKey:next];
            if([[indegree objectForKey:next] intValue] == 0) {
                [queue offer:next];
            }
        }];
        if([ele intValue] != org[cnt]) {
            return NO;
        }
        cnt++;
    }
    
    return cnt == orgSize;
}

- (void)test {
//    int ORIGSIZE = 3;
//    int orgList[3]= {1, 2, 3};
//    int *org = (int *)calloc(3, sizeof(int));
//    for(int i = 0; i < 3; i++) {
//        org[i] = orgList[i];
//    }
//    int grid[2][2] = {{1, 2} ,{1, 3}};
//    int **seqs = (int **)malloc(2 * sizeof(int *));
//    for(int i = 0; i < 2; i++) {
//        seqs[i] = (int *)calloc(2, sizeof(int));
//    }
//
//    for(int i = 0; i < 2; i++) {
//        for(int j = 0; j < 2; j++) {
//            seqs[i][j] = grid[i][j];
//        }
//    }
//    DLog(@"res:%d", [self sequenceReconstruction:org orgSize:ORIGSIZE seqs:seqs seqsRow:2 seqsCol:2]);
//    for(int i = 0; i < 2; i++) {
//        free(seqs[i]);
//    }
//    free(seqs);
//    int ORIGSIZE = 3;
//    int orgList[3]= {1, 2, 3};
//    int *org = (int *)calloc(3, sizeof(int));
//    for(int i = 0; i < 3; i++) {
//        org[i] = orgList[i];
//    }
//    int grid[3][2] = {{1, 2} ,{1, 3}, {2, 3}};
//    int **seqs = (int **)malloc(3 * sizeof(int *));
//    for(int i = 0; i < 3; i++) {
//        seqs[i] = (int *)calloc(2, sizeof(int));
//    }
//
//    for(int i = 0; i < 3; i++) {
//        for(int j = 0; j < 2; j++) {
//            seqs[i][j] = grid[i][j];
//        }
//    }
//    DLog(@"res:%d", [self sequenceReconstruction:org orgSize:ORIGSIZE seqs:seqs seqsRow:3 seqsCol:2]);
//    for(int i = 0; i < 3; i++) {
//        free(seqs[i]);
//    }
//    free(seqs);
//    int ORIGSIZE = 6;
//    int orgList[6]= {4,1,5,2,6,3};
//    int *org = (int *)calloc(ORIGSIZE, sizeof(int));
//    for(int i = 0; i < ORIGSIZE; i++) {
//        org[i] = orgList[i];
//    }
//    int grid[2][4] = {{5,2,6,3} ,{4,1,5,2}};
//    int **seqs = (int **)malloc(2 * sizeof(int *));
//    for(int i = 0; i < 4; i++) {
//        seqs[i] = (int *)calloc(4, sizeof(int));
//    }
//
//    for(int i = 0; i < 2; i++) {
//        for(int j = 0; j < 4; j++) {
//            seqs[i][j] = grid[i][j];
//        }
//    }
//    DLog(@"res:%d", [self sequenceReconstruction:org orgSize:ORIGSIZE seqs:seqs seqsRow:2]);
//    for(int i = 0; i < 2; i++) {
//        free(seqs[i]);
//    }
//    free(seqs);
    
    int ORIGSIZE = 3;
    int orgList[3]= {1, 2, 3};
    int *org = (int *)calloc(ORIGSIZE, sizeof(int));
    for(int i = 0; i < ORIGSIZE; i++) {
        org[i] = orgList[i];
    }
    int grid[3][2] = {{1, 2} ,{1, 3}, {2, 3}};
    int **seqs = (int **)malloc(3 * sizeof(int *));
    for(int i = 0; i < 3; i++) {
        seqs[i] = (int *)calloc(3, sizeof(int));
    }
    
    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 2; j++) {
            seqs[i][j] = grid[i][j];
        }
    }
    DLog(@"res:%d", [self sequenceReconstruction:org orgSize:ORIGSIZE seqs:seqs seqsRow:3]);
    for(int i = 0; i < 3; i++) {
        free(seqs[i]);
    }
    free(seqs);
}

@end
