//
//  LC15.m
//  LC
//
//  Created by ULS on 2/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC15.h"

@interface LC15()

- (NSArray *)threeSum:(int[])nums len:(int)len;

@end

@implementation LC15

- (NSArray *)threeSum:(int[])nums len:(int)len {
    [self quickSort:nums low:0 high:len - 1];
    /// -4, -1, -1, 0, 1, 2
    NSMutableArray *res = [NSMutableArray array];
    
    for(int i = 0; i < len; i++) {
        if(i > 0 && nums[i] == nums[i-1]) {
            continue;
        }
        int target = 0 - nums[i];
        [self twoSum:nums len:len target:target start:i + 1 end:len - 1 res:res];
    }
    for(NSArray *list in res) {
        for(NSNumber *num in list) {
            DLog(@"%ld", [num integerValue]);
        }
        DLog(@"---------------------------------------")
    }
    return [res copy];
}

- (void)twoSum:(int [])nums len:(int)len target:(int)target start:(int)start end:(int)end res:(NSMutableArray *)res {
    int i = start;
    int j = end;
    while(i < j) {
        if(nums[i] + nums[j] == target) {
            NSArray *list = @[@(-target), @(nums[i]), @(nums[j])];
            [res addObject:list];
            i++;
            j--;
            /// make sure check i and j inside the block.
            while(i < j && nums[i] == nums[i-1]) {
                i++;
            }
            
            while(i < j && nums[j] == nums[j-1]) {
                j--;
            }
        } else if (nums[i] + nums[j] > target) {
            j--;
        } else if (nums[i] + nums[j] < target) {
            i++;
        }
    }
}

- (void)quickSort:(int [])nums low:(int)low high:(int)high {
    int i = low;
    int j = high;
    int pivot = nums[i + (j - i) / 2];
    while(i <= j) {
        while(nums[i] < pivot) {
            i++;
        }
        while(nums[j] > pivot) {
            j--;
        }
        if(i <= j) {
            [self swap:nums i:i j:j];
            i++;
            j--;
        }
    }
//    DLog(@"i:%d, low:%d", i, low);
//    DLog(@"j:%d, high:%d", j, high);
//    for(int i = low; i <= high; i++) {
//        DLog(@"%d", nums[i]);
//    }
    if(low < j) {
        [self quickSort:nums low:low high:j];
    }
    if(i < high) {
        [self quickSort:nums low:i high:high];
    }
    
}

- (void)swap:(int [])nums i:(int)i j:(int)j {
    int temp = nums[i];
    nums[i] = nums[j];
    nums[j] = temp;
}

- (void)test {
    int nums[6] = {-1, 0, 1, 2, -1, -4};
    size_t len = sizeof(nums) / sizeof(nums[0]);
    [self threeSum:nums len:(int)len];
}

@end
