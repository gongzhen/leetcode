//
//  LC157.m
//  LC
//
//  Created by ULS on 2/15/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC157.h"

@interface LC157()

@property (copy, nonatomic) NSString *fileContent;
- (NSInteger)read:(char *)buf n:(int)n;
@end

@implementation LC157

- (NSInteger)read4:(char *)buf {
    NSInteger i = 0;
    while(i < self.fileContent.length && i < 4) {
        buf[i] = [self.fileContent characterAtIndex:i];
        i++;
    }
    
    if(i == self.fileContent.length) {
        self.fileContent = @"";
    } else {
        self.fileContent = [self.fileContent substringFromIndex:i];
    }
    return i;
}

- (NSInteger)read:(char *)buf n:(int)n {
    int i = 0;
    NSInteger buf4Count = 0;
    NSInteger buf4Idx = 0;
    char buf4[4];
    BOOL eof = NO;
    while( !eof && i < n) {
        buf4Count = [self read4:buf4];
        DLog(@"buf4:%s", buf4);
        if(buf4Count < 4) {
            eof = YES;
        }
        while(buf4Idx < buf4Count && i < n) {
            buf[i++] = buf4[buf4Idx++];
        }
        buf4Idx = 0;
    }
    DLog(@"buf:%s", buf);
    return i;
}

- (void)test {
    self.fileContent = @"abcdefg";
    char buf[32];
    DLog(@"res:%ld", [self read:buf n:10]);
    DLog(@"buf:%s", buf);
}

@end
