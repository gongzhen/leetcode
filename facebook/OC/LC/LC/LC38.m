//
//  LC38.m
//  LC
//
//  Created by ULS on 3/31/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC38.h"

@interface LC38()

- (NSString *)countAndSay:(int)n;

@end

@implementation LC38

/*
 1 == 1
 2 == 11
 3 == 21
 4 == 1211
 5 == 111221
*/

- (NSString *)countAndSay:(int)n {
    int i = 1;
    NSString* res = @"1";
    NSMutableString *sb = [NSMutableString string];
    while(i < n) {
        int count = 0;
        char c = [res characterAtIndex:0];
        for(int j = 0; j <= [res length]; j++) {
            if(j != [res length] && [res characterAtIndex:j] == c) {
                count++;
            } else {
                [sb appendString:[NSString stringWithFormat:@"%d", count]];
                [sb appendString:[NSString stringWithFormat:@"%c", c]];
                if(j != [res length]) {
                    count = 1;
                    c = [res characterAtIndex:j];
                }
            }
        }
        res = [sb copy]; /// Make sure copy here.
        [sb setString:@""];
        DLog(@"res:%@", res);
        i++;
    }
    return res;
}

- (void)test {
    DLog(@"%@", [self countAndSay:5]);
}
@end
