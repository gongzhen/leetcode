//
//  LC689.m
//  LC
//
//  Created by ULS on 3/4/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC689.h"
#import "QuickSort.h"

@interface LC689()

@end

@implementation LC689

- (NSArray *)maxSumOfThreeSubarrays_2:(int *)nums size:(int)size k:(int)k {
    for(int i = 0; i < size; i++) {
        printf("[%d]%d, ", i, nums[i]);
    }
    printf("\n");
    DLog(@"\nnums --------------------------------------------------------------------------");
    
    NSMutableArray *res = [NSMutableArray array];
    int* sum = (int *)calloc(size + 1, sizeof(int));
    [QuickSort printIntArray:sum size:size + 1];
    int* posLeft = (int *)calloc(size, sizeof(int));
    [QuickSort printIntArray:posLeft size:size];
    int* posRight = (int *)calloc(size, sizeof(int));
    [QuickSort printIntArray:posRight size:size];
    int* ans = (int *)calloc(3, sizeof(int));
    [QuickSort printIntArray:ans size:3];
    int maxSum = 0;
    for(int i = k, total = sum[k] - sum[0]; i < size; i++) {
        if(sum[i + 1] - sum[i + 1 - k] > total) {
            posLeft[i] = i + 1 - k;
            total = sum[i + 1] - sum[i + 1 - k];
        } else {
            posLeft[i] = posLeft[i - 1];
        }
    }
    
    posRight[size - k] = size - k;
    for(int i = size - k - 1, total = sum[size] - sum[size - k]; i >= 0; i--) {
        if(sum[i + k] - sum[i] >= total) {
            posRight[i] = i;
            total = sum[i + k] - sum[i];
        } else {
            posRight[i] = posRight[i + 1];
        }
    }
    
    for(int i = k; i <= size - 2 * k; i++) {
        int left = posLeft[i - 1];
        int right = posRight[i + k];
        int total = (sum[i + k] - sum[i]) + (sum[left + k] - sum[left]) + (sum[right + k] - sum[right]);
        if(total > maxSum) {
            maxSum = total;
            ans[0] = left;
            ans[1] = i;
            ans[2] = right;
        }
    }
    
    for(int i = 0; i < 3; i++) {
        [res addObject:@(ans[i])];
    }
    
    free(sum);
    free(posLeft);
    free(posRight);
    free(ans);
    return res;
}

- (NSArray *)maxSumOfThreeSubarrays:(int *)nums size:(int)size k:(int)k {
    for(int i = 0; i < size; i++) {
        printf("[%d]%d, ", i, nums[i]);
    }
    printf("\n");
    DLog(@"\nnums --------------------------------------------------------------------------");

    NSMutableArray *res = [NSMutableArray array];
    int wLength = size - k + 1;
    int* w = (int *)calloc(wLength, sizeof(int));
    int sum = 0;
    /// step1: w is sum array contains the sum of k size of array.
    for(int i = 0; i < size; i++) {
        sum += nums[i];
        //// i > k, then remove the num in i - k from sum.
        //// sum is always the sume of k size of array.
        if(i >= k) {
            sum -= nums[i - k];
        }
        /// w start from 0, 1, 2 ... size - K + 1
        if(i >=  k - 1) {
            w[i - k + 1] = sum; /// i == k - 1, then i - k + 1 = 0, 1, 2, 3, 4, 5....
        }
    }
    for(int i = 0; i < wLength; i++) {
        printf("[%d]%d, ", i, w[i]);
    }
    printf("\n");
    DLog(@"\nw --------------------------------------------------------------------------");
    DLog(@"\nleft  start--------------------------------------------------------------------------");
    // step2: maintain the array of index of MAX value from left to right.
    /// It is saving INDEX not VALUE.
    int *left = (int *)calloc(wLength, sizeof(int));
    int best = 0;
    for(int i = 0; i < wLength; i++) {
        if(w[i] > w[best]) {
            best = i;
        }
        left[i] = best;
    }
    for(int i = 0; i < wLength; i++) {
        printf("[%d]%d, ", i, left[i]);
    }
    DLog(@"\nleft  end--------------------------------------------------------------------------");
    DLog(@"\nright start--------------------------------------------------------------------------");
    /// step3: maintain the array of MAX value from right to lef.t
    int *right = (int *)calloc(wLength, sizeof(int));
    best = size - k;
    for(int i = size - k; i >= 0; i--) {
        if(w[i] >= w[best]) {
            best = i;
        }
        right[i] = best;
    }
    
    for(int i = 0; i < wLength; i++) {
        printf("[%d]%d, ", i, right[i]);
    }
    DLog(@"\nright end--------------------------------------------------------------------------");
    
    int result[3] = {-1, -1, -1};
    //// i -k .... i .... i + k
    for(int i = k; i < wLength - k; i++) {
        /// left:Left to Right Most Value's Index
        /// right: Right to left most Value's Index.
        int firstIdx = left[i - k], lastIdx = right[i + k];
        printf("firstIdx:[%d] lastIdx:[%d]\n", firstIdx, lastIdx);
        if(result[0] == -1 || w[firstIdx] + w[i] + w[lastIdx] > w[result[0]] + w[result[1]] + w[result[2]]) {
            result[0] = firstIdx;
            result[1] = i;
            result[2] = lastIdx;
        }
    }
    
    for(int i = 0; i < 3; i++) {
        [res addObject:@(result[i])];
    }
    return res;
}

- (NSArray *)maxSumOfThreeSubarraysGZ:(int *)nums size:(int)size k:(int)k {
    NSInteger max = NSIntegerMin;
    NSMutableArray* res = [NSMutableArray array];
    NSMutableArray* result1 = [NSMutableArray array];
    NSMutableArray* result2 = [NSMutableArray array];
    NSMutableArray* result3 = [NSMutableArray array];
    for(int i = 0; i < size - k; i++) {
        int max1 = 0;
        int j = i;
        for(; j < i + k; j++) {
            max1 += nums[j];
        }
        int max2 = 0;
        int l = i + k;
        for(; l < i + 2 * k; l++) {
            max2 += nums[l];
        }
        int max3 = 0;
        int h = i + 2 * k;
        for(; h < i + 3 * k; h++) {
            max3 +=nums[h];
        }
        if(max < max1 + max2 + max3) {
            max = max1 + max2 + max3;
            [result1 removeAllObjects];
            [result2 removeAllObjects];
            [result3 removeAllObjects];
            [res removeAllObjects];
            [res addObject:@(j)];
            [res addObject:@(l)];
            [res addObject:@(h)];
            for(int t = i; t < i + k; t++) {
                [result1 addObject:@(nums[t])];
            }
            for(int t = i + k; t < i + 2 * k; t++) {
                [result2 addObject:@(nums[t])];
            }
            for(int t = i + 2 * k; i + 3 * k; t++) {
                [result3 addObject:@(nums[t])];
            }
        }
    }
    return res;
}

- (void)test {
    int array[8] = {1,2,1,2,6,7,5,1};
    int* nums = array;
    NSArray* res = [self maxSumOfThreeSubarrays_2:nums size:8 k:2];
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"%d", ((NSNumber *)obj).intValue);
    }];
}

@end
