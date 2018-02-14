//
//  LC278.m
//  LC
//
//  Created by ULS on 2/14/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC278.h"

@interface LC278()

- (NSInteger)firstBadVersion:(int)n;

@end

@implementation LC278

- (NSInteger)firstBadVersion:(int)n {
    int i = 1;
    int j = n;
    while (i < j) {
        int mid = i + (j - i) / 2;
        if([self isBadVersion:mid] == YES) {
            j = mid;
        } else {
            i = mid + 1;
        }
    }
    return i;
}

- (BOOL)isBadVersion:(int)version {
    int badVerion = 2;
    if( version >= badVerion) {
        return YES;
    }
    return NO;
}

- (void)test {
    // 1 ..... 1000 bad version
    DLog(@"first:%ld", [self firstBadVersion:1000]);
}

@end
