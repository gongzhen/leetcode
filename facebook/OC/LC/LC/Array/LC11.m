//
//  LC11.m
//  LC
//
//  Created by Zhen Gong on 8/21/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "LC11.h"

@implementation LC11

- (NSInteger)maxArea:(NSArray *)height
{
    int max = 0;
    int i = 0;
    int j = (int)height.count - 1;
    while(j > i) {
        int bottom = j - i;
        int left = [[height objectAtIndex:i] intValue];
        int right = [[height objectAtIndex:j] intValue];
        int h = MIN(left, right);
        if (max < bottom * h) {
            max = bottom * h;
        }
        if (left > right) {
            j--;
        } else {
            i++;
        }
    }
    return max;
}

- (void)test {
    int nums1[9] = {1,8,6,2,5,4,8,3,7};
    NSArray *array1 = [ArraysUtility generateArray:nums1 size:9];
    NSInteger result = [self maxArea:array1];
    [PrintHelper printInteger:result];
    
}
@end
