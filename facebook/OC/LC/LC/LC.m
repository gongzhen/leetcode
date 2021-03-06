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

- (void)free_fields:(char **)chars size:(int)size {
    for(int i = 0; i < size; i++) {
        free(chars[i]);
    }
    free(chars);
}

- (NSTimeInterval)executionTime:(NSDate *)methodStart {
    if(methodStart == nil) {
        return 0.0;
    }
    return [methodStart timeIntervalSinceDate:methodStart];
}

- (void)free_intArray:(int *)array{
    free(array);
}

- (void)free_DoubleArray:(int **)array row:(int)row col:(int)col {
    for(int i = 0; i < row; i++) {
        free(array[i]);
    }
    free(array);
}

@end
