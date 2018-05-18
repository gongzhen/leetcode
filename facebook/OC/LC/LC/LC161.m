//
//  LC161.m
//  LC
//
//  Created by ULS on 2/17/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC161.h"

@interface LC161()

- (BOOL)isOneEditDistance:(NSString *)s t:(NSString *)t;

@end

@implementation LC161

- (BOOL)isOneEditDistance:(NSString *)s t:(NSString *)t {
    if(s.length == 0 && t.length == 0) {
        return NO;
    }
    if(s.length == 0 || t.length == 0) {
        return YES;
    }
    for(NSInteger i = 0; i < MIN(s.length, t.length); i++) {
        if([s characterAtIndex:i] != [t characterAtIndex:i]) {
            if(s.length == t.length) {
                /// A B C
                /// A T C
                return [[s substringFromIndex:i + 1] isEqualToString:[t substringFromIndex:i + 1]];
            } else if (s.length < t.length) {
                /// A B C
                /// A D B C
                return [[s substringFromIndex:i] isEqualToString:[t substringFromIndex:i + 1]];
            } else {
                /// A B D C
                /// A B C
                return [[s substringFromIndex:i + 1] isEqualToString:[t substringFromIndex:i]];
            }
        }
    }
    return ABS(s.length - t.length) == 1;
}

- (void)test {
    NSString *s = @"ABC";
    NSString *t = @"ADC";
    [self isOneEditDistance:s t:t];
}

@end
