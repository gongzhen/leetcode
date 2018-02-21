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

@end

@implementation LC125

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

}

@end
