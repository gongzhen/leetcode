//
//  LC567.m
//  LC
//
//  Created by ULS on 2/25/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC567.h"

@interface LC567()

- (BOOL)checkInclusion:(char *)s1 s2:(char *)s2;

@end

@implementation LC567

- (BOOL)checkInclusion:(char *)s1 s2:(char *)s2 {
    long len1 = strlen(s1);
    long len2 = strlen(s2);
    if(len1 > len2) {
        return NO;
    }
    DLog(@"s1:%s len1:%ld s2:%s len2:%ld",s1, len1, s2, len2);
    int *s1map = (int *)calloc(32, sizeof(int));
    for(int i = 0; i < len1; i++) {
        s1map[s1[i] - 'a']++;
    }
    
    for(int i = 0; i <= (len2 - len1); i++) {
        int *s2map = (int *)calloc(32, sizeof(int));
        for(int j = 0; j < len1; j++) {
            s2map[s2[i + j] - 'a']++;
        }
        char substr1[len1 + 1];
        memcpy(substr1, &s2[i], len1 + 1);
        substr1[len1] = '\0';
        DLog(@"i:%d len2 - len1:%ld substr1 :%s s1:%s", i, len2 - len1, substr1, s1);
        if([self compare:s1map size1:len1 s2:s2map size2:len1] == YES) {
            free(s2map);
            return YES;
        }
        free(s2map);
    }
    free(s1map);
    return NO;
}

- (BOOL)compare:(int *)s1 size1:(long)size1 s2:(int *)s2 size2:(long)size2 {
    if(size1 != size2) {
        return false;
    }
    
    for(int i = 0; i < 32; i++) {
        printf("%d", s1[i]);
    }
    printf("\n");
    
    for(int i = 0; i < 32; i++) {
        printf("%d", s2[i]);
    }
    printf("\n");
    
    for(int i = 0; i < size1; i++) {
        DLog(@"s1:%d == s2:%d", s1[i], s2[i]);
        if(s1[i] != s2[i]) {
            return false;
        }
    }
    return true;
}

- (void)test {
//    char* s1 = "hello";
//    char* s2 = "ooolleooolleh";
//    DLog(@"res:%d", [self checkInclusion:s1 s2:s2]);
    char* s1 = "ab";
    char* s2 = "eidboaoo";
    DLog(@"res:%d", [self checkInclusion:s1 s2:s2]);
}

@end
