//
//  LC88.m
//  LC
//
//  Created by ULS on 2/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC88.h"

@interface LC88()

- (void)merge:(int*)nums1 m:(int)m nums2:(int*)nums2 n:(int)n;

@end

@implementation LC88

- (void)merge:(int*) nums1 m:(int)m nums2:(int*)nums2 n:(int)n {
    if(nums1 == nil || nums2 == nil || m == 0) {
        return;
    }
    
    while(m > 0 && n > 0) {
        if(nums1[m - 1] >= nums2[n - 1]) {
            nums1[m + n - 1] = nums1[m - 1];
            m--;
        } else {
            nums1[m + n - 1] = nums2[n - 1];
            n--;
        }
    }

    while(n > 0) {
        nums1[m + n - 1] = nums1[n];
        n--;
    }
}

- (void)test {
    int nums1[8] = {1, 3, 5, 0, 0, 0};
    int nums2[3] = {2, 4, 6};
    [self merge:nums1 m:3 nums2:nums2 n:3];
}

@end
