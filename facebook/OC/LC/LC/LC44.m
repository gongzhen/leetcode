//
//  LC44.m
//  LC
//
//  Created by ULS on 2/25/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC44.h"
@interface LC44()

- (BOOL)isMatch:(char *)s p:(char *)p;

@end

@implementation LC44

/// https://www.youtube.com/watch?v=-8QnRMyHo_o
- (BOOL)isMatch:(char *)s p:(char *)p {
    int sp = 0;
    long slength = strlen(s);
    long plength = strlen(p);
    int pp = 0;
    int match = 0;
    int star = -1;
    
    while(sp < slength) {
        /// p and s both equals or p is *
        /// pp and ss both ++
        if(pp < plength && (s[sp] == p[pp] || p[pp] == '?')) {
            sp++;
            pp++;
        } else if (pp < plength && p[pp] == '*') {
            /// p is * then record star index = p
            /// pp index is match index it means * will match
            star = pp;
            /// match index is sp index
            match = sp;
            /// pp++
            pp++;
        } else if (star != -1){
            /// pp move one step
            /// match++ becaue pp is *
            /// sp = match, sp move forward one.
            pp = star + 1;
            match++;
            sp = match;
        } else {
            return NO;
        }
    }
    while(pp < plength && p[pp] == '*') {
        pp++;
    }
    return pp == plength;
}

- (void)test {
    char* s = "aa";
    char* p = "a";
//    DLog(@"res:%d", [self isMatch:s p:p]);
//    
//    s = "aa";
//    p = "aa";
//    DLog(@"res:%d", [self isMatch:s p:p]);
//    
//    s = "aaa";
//    p = "aa";
//    DLog(@"res:%d", [self isMatch:s p:p]);
//    
//    s = "aa";
//    p = "*";
//    DLog(@"res:%d", [self isMatch:s p:p]);
//    
//    s = "aa";
//    p = "a*";
//    DLog(@"res:%d", [self isMatch:s p:p]);
//    
//    s = "ab";
//    p = "?*";
//    DLog(@"res:%d", [self isMatch:s p:p]);
//    
//    s = "aab";
//    p = "c*a*b";
//    DLog(@"res:%d", [self isMatch:s p:p]);
    
    s = "adceb";
    p = "*a*b";
    DLog(@"res:%d", [self isMatch:s p:p]);
    
//    s = "acdcb";
//    p = "a*c?b";
//    DLog(@"res:%d", [self isMatch:s p:p]);
}

@end
