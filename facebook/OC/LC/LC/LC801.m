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

- (int)minSwap_1:(int*)A aSize:(int)ASize B:(int*)B  bSize:(int)BSize {
    if(ASize == 0 || BSize == 0) {
        return 0;
    }
    int* dp1 = (int *)malloc(ASize * sizeof(int));
    for(int i = 0; i < ASize; i++) {
        dp1[i] = 10000;
    }
    int* dp2 = (int *)malloc(BSize * sizeof(int));
    for(int i = 0; i < ASize; i++) {
        dp2[i] = 10000;
    }
    dp1[0] = 0;
    dp2[0] = 1;
    [QuickSort printIntArray:dp1 size:ASize];
    [QuickSort printIntArray:dp2 size:ASize];
    for(int i = 1; i < ASize; i++) {
        if(A[i] > A[i-1] && B[i] > B[i-1]) {
            dp1[i] = dp1[i - 1];
            dp2[i] = dp2[i - 1] + 1;
        }
        if(B[i] > A[i-1] && A[i] > B[i-1]) {
            dp1[i] = MIN(dp1[i], dp2[i - 1]);
            dp2[i] = MIN(dp2[i], dp1[i - 1] + 1);
        }
    }
    [QuickSort printIntArray:dp1 size:ASize];
    [QuickSort printIntArray:dp2 size:ASize];
    return MIN(dp1[ASize - 1], dp2[ASize - 1]);
}

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
//    int arrayA[] = {1,3,5,4};
//    int arrayB[] = {1,2,3,7};
//    int* ptrA = arrayA;
//    int* ptrB = arrayB;
//    int res = [self minSwap:ptrA aSize:4 B:ptrB bSize:4];
//    DLog(@"res:%d", res);
    
    int arrayA[] = {1,3};
    int arrayB[] = {1,2};
    int* ptrA = arrayA;
    int* ptrB = arrayB;
    int res = [self minSwap_1:ptrA aSize:2 B:ptrB bSize:2];
    DLog(@"res:%d", res);
}

@end
