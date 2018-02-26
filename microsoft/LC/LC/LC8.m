//
//  LC8.m
//  LC
//
//  Created by ULS on 2/25/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC8.h"

@interface LC8()

- (int)myAtoi:(char* )str;

@end

@implementation LC8

- (int)myAtoi:(char* )str {
    long len = strlen(str);
    if(len == 0) {
        return 0;
    }
    
    int startIndex = 0;
    /// skipping the leading space
    while(str[startIndex] == ' ') {
        startIndex++;
    }
    
    int res = 0;
    int BASE = 10;
    char sign = '+';
    if(str[startIndex] == '+' || str[startIndex] == '-') {
        sign = str[startIndex++];
    }
    for(int i = startIndex; i < len; i++){
        if(isdigit(str[i]) == false) {
            res = sign == '+' ? res : -res; /// "  -0012a42".
            return res;
        }
        int digit = str[i] - '0';
        /// Dont' have to think negative number since we append positive int here.
        if(INT_MAX / 10 < res && (INT_MAX / 10 == res && INT_MAX % 10 < digit)) { /// 2147483648
            res = sign == '+' ? INT_MAX : INT_MIN;
            return res;
        }
        res = res * BASE + digit;
    }
    res = sign == '+' ? res : -res;
    return res;
}

- (void)test {
    char* s1 = "2147483648";
    DLog(@"%d", [self myAtoi:s1]);
    s1 = "2147483647";
    DLog(@"%d", [self myAtoi:s1]);
    s1 = "-0012a42";
    DLog(@"%d", [self myAtoi:s1]);
}

@end
