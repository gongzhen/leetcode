//
//  LC128.m
//  LC
//
//  Created by Admin  on 4/21/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC128.h"
#import "QuickSort.h"

@implementation LC128

- (int)longestConsecutive_1:(int* )nums size:(int)size {
    if(size == 0) {
        return 0;
    }
    
    NSMutableSet *set = [NSMutableSet set];
    for(int i = 0; i < size; i++) {
        [set addObject:@(nums[i])];
    }
    
    int max = 1;
    int count = 1;
    for(NSNumber* n in set) {
        /// Find the smallest number.
        NSInteger num = [n integerValue];
        if([set containsObject:@(num - 1)] == NO) {
            while([set containsObject:@((num + 1))] == YES) {
                count += 1;
                num++;
            }
            max = MAX(max, count);
            count = 1;
        }
    }
    return max;
}

- (int)longestConsecutive:(int* )nums size:(int)size {
    if(size == 0) {
        return 0;
    }
    
    [self quickSort:nums left:0 right:size - 1];
    /// [QuickSort quickSortInt:nums size:size];
    
    
    for(int i = 0; i < size; i++) {
        printf("%d, ", nums[i]);
    }
    
    int count = 1;
    NSInteger max = NSIntegerMin;
    int i = 1;
    int prev = nums[0];
    while(i < size) {
        while(i < size && (prev + 1 == nums[i] || prev == nums[i])) {
            if(prev != nums[i]) {
                count += 1;
            }
            prev = nums[i];
            i++;
        }
        max = MAX(max, count);
        if(i == size) {
            break;
        }
        prev = nums[i];
        count = 1;
        i++;
    }
    
    return (int)max;
}

- (void)quickSort:(int *)nums left:(int)left right:(int)right {
    if(left >= right) {
        return;
    }
    
    int i = left;
    int j = right;
    int pivot = nums[i + (j - i) / 2];
    while(i <= j) {
        while(i <= j && nums[i] < pivot) {
            i++;
        }
        while(i <= j && nums[j] > pivot) {
            j--;
        }
        if(i <= j) {
            [self swap:nums i:i j:j];
            i++;
            j--;
        }
    }

    if(left < j) {
        [self quickSort:nums left:left right:j];
    }
    if(i < right) {
        [self quickSort:nums left:i right:right];
    }
}

- (void)swap:(int *)nums i:(int)i j:(int)j {
    int temp = nums[i];
    nums[i] = nums[j];
    nums[j] = temp;
}

- (void)test {
//    int num1[6] = {100, 4, 200, 1, 3, 2};
//    int *ptr = num1;
//    int res = [self longestConsecutive:ptr size:6];
//    DLog(@"res:%d", res);
    
    int num1[9] = {1, 2, 0, 1, 4, 5, 6, 7, 8};
    int *ptr = num1;
    int res = [self longestConsecutive_1:ptr size:10];
    DLog(@"res:%d", res);
}

@end
