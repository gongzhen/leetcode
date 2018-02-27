//
//  LC.m
//  LC
//
//  Created by ULS on 2/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC.h"

@implementation LC

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
