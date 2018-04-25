//
//  LC91.m
//  LC
//
//  Created by ULS on 2/27/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC91.h"

@interface LC91()

- (int)numDecodings:(NSString *)s;

@end

@implementation LC91

/**
 91. Decode Ways
 A message containing letters from A-Z is being encoded to numbers using the following mapping:
 
 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 Given an encoded message containing digits, determine the total number of ways to decode it.
 
 For example,
 Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).
 
 The number of ways decoding "12" is 2.
 */
- (int)numDecodings:(NSString *)s {
    NSLog(@"s:%@", s);
    if(s == nil || s.length == 0) {
        return 0;
    }
    
    int* dp = (int *)calloc(s.length + 1, sizeof(int));
    dp[0] = 1;
    dp[1] = [s characterAtIndex:0] == '0' ? 0 : 1;
    
    for(int i = 2; i <= s.length; i++) {
        int first = [[s substringWithRange:NSMakeRange(i - 1, 1)] intValue];
        int second = [[s substringWithRange:NSMakeRange(i - 2, 2)] intValue];
        if(first >= 1 && first <= 9) {
            DLog(@"[s substringWithRange:NSMakeRange(i - 1, 1)]:%@ first:%d",[s substringWithRange:NSMakeRange(i - 1, 1)], first);
            DLog(@"dp[%d]:%d += dp[%d]:%d",i, dp[i], i - 1, dp[i - 1]);
            dp[i] += dp[i - 1];
            DLog(@"dp[%d]:%d", i, dp[i]);
        }
        if(second >= 10 && second <= 26) {
            DLog(@"[s substringWithRange:NSMakeRange(i - 2, 1)]:%@ second:%d",[s substringWithRange:NSMakeRange(i - 2, 1)], second);
            DLog(@"dp[%d]:%d += dp[%d]:%d", i ,dp[i], i - 2, dp[i - 2]);
            dp[i] += dp[i - 2];
            DLog(@"dp[%d]:%d", i, dp[i]);
        }
    }
    return dp[s.length];
}

- (void)test {
    NSString *s = @"123";
    DLog(@"res:%d", [self numDecodings:s]);
}

@end
