//
//  LC16.m
//  LC
//
//  Created by Admin  on 3/27/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC16.h"
#import "QuickSort.h"

@interface LC16() {
    int _minDiff;
}

- (int )threeSumClosest:(int* )nums numsSize:(int)numsSize target:(int)target;

@end

@implementation LC16

- (int )threeSumClosest:(int* )nums numsSize:(int)numsSize target:(int)target {
    _minDiff = INT_MAX;
    [QuickSort quickSortInt:nums size:numsSize];
    [QuickSort printIntArray:nums size:numsSize];
    for(int i = 0; i < numsSize; i++) {
        if(i > 0 && nums[i] == nums[i - 1]) {
            continue;
        }
        int find = target - nums[i];
        [self twoSum:nums numsSize:numsSize i:i + 1 j:numsSize - 1 target:find];
    }
    return target + _minDiff;
}

- (void)twoSum:(int *)nums numsSize:(int)numsSize i:(int)i j:(int)j target:(int)target{
    while(i < j) {
        int diff = nums[i] + nums[j] - target;
        DLog(@"nums[i]:%d, nums[j]:%d,  _minDiff:%d diff:%d target:%d", nums[i], nums[j], _minDiff, diff, target);
        if(ABS(_minDiff) > ABS(diff)) {
            _minDiff = diff;
        }
        DLog(@"_minDiff:%d diff:%d", _minDiff, diff);
        if(diff == 0) {
            break;
        } else if (diff < 0) {
            i++;
        } else {
            j--;
        }
    }
}

- (void)test {
    int number[4] = {-1, 2, 1, -4};
    int len = sizeof(number) / sizeof(number[0]);
    int* nums = number;
    int res = [self threeSumClosest:nums numsSize:len target:1];
    DLog(@"res:%d", res);
}
@end
