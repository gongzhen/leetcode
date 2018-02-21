//
//  LC494.m
//  LC
//
//  Created by ULS on 2/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC494.h"

@interface LC494()

- (int)findTargetSumWays:(int *)nums size:(int)size s:(int)s;

@end

@implementation LC494

- (int)findTargetSumWays:(int *)nums size:(int)size s:(int)s {
    return [self dfs:nums size:size sum:0 idx:0 s:s str:[NSString string]];
}

- (int)dfs:(int *)nums size:(int)size sum:(int)sum idx:(int)idx s:(int)s str:(NSString *)str{
    if(idx == size) {
        if(sum == s) {
            return 1;
        } else {
            return 0;
        }
    }
    NSString *posStr = [NSMutableString stringWithFormat:@"%@+%d", str, nums[idx]];
    NSString *negStr = [NSMutableString stringWithFormat:@"%@-%d", str, nums[idx]];
    int positive = [self dfs:nums size:size sum:sum + nums[idx] idx:idx + 1 s:s str:posStr];
    int negative = [self dfs:nums size:size sum:sum - nums[idx] idx:idx + 1 s:s str:negStr];
    DLog(@"positive:%d sum:%d idx:%d posStr:%@", positive, sum, idx, posStr);
    DLog(@"negative:%d sum:%d idx:%d negStr:%@", negative, sum, idx, negStr);
    return positive + negative;
}

- (void)test {
    int nums[5] = {1, 1, 1, 1, 1};
    DLog(@"res:%d", [self findTargetSumWays:nums size:5 s:3]);
    
}

@end
