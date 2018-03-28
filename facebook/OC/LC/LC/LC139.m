//
//  LC139.m
//  LC
//
//  Created by ULS on 2/19/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC139.h"

@interface LC139()

- (BOOL)wordBreak:(NSString *)s wordDict:(NSArray *)wordDict;

@end

@implementation LC139

- (BOOL)wordBreak:(NSString *)s wordDict:(NSArray *)wordDict {
    int* dp = (int *)calloc(s.length + 1, sizeof(int)); /// dp length is s.length + 1.
    dp[0] = 1;
    for(int i = 1; i <= [s length]; i++) { // i start from 1.
        for(int j = 0; j < i; j++) { // j from 0 to i.
            DLog(@"j:%d, i:%d, substr:%@",j, i, [s substringWithRange:NSMakeRange(j, i - j)]);
            if(dp[j] == 1 && [wordDict containsObject:[s substringWithRange:NSMakeRange(j, i - j )]]) {
                DLog(@"substr===============:%@", [s substringWithRange:NSMakeRange(j, i - j)]);
                dp[i] = true;
                break;
            }
        }
    }
    for(int i = 0; i < s.length + 1; i++) {
        DLog(@"dp:%d", dp[i]);
    }
    return dp[s.length];
}

- (void)test {
    NSString *s = @"leetcode";
    NSArray *dict = @[@"leet", @"code"];
    [self wordBreak:s wordDict:dict];
}

@end
