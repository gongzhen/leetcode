//
//  LC277.m
//  LC
//
//  Created by ULS on 2/14/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC277.h"

@interface LC277()

- (NSInteger)findCelebrity:(int)n;

@end

@implementation LC277

- (NSInteger)findCelebrity:(int)n {
    if(n < 2) {
        return -1;/// there is only one person.
    }
    
    int possible = 0;
    for(int i = 1; i < n; i++) {
        if([self knows:possible b:i]) { ///
            possible = i;
        }
    }
    
    /// verify possible. Go to youtube to watch the video.
    for(int i = 0; i < n; i++) {
        if( i!= possible && ([self knows:possible b:i] || (![self knows:i b:possible]))) {
            return -1;
        }
    }
    return possible;
}

- (BOOL)knows:(int)a b:(int)b {
    return YES;
}

- (void)test {
    
}

@end
