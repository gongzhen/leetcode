//
//  LC444.m
//  LC
//
//  Created by Admin  on 3/14/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC444.h"

@interface LC444()

- (BOOL)sequenceReconstruction:(int*)org orgSize:(int)orgSize seqs:(int**)seqs seqsRow:(int)seqsRow seqsCol:(int)seqsCol;

@end

@implementation LC444

- (BOOL)sequenceReconstruction:(int*)org orgSize:(int)orgSize seqs:(int**)seqs seqsRow:(int)seqsRow seqsCol:(int)seqsCol {
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
        count += seqsCol;
        if(seqsCol >= 1 && (seqs[i][0] <= 0 || seqs[i][0] > orgSize)) {
            return NO;
        }
        for(int j = 1; j < seqsCol; j++) {
            if(seqs[i][j] <= 0 || seqs[i][j] > orgSize) {
                return NO;
            }
            NSMutableSet *set = [map objectForKey:@(seqs[i][j - 1])];
            if(![set containsObject:@(seqs[i][j])]) {
                [set addObject:@(seqs[i][j])];
                
            }
            
        }
        
    }
    
    return YES;
}

- (void)test {
    int ORIGSIZE = 3;
    int orgList[3]= {1, 2, 3};
    int *org = (int *)calloc(3, sizeof(int));
    for(int i = 0; i < 3; i++) {
        org[i] = orgList[i];
    }
    int grid[2][2] = {{1, 2} ,{1, 3}};
    int **seqs = (int **)malloc(2 * sizeof(int *));
    for(int i = 0; i < 2; i++) {
        seqs[i] = (int *)calloc(2, sizeof(int));
    }
    
    for(int i = 0; i < 2; i++) {
        for(int j = 0; j < 2; j++) {
            seqs[i][j] = grid[i][j];
        }
    }
    [self sequenceReconstruction:org orgSize:ORIGSIZE seqs:seqs seqsRow:2 seqsCol:2];
    for(int i = 0; i < 2; i++) {
        free(seqs[i]);
    }
    free(seqs);
    
}

@end
