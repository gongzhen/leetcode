//
//  LC26.m
//  LC
//
//  Created by Zhen Gong on 8/21/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "LC26.h"
#import "NSArray+PrintUtility.h"

@implementation LC26

-(int)removeDuplicates:(NSMutableArray*)nums;
{
    int i = 0;
    int j = i + 1;
    while (j < nums.count) {
        if (nums[i] != nums[j]) {
            i++;
            [nums replaceObjectAtIndex:i withObject:nums[j]];
        }
        j++;
    }
    [nums printArrayFromStartIndex:0 endIndex:i];
    return (i - 0 + 1);
}

- (void)test {
    int nums1[4] = {1, 1, 2, 3};
    NSMutableArray *array1 = [[ArraysUtility generateArray:nums1 size:4] mutableCopy];
    NSInteger result = [self removeDuplicates:array1];
    [PrintHelper printInteger:result];
    int nums2[10] = {0,0,1,1,1,2,2,3,3,4};
    NSMutableArray *array2 = [[ArraysUtility generateArray:nums2 size:10] mutableCopy];
    NSInteger result1 = [self removeDuplicates:array2];
    [PrintHelper printInteger:result1];
}

@end
