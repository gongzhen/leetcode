//
//  LC76.m
//  LC
//
//  Created by ULS on 2/14/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC76.h"

@interface LC76()

- (NSString *)minWindow:(NSString *)s t:(NSString *)t;

@end

@implementation LC76

- (NSString *)minWindow:(NSString *)s t:(NSString *)t {
    int map[256];
    int i = 0;
    int j = 0;
    int head = 0;
    NSInteger len1 = s.length;
    NSInteger len2 = t.length;
    int count = (int)len2;
    
    /// 1: Create a map with 256 index including lowercase and uppercase.
    for(int i = 0; i < len2; i++) {
        char c = [t characterAtIndex:i];
        map[c - 'A']++;
    }
    
    /// 2: maintaining two pointers i and j.
    int min = (int)len1 + 1;
    while(i < len1) {
        
        /// 3: If s[i] is in the map and map[s[i]]'s value is 1 ....2...3...
        /// count--; count is the s2's number of characters.
        if(map[[s characterAtIndex:i] - 'A'] >= 1) {
            count--;
        }
        map[[s characterAtIndex:i] - 'A']--; /// if char not in map, then the value will be (0 - 1) = -1.
        i++;
        
        /// count == 0 means we find all chars from map.
//        if(count == 0) {
//            if(i - j < min) {
//                min = i - j;
//                head = j;
//            }
            while(count == 0) { /// Don't put count == 0 in if loop. Put it in While loop.
                if(i - j < min) {
                    min = i - j;
                    head = j;
                }
                /// B appears 2 times. so map[B] == -2.
                DLog(@"map[%c]:%d", ([s characterAtIndex:j]), map[[s characterAtIndex:j] - 'A']);
                if(map[[s characterAtIndex:j] - 'A'] == 0) {
                    count++;
                }
                DLog(@"substr:%@", [s substringWithRange:NSMakeRange(head, min)]);
                DLog(@"substr:%@, char[j:%d]:%c, count:%d", [s substringWithRange:NSMakeRange(j, i - j)], j, [s characterAtIndex:j], count);
                map[[s characterAtIndex:j] - 'A']++;
                j++;
            }
//        }
        DLog(@"--------------------------------------------")
    }
    return min == (len1 + 1) ? @"" : [s substringWithRange:NSMakeRange(head, min)];
}

- (void)test {
    NSString *s = @"ADOBECODEBANC";
    NSString *t = @"ABC";
    
    DLog(@"res:%@", [self minWindow:s t:t]);
}

@end
