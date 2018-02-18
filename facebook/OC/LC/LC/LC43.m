//
//  LC43.m
//  LC
//
//  Created by ULS on 2/17/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC43.h"

@interface LC43()

- (char *)multiply:(char *)num1 num2:(char *)num2;

@end

@implementation LC43

- (char *)multiply:(char *)num1 num2:(char *)num2 {
    /// reverse char
    char *reverse1 = [self reverse:num1];
    char *reverse2 = [self reverse:num2];
    DLog(@"reverse1:%s", reverse1);
    DLog(@"reverse2:%s", reverse2);
    size_t len1 = strlen(reverse1);
    size_t len2 = strlen(reverse2);
//    DLog(@"len1:%ld len2:%ld", len1, len2);

    /// 9   9
    /// 9   9
    /// ----
    /// 81  81
    ///     81  81
    /// ----------
    /// 81  162 81
    //// BugL using calloc to initialize to 0 for each element.
    //// int *num = malloc((len1 + len2) * sizeof(int *)); ///  num[i + j]: = 268797042
    int *num = calloc((len1 + len2), sizeof(int *));
    for(int i = 0; i < len1; i++) {
        for(int j = 0; j < len2; j++) {
//            DLog(@"1:%c = %d", reverse1[i], (reverse1[i] - '0'));
//            DLog(@"2:%c = %d", reverse1[j], (reverse2[j] - '0'));
//            DLog(@"num[i + j]: = %d", num[i + j]);
            num[i + j] += (reverse1[i] - '0') * (reverse2[j] - '0');
//            DLog(@"i + j: %d = %d",(i + j), num[i + j]);
        }
    }
    
    int carry = 0;
    char * res = malloc(sizeof(char* ) * (len1 + len2));
    for(int i = 0; i < (len1 + len2); i++) {
        num[i] = num[i] + carry;
        carry = num[i] / 10;
        num[i] = num[i] % 10;
//        DLog(@"digiti:%d", num[i]);
//        DLog(@"carry:%d", carry);
        res[i] = num[i] + '0';
//        DLog(@"res[i]:%c", res[i]);
    }
    [self reverseNoReturn:res];
    int i = 0;
    for(; i < (len1 + len2); i++) {
        if(res[i] != '0') {
            break;
        }
    }
    
    char* resSkipZero = malloc(sizeof(char* ) * (len1 + len2 - i));
    int j = 0;
    for(; i < (len1 + len2); i++) {
        resSkipZero[j++] = res[i];
    }
    free(res);
    return resSkipZero;
}

- (char *)reverse:(char *)num {
    int len  = (int)strlen(num);
    char *reverse = malloc(sizeof(char *) * len);
    for(int i = len - 1; i >= 0; i--) {
        reverse[len - 1 - i] = num[i];
    }
    return reverse;
}

- (void)reverseNoReturn:(char *)str {
    if(str == 0) {
        return;
    }
    
    if(*str == 0) {
        return;
    }
    
    char *start = str;
    char *end = start + (strlen(str) - 1);
    char temp;
    while (start < end) {
        temp = *start;
        *start = *end;
        *end = temp;
        start++;
        end--;
    }
}

- (void)test {
    char* num1 = "1";
    char* num2 = "99";
    char* res = [self multiply:num1 num2:num2];
    DLog(@"res:%s", res);
    free(res);
    
    
}

@end
