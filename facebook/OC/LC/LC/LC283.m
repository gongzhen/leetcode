//
//  LC283.m
//  LC
//
//  Created by ULS on 2/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC283.h"

@interface LC283()

- (void)moveZeros:(int [])tasks size:(int)size;

@end

@implementation LC283

- (void)moveZeros:(int [])tasks size:(int)size {
    int j = 0;
    for(int i = 0; i < size; i++) {
        if(tasks[i] != 0) {
            tasks[j++] = tasks[i];
        }
    }
    
    for(int i = 0; i < size; i++) {
        NSLog(@"tasks[%d]:%d", i, tasks[i]);
    }
}

- (void)test {
    int tasks[6] = {0, 1, 0, 3, 12};
    size_t len = sizeof(tasks) / sizeof(tasks[0]);
    [self moveZeros:tasks size:(int)len];
}

@end
