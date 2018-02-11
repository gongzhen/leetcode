//
//  LC621.m
//  LC
//
//  Created by ULS on 2/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC621.h"
@interface LC621()

- (NSInteger)leastInterval:(char [])tasks n:(int)n;

@end

@implementation LC621

- (NSInteger)leastInterval:(char [])tasks n:(int)n {
    size_t len = strlen(tasks);
    int count[26];
    for(int i = 0; i < 26; i++) {
        count[i] = 0;
    }
    
    int max = 0;
    int maxNum = 0;
    for(int i = 0; i < len; i++) {
        count[tasks[i] - 'A']++;
        if(count[tasks[i] - 'A'] > max) {
            max = count[tasks[i] - 'A'];
            maxNum = 1;
        } else if (count[tasks[i] - 'A'] == max) {
            maxNum++;
        }
    }
    
    return MAX(len, (max - 1) * (n + 1) + maxNum);
}

- (void)test {
    char tasks[32] = {'A', 'A', 'A', 'B', 'B', 'B'};
    DLog(@"interval:%ld", [self leastInterval:tasks n:2]);
}

@end
