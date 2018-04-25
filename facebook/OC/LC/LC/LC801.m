//
//  LC801.m
//  LC
//
//  Created by Admin  on 4/22/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC801.h"
#import "QuickSort.h"

@implementation LC801

- (int)minSwap:(int*)A aSize:(int)ASize B:(int*)B  bSize:(int)BSize {
    long int ans = NSIntegerMax;
    [self dfs:A aSize:ASize B:B bSize:BSize i:0 count:0 ans:&ans];
    return (int)ans;
}

- (void)dfs:(int* )A aSize:(int)ASize B:(int*)B bSize:(int)BSize i:(int)i count:(int)count ans:(long *)ans{
    if(count >= *ans) {
        return;
    }
    
    if(i == ASize) {
        *ans = MIN(*ans, count);
        return;
    }
    
    if(i == 0 || (A[i] > A[i - 1] && B[i] > B[i - 1])) {
        [self dfs:A aSize:ASize B:B bSize:BSize i:i + 1 count:count ans:ans];
    }
    
    if(i == 0 || (A[i] > B[i - 1] && B[i] > A[i - 1])) {
        [self swap:A i:i B:B j:i];
        [QuickSort printIntArray:A size:ASize];
        [QuickSort printIntArray:B size:BSize];
        DLog(@"----------------------------------------------------------------------------")
        [self dfs:A aSize:ASize B:B bSize:BSize i:i+1 count:count + 1 ans:ans];
        [self swap:A i:i B:B j:i];
        [QuickSort printIntArray:A size:ASize];
        [QuickSort printIntArray:B size:BSize];
        DLog(@"----------------------------------------------------------------------------")
    }    
}

- (void)swap:(int *)A i:(int)i B:(int *)B j:(int)j {
//    int temp = A[i];
//    A[i] = A[j];
//    A[j] = temp;
    A[i] ^= B[j];
    B[j] ^= A[i];
    A[i] ^= B[j];
}

- (void)test {
    int arrayA[] = {1,3,5,4};
    int arrayB[] = {1,2,3,7};
    int* ptrA = arrayA;
    int* ptrB = arrayB;
    int res = [self minSwap:ptrA aSize:4 B:ptrB bSize:4];
    DLog(@"res:%d", res);
}

@end
