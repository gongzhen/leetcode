//
//  LC158.m
//  LC
//
//  Created by ULS on 2/13/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC158.h"

@interface LC158() {
    char buf4[4];
}

@property (strong, nonatomic) NSString *fileContent;


- (NSInteger)read:(char *)buf n:(int)n;
- (NSInteger)read_2:(char *)buf n:(int)n;
@end

@implementation LC158 {
    NSInteger _bufCount;
    NSInteger _bufIdx;
}

- (instancetype)init {
    if(self = [super init]) {
        _bufIdx = 0;
        _bufCount = 0;
    }
    return self;
}

/// buf: Destination buffer
/// n:   Maximum number of characters to read
/// return number of characters read.

- (NSInteger)read:(char *)buf n:(int)n {
    /// i to count characters.
    int i = 0;
    while (i < n) {
        /// 1: Check bufIdx == bufCunt == 0.
        if(_bufCount != 0 && _bufIdx < _bufCount) { /// bufCount == 4
            buf[i++] = buf4[_bufIdx++];
        } else {
            /// 2: bufIdx == bufCount == 0 then fetch string.
            _bufCount = [self read4:buf4];
            if(_bufCount == 0) { /// fileContent is empty.
                break;
            } else {
                /// reflush bufIdx tpo 0.
                _bufIdx = 0;
            }
        }
    }
    return i;
}

- (NSInteger)read_2:(char *)buf n:(int)n {
    int i = 0;
    while (i < n) {
        if(_bufCount == 0) { /// cannot move _bufCount == 0. It will flush _bufCount every times.
            _bufCount = [self read4:buf4];
            DLog(@"buf4:%s _bufCount:%ld", buf4, _bufCount);
        }
        if(_bufCount == 0) {
            break;
        }
        if(_bufIdx < _bufCount) {
            buf[i++] = buf4[_bufIdx++];
        }
        if(_bufIdx == _bufCount) {
            _bufIdx = 0;
            _bufCount = 0; /// set _bufCount == 0 when all the buf4 is finished.
        }
    }
//    _bufIdx = 0;
//    _bufCount = 0; /// set _bufCount == 0 when all the buf4 is finished.
    return i;
}


/// healler API
- (NSInteger)read4:(char *)buf {
    NSInteger i = 0;
    while(i < [self.fileContent length] && i < 4) {
        buf[i] = [self.fileContent characterAtIndex:i];
        i++;
    }
    if(self.fileContent.length < 4) {
        self.fileContent = @"";
    } else {
        self.fileContent = [self.fileContent substringFromIndex:4];
    }
    return i;
}

- (void)test {
    self.fileContent = @"abc";
    char buf[64];
//    DLog(@"[self read4:buf]:%ld", [self read4:buf]);
//    DLog(@"buf:%s", buf);
//    DLog(@"fileContent:%@", self.fileContent);
//    DLog(@"[self read4:buf]:%ld", [self read4:buf]);
//    DLog(@"buf:%s", buf);
//    DLog(@"fileContent:%@", self.fileContent);
    DLog(@"idx1:%ld", [self read_2:buf n:2]);
    DLog(@"buf:%s", buf);
//    DLog(@"idx1:%ld", [self read_2:buf n:6]);
//    DLog(@"buf:%s", buf);
//    DLog(@"idx1:%ld", [self read :buf n:2]);
//    DLog(@"buf:%s", buf);
}

@end
