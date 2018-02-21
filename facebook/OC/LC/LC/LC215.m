//
//  LC215.m
//  LC
//
//  Created by ULS on 2/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC215.h"

@interface LC215()

- (int)findKthLargest:(int *)nums size:(int)size k:(int)k;

@end

@implementation LC215

- (int)findKthLargest:(int *)nums size:(int)size k:(int)k {
    if(size == 0) {
        return -1;
    }
    [self shuffle:nums size:size];
    k = size - k;
    int i = 0;
    int j = size - 1;
    while(i <= j) {
        int index = [self partition:nums start:i end:j];
//        DLog(@"index:%d => nums[%d]", index, nums[index]);
        if(index == k) {
            return nums[index];
        } else if (index < k) {
            i = index + 1;
        } else {
            j = index - 1;
        }
//        DLog(@"i:%d /// j:%d", i, j);
    }
    return -1;
}

- (int)partition:(int *)nums start:(int)start end:(int)end {
    int i = start;
    int j = end;
    int pivot = nums[start];
    /// DLog(@"pivot:%d", pivot);
    while(i < j) {
        while(i < end && nums[i] <= pivot) {
            i++;
        }
        while(start < j && nums[j] >= pivot) {
            j--;
        }
//        DLog(@"i:%d j:%d", i, j);
        if(i >= j) {
            break;
        }
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
    int temp = nums[start];
    nums[start] = nums[j];
    nums[j] = temp;
//    for(int i = start; i <= end; i++) {
//        DLog(@"%d", nums[i]);
//    }
    return j;
}
- (void)shuffle:(int *)nums size:(int)size {
    for(int i = 1; i < size; i++) {
        int r = arc4random_uniform(i + 1);
        int temp = nums[i];
        nums[i] = nums[r];
        nums[r] = temp;
    }
}

- (void)test {
//    int nums[2] = {2, 1};
//    DLog(@"res:%d", [self findKthLargest:nums size:2 k:2]);
//    int nums[1] = {1};
//    DLog(@"res:%d", [self findKthLargest:nums size:1 k:1]);
    // int nums[6] = {6,5,3,2,1,4};
    int nums[6] = {4, 5, 3, 2, 1, 6};
    DLog(@"res:%d", [self findKthLargest:nums size:6 k:6]);
    DLog(@"res:%d", [self findKthLargest:nums size:6 k:5]);
    DLog(@"res:%d", [self findKthLargest:nums size:6 k:4]);
    DLog(@"res:%d", [self findKthLargest:nums size:6 k:3]);
    DLog(@"res:%d", [self findKthLargest:nums size:6 k:2]);
    DLog(@"res:%d", [self findKthLargest:nums size:6 k:1]);
    DLog(@"res:%d", [self findKthLargest:nums size:6 k:0]);
}

@end
