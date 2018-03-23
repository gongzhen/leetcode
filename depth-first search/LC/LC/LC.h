//
//  LC.h
//  LC
//
//  Created by ULS on 2/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LC : NSObject {
    int dir[4][2];
}

- (void)test;
- (void)free_fields:(char **)chars size:(int)size;
- (NSTimeInterval)executionTime:(NSDate *)methodStart;

@end
