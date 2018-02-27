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

- (int)numDecodings:(NSString *)s {
    
    if(s == nil || s.length == 0) {
        return 0;
    }
    
    int* dp = (int *)calloc(s.length + 1, sizeof(int));
    dp[0] = 1;
    dp[1] = [s characterAtIndex:0] == '0' ? 0 : 1;
    
    for(int i = 2; i <= s.length; i++) {
        int first = [[s substringWithRange:NSMakeRange(i - 1, 1)] intValue];
        DLog(@"[s substringWithRange:NSMakeRange(i - 1, 1)]:%@ first:%d",[s substringWithRange:NSMakeRange(i - 1, 1)], first);
        int second = [[s substringWithRange:NSMakeRange(i - 2, 2)] intValue];
        DLog(@"[s substringWithRange:NSMakeRange(i - 2, 1)]:%@ second:%d",[s substringWithRange:NSMakeRange(i - 2, 1)], second);
        if(first >= 1 && first <= 9) {
            dp[i] += dp[i - 1];
        }
        if(second >= 10 && second <= 26) {
            dp[i] += dp[i - 2];
        }
    }
    return dp[s.length];
}

- (void)test {
    NSString *s = @"123";
    DLog(@"res:%d", [self numDecodings:s]);
}

@end
