//
//  LC.m
//  LC
//
//  Created by ULS on 2/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC.h"

@interface LC() 

@end

@implementation LC

- (instancetype)init {
    if(self = [super init]) {
        ///{{0, 1}, {0, -1}, {1, 0}, {-1, 0}}
        dir[0][0] = 0;
        dir[0][1] = 1;
        dir[1][0] = 0;
        dir[1][1] = -1;
        dir[2][0] = 1;
        dir[2][1] = 0;
        dir[3][0] = -1;
        dir[3][1] = 0;
    }
    return self;
}

- (void)test {
    DLog(@"LC");
}

- (NSTimeInterval)executionTime:(NSDate *)methodStart {
    if(methodStart == nil) {
        return 0.0;
    }
    return [methodStart timeIntervalSinceDate:methodStart];
}
@end
