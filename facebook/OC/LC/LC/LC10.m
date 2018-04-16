//
//  LC10.m
//  LC
//
//  Created by Zhen Gong on 4/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC10.h"

@implementation LC10

-(BOOL)isMatch:(char* )s  p:(char*)p {
    int slen = (int)strlen(s);
    int plen = (int)strlen(p);
    
    BOOL** dp = (BOOL **)malloc((slen + 1) * sizeof(BOOL *));
    for(int i = 0; i < slen + 1; i++) {
        dp[i] = (BOOL *)calloc((plen + 1), sizeof(BOOL));
    }
    dp[0][0] = true;
    for(int i = 1; i <= plen; i++) {
        if(i > 1 && p[i-1] == '*' && dp[0][i - 2] == true) {
            dp[0][i] = true;
        }
    }
    
    for(int i = 1; i <= slen; i++) {
        for(int j = 1; j <= plen; j++) {
            if(s[i - 1] == p[j - 1] || p[j - 1] == '.') {
                DLog(@"dp[%d][%d]:%d=dp[%d][%d]:%d", i, j, dp[i][j] ,(i - 1), (j - 1), dp[i-1][j-1]);
                dp[i][j] = dp[i-1][j-1];
            } else if (p[j-1] == '*') {
                DLog(@"p[%d] == *", j - 1);
                if( j > 1 && p[j-2] != s[i - 1] && p[j - 2] != '.') {
                    DLog(@"dp[%d][%d]:%d=dp[%d][%d]:%d", i, j, dp[i][j], i, (j - 2), dp[i][j-2]);
                    dp[i][j] = dp[i][j-2];
                } else {
                    DLog(@"dp[%d][%d]:%d=dp[%d][%d]:%d", i, j, dp[i][j], i, (j - 2), dp[i][j-2]);
                    DLog(@"dp[%d][%d]:%d=dp[%d][%d]:%d", i, j, dp[i][j], i, (j - 1), dp[i][j-2]);
                    DLog(@"dp[%d][%d]:%d=dp[%d][%d]:%d", i, j, dp[i][j], (i - 1), j, dp[i-1][j]);
                    dp[i][j] = (dp[i][j-2] || dp[i][j-1] ||dp[i-1][j]);
                }
            }
        }
    }
    return dp[slen][plen];
}

- (void)test {
    char* s = "aa";
    char* p = "a";
    DLog(@"res:%d", [self isMatch:s p:p]);
    
    s = "aa";
    p = "a*";
    DLog(@"res:%d", [self isMatch:s p:p]);
    
    s = "aa";
    p = ".*";
    DLog(@"res:%d", [self isMatch:s p:p]);
    
    s = "aab";
    p = "c*a*b";
    DLog(@"res:%d", [self isMatch:s p:p]);

    s = "aaaaaa";
    p = "a*";
    DLog(@"res:%d", [self isMatch:s p:p]);
    
    s = "mississippi";
    p = "mis*is*p*.";
    DLog(@"res:%d", [self isMatch:s p:p]);
    
}
@end
