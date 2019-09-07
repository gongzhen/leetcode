//
//  LC4.m
//  LC
//
//  Created by Zhen Gong on 8/21/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "LC4.h"


@interface LC4()

- (double)findMedianSortedArrays:(NSArray *)nums1 num2:(NSArray *)nums2;

@end

@implementation LC4

- (double)findMedianSortedArrays:(NSArray *)nums1 num2:(NSArray *)nums2
{
    int len1 = (int)nums1.count;
    int len2 = (int)nums2.count;
    int i = 0;
    int j = 0;
    NSMutableArray *result = [NSMutableArray array];
    while(i < len1 && j < len2) {
        int n1 = [nums1[i] intValue];
        int n2 = [nums2[j] intValue];
        if (n1 < n2) {
            [result addObject:[NSNumber numberWithInt:n1]];
            i++;
        } else if (n1 > n2) {
            [result addObject:[NSNumber numberWithInt:n2]];
            j++;
        } else if (n1 == n2) {
            [result addObject:[NSNumber numberWithInt:n1]];
            [result addObject:[NSNumber numberWithInt:n2]];
            i++;
            j++;
        }
    }
    
    if (i < len1) {
        while(i < len1) {
            [result addObject:nums1[i]];
            i++;
        }
    } else if (j < len2) {
        while(j < len2) {
            [result addObject:nums2[j]];
            j++;
        }
    }
    int len = len2 + len1;
    if (len % 2 == 0) {
        int first = len / 2 - 1;
        int second = len / 2;
        int sum = [result[first] intValue] + [result[second] intValue];
        return (double)(sum / 2.0);
    } else {
        int median = len / 2;
        return [result[median] doubleValue];
    }
}

- (void)test {
    int nums1[6] = {2, 7, 11, 15, 8, 99};
    int nums2[6] = {2, 7, 11, 15, 8, 99};
    NSArray *array1 = [ArraysUtility generateArray:nums1 size:6];
    NSArray *array2 = [ArraysUtility generateArray:nums2 size:6];
    double result = [self findMedianSortedArrays:array1 num2:array2];
    [PrintHelper printDouble:result];
    
    int nums3[2] = {1, 3};
    int nums4[1] = {2};
    NSArray *array3 = [ArraysUtility generateArray:nums3 size:2];
    NSArray *array4 = [ArraysUtility generateArray:nums4 size:1];
    double result2 = [self findMedianSortedArrays:array3 num2:array4];
    [PrintHelper printDouble:result2];
    
    int nums5[2] = {1, 2};
    int nums6[2] = {3, 4};
    NSArray *array5 = [ArraysUtility generateArray:nums5 size:2];
    NSArray *array6 = [ArraysUtility generateArray:nums6 size:2];
    double result3 = [self findMedianSortedArrays:array5 num2:array6];
    [PrintHelper printDouble:result3];
}

@end
