//
//  LC1.m
//  LC
//
//  Created by ULS on 2/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC1.h"

@interface LC1()

- (int *)twoSum:(int *)nums numsSize:(int)numsSize target:(int)target;

@end

@implementation LC1

- (int *)twoSum:(int *)nums numsSize:(int)numsSize target:(int)target {
    if(numsSize == 0) {
        return NULL;
    }
    static int res[2];
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    for(int i = 0; i < numsSize; i++) {
        if([map objectForKey:@(target - nums[i])]) {
            res[0] = nums[i];
            int idx = [[map objectForKey:@(target - nums[i])] intValue];
            res[1] = nums[idx];
            return res;
        } else {
            [map setObject:@(i) forKey:@(nums[i])];
        }
    }
    return NULL;
}

- (void)test {
    int nums[6] = {2, 7, 11, 15, 8, 99};
    int *res = [self twoSum:nums numsSize:6 target:107];
    for(int i = 0; i < 2; i++) {
        DLog(@"%d", *(res + i));
    }
    
}

@end
