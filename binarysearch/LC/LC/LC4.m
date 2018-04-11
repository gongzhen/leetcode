//
//  LC4.m
//  LC
//
//  Created by ULS on 3/21/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC4.h"

@interface LC4()

- (double)findMedianSortedArrays:(int *)nums1 len1:(int)len1 nums2:(int *)nums2 len2:(int)len2;
- (double)findMedianSortedArrays_1:(int *)nums1 len1:(int)len1 nums2:(int *)nums2 len2:(int)len2;
- (double)findMedianSortedArrays_2:(int *)nums1 len1:(int)len1 nums2:(int *)nums2 len2:(int)len2;

@end

@implementation LC4

- (double)findMedianSortedArrays_2:(int *)nums1 len1:(int)len1 nums2:(int *)nums2 len2:(int)len2 {
    int len = len1 + len2;
    if(len % 2 == 0) {
        /// 1, 3
        /// 2, 4
        /// 1, 2, 3, 4 count = 4
        /// need to find k = 2 and k = 3 largest numbers and find the median of 2th and 3th.
        /// 2 = len / 2, 3 = len / 2 + 1
        return ([self divide_2:nums1 start1:0 len1:len1 nums2:nums2 start2:0 len2:len2 k:len / 2] + [self divide_2:nums1 start1:0 len1:len1 nums2:nums2 start2:0 len2:len2 k:len / 2 + 1]) / 2;
    }
    /// For odd number of length, k = len / 2 + 1.
    return [self divide_2:nums1 start1:0 len1:len1 nums2:nums2 start2:0 len2:len2 k:len / 2 + 1];
}

- (double)divide_2:(int *)nums1 start1:(int)start1 len1:(int)len1 nums2:(int *)nums2 start2:(int)start2 len2:(int)len2 k:(int)k {
    int i = start1;
    int j = start2;
    int kth = k;
    while(i < len1 && j < len2) {
        if(kth == 1) {
            break;
        }
        NSInteger m1 = i + kth / 2 - 1 < len1 ? nums1[i + kth / 2 - 1] : NSIntegerMax;
        NSInteger m2 = j + kth / 2 - 1 < len2 ? nums2[j + kth / 2 - 1] : NSIntegerMax;
        if(m1 > m2) {
            j = j + kth / 2;
        } else {
            i = i + kth / 2;
        }
        kth = kth - kth / 2;
    }
    
    if(i >= len1) {
        return nums2[j + kth - 1];
    }
    if(j >= len2) {
        return nums1[i + kth - 1];
    }
    return MIN(nums1[i], nums2[j]);
}

- (double)findMedianSortedArrays_1:(int *)nums1 len1:(int)len1 nums2:(int *)nums2 len2:(int)len2 {
    int len = len1 + len2;
    if(len % 2 == 0) {
        /// 1, 3
        /// 2, 4
        /// 1, 2, 3, 4 count = 4
        /// need to find k = 2 and k = 3 largest numbers and find the median of 2th and 3th.
        /// 2 = len / 2, 3 = len / 2 + 1
        return ([self divide_1:nums1 start1:0 len1:len1 nums2:nums2 start2:0 len2:len2 k:len / 2] + [self divide_1:nums1 start1:0 len1:len1 nums2:nums2 start2:0 len2:len2 k:len / 2 + 1]) / 2;
    }
    /// For odd number of length, k = len / 2 + 1.
    return [self divide_1:nums1 start1:0 len1:len1 nums2:nums2 start2:0 len2:len2 k:len / 2 + 1];
}

- (double)divide_1:(int *)nums1 start1:(int)start1 len1:(int)len1 nums2:(int *)nums2 start2:(int)start2 len2:(int)len2 k:(int)k {
    if(start1 >= len1) {
        return nums2[start2 + k - 1];
    }
    if(start2 >= len2) {
        return nums1[start1 + k - 1];
    }
    if(k == 1) {
        return MIN(nums1[start1], nums2[start2]);
    }
    double middle1 = start1 + k / 2 - 1 < len1 ? nums1[start1 + k / 2 - 1] : NSIntegerMax;
    double middle2 = start2 + k / 2 - 1 < len2 ? nums2[start2 + k / 2 - 1] : NSIntegerMax;
    if(middle1 < middle2) {
        return [self divide_1:nums1 start1:start1 + k / 2 len1:len1 nums2:nums2 start2:start2 len2:len2 k:k - k / 2];
    }
    return [self divide_1:nums1 start1:start1 len1:len1 nums2:nums2 start2:start2 + k / 2 len2:len2 k:k - k / 2];
}

/// 1 2 , 3 4
/// [2 + 3] / 2 = 2.5
/// 1 3, 2
/// [2]
- (double)findMedianSortedArrays:(int *)nums1 len1:(int)len1 nums2:(int *)nums2 len2:(int)len2 {
    int len = len1 + len2;
    if(len % 2 == 1) {
        return [self divide:nums1 startA:0 len1:len1 nums2:nums2 startB:0 len2:len2 k:len / 2 + 1];
    }
    return ([self divide:nums1 startA:0 len1:2 nums2:nums2 startB:0 len2:2 k:len / 2] + [self divide:nums1 startA:0 len1:len1 nums2:nums2 startB:0 len2:len2 k:len / 2 + 1]) / 2.0;
}

- (double)divide:(int *)nums1 startA:(int)startA len1:(int)len1 nums2:(int *)nums2 startB:(int)startB len2:(int)len2 k:(int)k {
    int i = startA;
    int j = startB;
    int kth = k;
    DLog(@"i:%d j:%d kth:%d", i, j, k);
    while( i < len1 && j < len2) {
        if(kth == 1) {
            break;
        }
        
        NSInteger halfA = i + kth / 2 - 1 < len1 ? nums1[i + kth / 2 - 1] : NSIntegerMax;
        NSInteger halfB = j + kth / 2 - 1 < len2 ? nums2[j + kth / 2 - 1] : NSIntegerMax;
        DLog(@"halfA:%ld halfB:%ld", halfA, halfB);
        if(halfA < halfB) {
            i = i + kth / 2;
            DLog(@"i:%d", i);
        } else {
            j = j + kth / 2;
            DLog(@"j:%d", j);
        }
        kth = kth - kth / 2;
        DLog(@"kth:%d", kth);
    }
    
    if(i >= len1) {
        DLog(@"i:%d", i);
        DLog(@"nums2[j + kth - 1]:%d", nums2[j + kth - 1]);
        return nums2[j + kth - 1];
    }
    if(j >= len2) {
        DLog(@"j:%d", j);
        DLog(@"nums1[i + kth - 1]:%d", nums1[i + kth - 1]);
        return nums1[i + kth - 1];
    }
    DLog(@"nums1[i]:%d <> nums2[j]:%d", nums1[i], nums2[j]);
    return MIN(nums1[i], nums2[j]);
}

- (void)test {
//    int n1[2] = {1, 2};
//    int* num1 = n1;
//    int n2[4] = {3, 4, 5, 6};
//    int* num2 = n2;
//    double res = [self findMedianSortedArrays:num1 len1:2 nums2:num2 len2:4];
//    DLog(@"res:%.2f", res);
//    int n1[0] = {};
//    int* num1 = n1;
//    int n2[1] = {1};
//    int* num2 = n2;
//    double res = [self findMedianSortedArrays_1:num1 len1:0 nums2:num2 len2:1];
//    DLog(@"res:%.2f", res);
    int n1[2] = {1, 2};
    int* num1 = n1;
    int n2[4] = {3, 4};
    int* num2 = n2;
    double res = [self findMedianSortedArrays_2:num1 len1:2 nums2:num2 len2:2];
    DLog(@"res:%.2f", res);
}

@end
