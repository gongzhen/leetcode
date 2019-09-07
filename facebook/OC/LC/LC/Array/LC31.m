//
//  LC31.m
//  LC
//
//  Created by Zhen Gong on 8/21/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "LC31.h"

@implementation LC31

- (void)nextPermutation:(NSMutableArray *)nums
{
    int m = -1;
    int n = -1;
    for(int i = (int)nums.count - 2; i>=0; i--) {
        if ([nums[i] intValue] < [nums[i+1] intValue]) {
            m = i;
            break;
        }
    }
    
    if (m >= 0) {
        for (int i = (int)nums.count - 1; i>m; i--) {
            if ([nums[m] intValue] < [nums[i] intValue]) {
                n = i;
                break;
            }
        }
        [nums swapFromIndex:m toIndex:n];
        [nums reverseFromIndex:m + 1 toIndex:(int)nums.count - 1];
    } else {
        [nums reverseFromIndex:0 toIndex:(int)nums-1];
    }
    [nums printArrayFromStartIndex:0 endIndex:(int)nums.count-1];
}

- (void)test {
    int nums1[3] = {1, 3, 2};
    NSMutableArray *array1 = [[ArraysUtility generateArray:nums1 size:3] mutableCopy];
    [self nextPermutation:array1];
}
@end
