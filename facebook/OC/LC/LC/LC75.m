//
//  LC75.m
//  LC
//
//  Created by ULS on 2/19/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC75.h"

@interface LC75()

- (void)sortColors:(int *)nums size:(int)size;
- (void)sortColorsGZ:(int *)nums size:(int)size;

@end

@implementation LC75

- (void)sortColors:(int *)nums size:(int)size {
    if(size == 0) {
        return;
    }
    
    int zero = 0;
    int second = size - 1;
    /// 1, 2, 0, 1, 2, 0
    for(int i = 0; i < size; i++) {
        while(nums[i] == 0 && i > zero) { /// check current num[i] == 0 ? then swap(nums, zero, i), zero++
            int temp = nums[i];
            nums[i] = nums[zero];
            nums[zero] = temp;
            zero++;
        }
//        for(int i = 0; i < size; i++) {
//            DLog(@"%d", nums[i]);
//        }
//        DLog(@"++++++++++++++++++++++++++");
        while(nums[i] == 2 && i < second) { /// check current num[i] == 2 ? then swap(nums, second, i), second--
            int temp = nums[i];
            nums[i] = nums[second];
            nums[second] = temp;
            second--;
        }
//        for(int i = 0; i < size; i++) {
//            DLog(@"%d", nums[i]);
//        }
//        DLog(@"------------------------");
    }
}

- (void)sortColorsGZ:(int *)nums size:(int)size {
    if(size == 0) {
        return;
    }
    
    int* count = calloc(3, sizeof(int *));
    for(int i = 0; i < size; i++) {
        count[nums[i]]++;
    }
    
    int i = 0;
    for(; i < count[0]; i++) {
        nums[i] = 0;
    }
    
    for(; i < count[0] + count[1]; i++) {
        nums[i] = 1;
    }
    
    for(; i < size; i++) {
        nums[i] = 2;
    }
    
    for(int i = 0; i < size; i++) {
        DLog(@"%d", nums[i]);
    }
}

- (void)test {
    int nums[6] = {1, 2, 0, 1, 2, 0};
    [self sortColors:nums size:6];
}

@end
