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
- (void)free_intArray:(int *)array;
- (void)free_DoubleArray:(int **)array row:(int)row col:(int)col;
- (NSTimeInterval)executionTime:(NSDate *)methodStart;

@end
