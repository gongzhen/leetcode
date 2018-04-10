//
//  LC3.m
//  LC
//
//  Created by ULS on 3/3/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC3.h"

@interface LC3()

- (int)lengthOfLongestSubstring:(char *)s;

@end

@implementation LC3

/**
 Longest Substring Without Repeating Characters
 Given a string, find the length of the longest substring without repeating characters. 
 Examples:
 Given "abcabcbb", the answer is "abc", which the length is 3.
 Given "bbbbb", the answer is "b", with the length of 1.
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 */

- (int)lengthOfLongestSubstring:(char *)s {
    int len = (int)strlen(s);
    if(len == 0) {
        return 0;
    }
    
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    int j = 0;
    int maxLen = 0;
    for(int i = 0; i < len; i++) {
        if([map objectForKey:[NSString stringWithFormat:@"%c", s[i]]] == NULL) {
            [map setObject:@(i) forKey:[NSString stringWithFormat:@"%c", s[i]]];
        } else {
            int idx = [[map objectForKey:[NSString stringWithFormat:@"%c", s[i]]] intValue];
            j = MAX(j, idx + 1);
            [map setObject:@(i) forKey:[NSString stringWithFormat:@"%c", s[i]]];
        }
        if(i - j + 1  > maxLen) {
            maxLen = i - j + 1;
        }
    }
    return maxLen;
}

- (void)test {
    char* s = "abcabcbb";
    DLog(@"res:%d", [self lengthOfLongestSubstring:s]);
}
@end
