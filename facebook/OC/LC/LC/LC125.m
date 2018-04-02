//
//  LC125.m
//  LC
//
//  Created by ULS on 2/15/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC125.h"

@interface LC125()

- (BOOL)isPalindrome:(NSString *)s;
- (BOOL)isPalindrome_1:(NSString *)s;

@end

@implementation LC125

- (BOOL)isPalindrome_1:(NSString *)s {
    if(s.length == 0) {
        return YES;
    }
    NSInteger i = 0, j = s.length - 1;
    while(i < j) {
        char ci = [s characterAtIndex:i];
        char cj = [s characterAtIndex:j];
        if(![self isLetter:ci] && ![self isDigit:ci]) {
            i++;
        } else if (![self isLetter:cj] && ![self isDigit:cj]) {
            j--;
        } else {
            if(tolower(ci) != tolower(cj)) {
                return NO;
            }
            i++;
            j--;
        }
    }
    return YES;
}

- (BOOL)isLetter:(char)c {
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z');
}

- (BOOL)isDigit:(char)c {
    return c >= '0' && c <= '9';
}

- (BOOL)isPalindrome:(NSString *)s {
    if(s.length == 0) {
        return YES;
    }
    
    NSInteger i = 0, j = s.length - 1;
    while(i < j) {
        while(i < j && ![self validChar:[s characterAtIndex:i]]) {
            i++;
        }
        while(i < j && ![self validChar:[s characterAtIndex:j]]) {
            j--;
        }
        if([self checkEqual:[s characterAtIndex:i] t:[s characterAtIndex:j]]) {
            i++;
            j--;
        } else {
            return NO;
        }
    }
    return YES;
}

- (BOOL)validChar:(char)s {
    return (s >= 'A' && s <= 'Z') ||( s >= 'a' && s <= 'z') || (s >= '0' && s <= '9');
}

- (BOOL)checkEqual:(char)s t:(char)t {
    // s: 'a' t: 'A' or s: 'A' t:'a'
    DLog(@"s:%c === t:%c", s, t);
    if (toupper(s) == toupper(t)) {
        return YES;
    }
    return NO;
}



- (void)test {
    NSString *s = @"race a car";
    DLog(@"%d", [self isPalindrome:s]);
    NSString *t = @"A man, a plan, a canal: Panama";
    DLog(@"%d", [self isPalindrome:t]);
    DLog(@"%d", [self isPalindrome_1:s]);
    DLog(@"%d", [self isPalindrome_1:t]);
}

@end
