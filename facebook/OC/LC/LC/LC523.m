//
//  LC523.m
//  LC
//
//  Created by Admin  on 2/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC523.h"

@interface LC523()

- (BOOL)checkSubarraySum:(int *)nums size:(int)size k:(int)k;
- (BOOL)checkSubarraySumBrutalForce:(int *)nums size:(int)size k:(int)k;

@end

@implementation LC523

- (BOOL)checkSubarraySumBrutalForce:(int *)nums size:(int)size k:(int)k {
    if(size == 0) {
        return false;
    }
    
    for(int i = 0; i < size; i++) {
        int sum = nums[i];
        for(int j = i + 1; j < size; j++) {
            sum += nums[i];
            if(k != 0 && sum % k == 0) {
                return true;
            }
        }
        sum = 0;
    }
    return false;
}

- (BOOL)checkSubarraySum:(int *)nums size:(int)size k:(int)k {
    if(size == 0) {
        return false;
    }
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    int sum = 0;
    for(int i = 0; i < size; i++) {
        sum += nums[i];
        DLog(@"sum:%d", sum);
        if(k != 0) {
            sum = sum % k;
            DLog(@"sum model k:%d", sum);
        }
        id obj = [map objectForKey:@(sum)];
        if(obj != NULL) {
            int index = [obj intValue];
            DLog(@"i:%d  index:%d", i, index);
            if(i - index > 1) {
                return true;
            }
        } else {
            [map setObject:@(i) forKey:@(sum)];
        }
    }
    return false;
}

- (void)test {
    int nums[] = {23, 2, 4, 6, 7};
    DLog(@"res:%d", [self checkSubarraySum:nums size:5 k:6]);
    DLog(@"res:%d", [self checkSubarraySumBrutalForce:nums size:5 k:6]);
}

@end
