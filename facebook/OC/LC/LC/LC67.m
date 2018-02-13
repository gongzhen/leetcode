//
//  LC67.m
//  LC
//
//  Created by ULS on 2/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC67.h"
@interface LC67()

- (NSString *)addBinary:(NSString *)a b:(NSString *) b;

@end

@implementation LC67

- (NSString *)addBinary:(NSString *)a b:(NSString *) b {
    NSUInteger len1 = [a length];
    NSUInteger len2 = [b length];
    if(len1 == 0) {
        return b;
    } else if (len2 == 0) {
        return a;
    }
    
    if(len1 > len2) {
        return [self addBinary:b b:a];
    }
    
    /// len1 <= len2
    NSMutableString *res = [NSMutableString new];
    
    //// 1 1 1 1 1
    ////       1 1
    NSInteger i = len1 - 1;
    NSInteger j = len2 - 1;
    
    int carry = 0;
    while(i >= 0 && j >= 0) {
        int a1 = [a characterAtIndex:i] - '0';
        int b1 = [b characterAtIndex:j] - '0';
        int r = (a1 + b1 + carry) % 2;
        carry = (a1 + b1 + carry) / 2;
        // [res appendString:[NSString stringWithFormat:@"%d", r]];
        [res insertString:[NSString stringWithFormat:@"%d", r] atIndex:0];
        i--;
        j--;
    }
    /// len1 <= len2, looping b, i == 0 and j >= 0
    while(j >= 0) {
        int b1 = [b characterAtIndex:j] - '0';
        int r = (b1 + carry) % 2;
        carry = (b1 + carry) / 2;
        [res insertString:[NSString stringWithFormat:@"%d", r] atIndex:0];
//        [res appendString:[NSString stringWithFormat:@"%d", r]];
        j--;
    }
    if(carry == 1) {
//        [res appendString:[NSString stringWithFormat:@"%d", carry]];
        [res insertString:[NSString stringWithFormat:@"%d", carry] atIndex:0];
    }
    DLog(@"res:%@", res);
    return [res copy];
}

- (void)test {
    NSString *s1 = @"111";
    NSString *s2 = @"100";
    [self addBinary:s1 b:s2];
    
}
@end
