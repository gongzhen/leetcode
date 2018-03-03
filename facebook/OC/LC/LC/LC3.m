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
