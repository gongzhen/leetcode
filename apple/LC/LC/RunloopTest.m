//
//  RunloopTest.m
//  LC
//
//  Created by Zhen Gong on 5/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "RunloopTest.h"

@implementation RunloopTest

- (void)test {
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)timerMethod {
    static int num = 0;
    DLog(@"%d", num++);
}
@end
