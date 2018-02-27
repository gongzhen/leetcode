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
- (NSInteger)leastInterval_2:(char [])tasks n:(int)n;
@end

@implementation LC621

- (NSInteger)leastInterval_2:(char [])tasks n:(int)n {
    int *count = (int *)calloc(26, sizeof(int));
    
    size_t len = strlen(tasks);
    /// 1: Find what's the max frequent number:
    /// 2: FInd how many max Frequent number.
    int howManyMaxFrequents = 0;
    int maxFrequent = 0;
    for(int i = 0; i < len; i++) {
        count[tasks[i] - 'A']++;
        if(count[tasks[i] - 'A'] > maxFrequent) {
            maxFrequent = count[tasks[i] - 'A'];
            howManyMaxFrequents = 1;
        } else if (count[tasks[i] - 'A'] == maxFrequent) {
            howManyMaxFrequents++;
        }
    }
    

    /// Special case
    /// A A A A B B B C C D D F F G tasks = 14 n = 2
    /// ABCD ABCD ABFG A F
    /// ans = (maxCount - 1) * (n + 1) + howManyMaxCounts ==> (4 - 1) * (n + 1) + 1
    DLog(@"(maxCount:%d - 1) * (n: %d + 1) + howManyMaxCounts:%d", maxFrequent, n, howManyMaxFrequents);
    int ans = (maxFrequent - 1) * ( n + 1) + howManyMaxFrequents;
    return MAX(ans, len);
}
/// A B @ A B @ A B         (3 - 1 ) * (2 + 1) + 2 = 8
/// we seperate k - 1 groups and eatch group has n slots. we have p tasks left.
/// A B C  @(n slots) A B @ ....    A...
///    n slots....      n slots..   p tasks
/// A and next A will be n slots, B and next B will be n slots.

/// Special case
/// A A A A B B B C C D D F F G tasks = 14 n = 2
/// ABC ABC ABD A FDG F
/// ans = (k - 1) * (n + 1) + p ==> 4 - 1 = 3 * (3) +
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
    DLog(@"(maxCount:%d - 1) * (n: %d + 1) + howManyMaxCounts:%d", max, n, maxNum);
    return MAX(len, (max - 1) * (n + 1) + maxNum);
}

- (void)test {
    char tasks[32] = {'A', 'A', 'A', 'B', 'B', 'B'}; /// [ AB @ AB@ ] AB: howManyMaxFrequents = 2
    // char tasks[32] = {'A', 'A', 'A', 'A', 'B', 'B', 'B', 'C', 'C', 'D', 'D', 'F', 'F', 'G'};
    DLog(@"interval:%ld", [self leastInterval:tasks n:2]);
    DLog(@"interval:%ld", [self leastInterval_2:tasks n:2]);
}

@end
