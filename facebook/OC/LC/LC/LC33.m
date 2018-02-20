//
//  LC33.m
//  LC
//
//  Created by ULS on 2/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC33.h"

@interface LC33()

- (int)search:(int *)nums size:(int)size target:(int)target;

@end

@implementation LC33

- (int)search:(int *)nums size:(int)size target:(int)target {
    int i = 0;
    int j = size - 1;
    /// 4 5 6 7 0 1 2
    while ( i <= j) {
        int mid = i + (j - i) / 2;
        if(nums[mid] == target) {
            return mid;
        } else if (nums[mid] >= nums[i]){ /// nums[mid] >= nums[i] NOT nums[mid] > nums[i]
            if(nums[i] <= target && target < nums[mid]) {
                j = mid - 1;
            } else {
                i = mid + 1;
            }
        } else if (nums[mid] < nums[i]){ /// only < not <=
            if(nums[mid] < target && target <= nums[j]) {
                i = mid + 1;
            } else {
                j = mid - 1;
            }
        }
    }
    return -1;
}

- (void)test {
    
//    int num[7] = {4, 5, 6, 7, 0, 1, 2};
//    DLog(@"res:%d", [self search:num size:7 target:0]);
//    DLog(@"res:%d", [self search:num size:7 target:1]);
//    DLog(@"res:%d", [self search:num size:7 target:2]);
//    DLog(@"res:%d", [self search:num size:7 target:3]);
//    DLog(@"res:%d", [self search:num size:7 target:4]);
//    DLog(@"res:%d", [self search:num size:7 target:5]);
//    DLog(@"res:%d", [self search:num size:7 target:6]);
//    DLog(@"res:%d", [self search:num size:7 target:7]);
    int num[2] = {3, 1};
    DLog(@"res:%d", [self search:num size:2 target:1]);
}

@end
