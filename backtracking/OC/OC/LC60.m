//
//  LC60.m
//  OC
//
//  Created by ULS on 2/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC60.h"

@interface LC60()

- (NSString *)getPermutation:(int)n k:(int)k;

@end

@implementation LC60

- (NSString *)getPermutationGZ:(int)n k:(int)k {
    NSMutableArray *list = [NSMutableArray array];
    int* visited = (int *)calloc(n, sizeof(int));
    NSString *str = @"";
    [self backtrack:list n:n visited:visited str:str];
    if(list.count <= k - 1) {
        return @"";
    }
    return [list objectAtIndex:k - 1];
}

- (void)backtrack:(NSMutableArray *)list n:(int)n visited:(int *)visited str:(NSString *)str{
    if(str.length == n) {
        [list addObject:str];
        return;
    }
    
    for(int i = 1; i <= n; i++) {
        if(visited[i - 1] == 0) {
            visited[i - 1] = 1;
            NSString* newStr = [NSString stringWithFormat:@"%@%d", str, i];
            [self backtrack:list n:n visited:visited str:newStr];
            visited[i - 1] = 0;
        }
    }
}

- (NSString *)getPermutation:(int)n k:(int)k {
    NSMutableArray *indexes = [NSMutableArray array];
    for(int i = 1; i <= n; i++) {
        [indexes addObject:@(i)];
    }
//    DLog(@"indexes:%@", indexes);
    int *fact = (int *)calloc(n, sizeof(int));
    
    fact[0] = 1;
//    DLog(@"fact:[%d]:%d", 0, fact[0]);
    for(int i = 1; i < n; i++ ){ /// not to <= n, because we have to
        fact[i] = i * fact[i - 1];
//        DLog(@"fact:[%d]:%d", i, fact[i]);
        /// fact[1] = 1  {1}
        /// fact[2] = 2  {12, 21}
        /// fact[3] = 6  {123, 132, 213, 231, 312, 321}
        /// fact[4] = 24 {...}
    }
    
    k = k - 1;
    NSMutableString *str = [NSMutableString string];
    for(int i = n; i > 0; i--) {
        int index = k / fact[i - 1];
//        DLog(@"indexes[index:%d]:%ld = k:%d / fact[%d - 1]:%d", index, [indexes[index] integerValue], k, i, fact[i - 1]);
        k = k % fact[i - 1];
//        DLog(@"k:%d, fact[%d - 1]:%d", k, i, fact[i - 1]);
        if(index >= indexes.count) {
            return @"";
        }
        [str appendString:[NSString stringWithFormat:@"%ld", [[indexes objectAtIndex:index] integerValue]]];
//        DLog(@"str:%@", str);
        [indexes removeObjectAtIndex:index];
//        DLog(@"indexes:%@", indexes);
    }
//    DLog(@"str:%@", str);
    return [str copy];;
}

- (void)getPermutationList:(int)n {
    NSMutableArray *list = [NSMutableArray array];
    NSString *str = @"";
    int *visited = (int *)calloc(n, sizeof(int));
    
    [self dfs:list n:n str:str visited:visited];
    
    [list enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"idx:%ld => %@", (idx + 6) / 6, obj);
    }];
}

- (void)dfs:(NSMutableArray *)list n:(int)n str:(NSString *)str visited:(int *)visited {
    if(str.length == n) {
        [list addObject:str];
        return;
    }
    
    for(int i = 1; i <= n; i++) {
        if(visited[i - 1] == 0) {
            visited[i - 1] = 1;
            NSString *newStr = [str stringByAppendingFormat:@"%d", i];
            [self dfs:list n:n str:newStr visited:visited];
            visited[i - 1] = 0;
        }
    }
}

- (void)test {
//    [self getPermutationList:4];
    DLog(@"str:%@", [self getPermutationGZ:7 k:20]);
    DLog(@"str:%@", [self getPermutation:7 k:20]);
}

@end
