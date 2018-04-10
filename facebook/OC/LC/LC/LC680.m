//
//  LC680.m
//  LC
//
//  Created by ULS on 2/17/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC680.h"
@interface LC680()

- (BOOL)validPalindrome:(NSString *)s;

@end

@implementation LC680

/**
 680. Valid Palindrome II
 Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.
 
 Example 1:
 Input: "aba"
 Output: True
 Example 2:
 Input: "abca"
 Output: True
 Explanation: You could delete the character 'c'.
 
 */
- (BOOL)validPalindrome:(NSString *)s {
    if(s.length == 0) {
        return YES;
    }
    NSInteger i = 0;
    NSInteger j = s.length - 1;
    while(i < j) {
        if([s characterAtIndex:i] != [s characterAtIndex:j]) {
            // remove i or j.
            // only compare within i to j
            // i move foward by 1 or j move forward by 1
            if([self helper:s i:i + 1 j:j] || [self helper:s i:i j:j - 1]) {
                return YES;
            } else {
                return NO;
            }
        }
        i++;
        j--;
    }
    return NO;
}

- (BOOL)helper:(NSString *)s i:(NSInteger)i j:(NSInteger)j {
    while(i < j) {
        if([s characterAtIndex:i] != [s characterAtIndex:j]) {
            return NO;
        }
        i++;
        j--;
    }
    return YES;
}

////  Time Limit Exceeded
- (BOOL)validPalindromeTimeLimitExceeded:(NSString *)s {
    if(s.length == 0) {
        return YES;
    }
    
    if([self isPalindrome:s]) {
        return YES;
    }
    
    for(NSInteger i = 0; i < s.length; i++) {
        NSString *subStr = [[s substringToIndex:i] stringByAppendingString:[s substringFromIndex:i + 1]];
        DLog(@"subString:%@", subStr);
        if([self isPalindrome:subStr]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isPalindrome:(NSString *)s {
    NSInteger i = 0;
    NSInteger j = s.length - 1;
    while(i < j) {
        if([s characterAtIndex:i] == [s characterAtIndex:j]) {
            i++;
            j--;
        } else {
            return NO;
        }
    }
    return YES;
}

- (void)test {
    NSString *s1 = @"aba";
    DLog(@"s1:%d", [self validPalindrome:s1]);
    NSString *s2 = @"adcab";
    DLog(@"s2:%d", [self validPalindrome:s2]);
}

@end
