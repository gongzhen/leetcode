//
//  LC84.m
//  LC
//
//  Created by Admin  on 4/21/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC84.h"
#import "NSMutableArray+Stack.h"

@implementation LC84

/// https://leetcode.com/problems/largest-rectangle-in-histogram/discuss/28900/O(n)-stack-based-JAVA-solution
- (int)largestRectangleAreaStack:(int* )heights size:(int)size {
    if(heights == nil || size == 0) {
        return 0;
    }
    int max = 0;
    NSMutableArray *stack = [NSMutableArray array];
    for(int i = 0; i <= size;) {
        int height = (i == size) ? 0 : heights[i];
        /// stack push index when the hight is ascending.
        if(stack.count == 0 || height >= heights[[[stack peek] intValue]]) {
            [stack push:@(i)];
            i++;
        } else {
            /// height is descending.
            int index = [[stack pop] intValue];
            int leftHeight = heights[index];
            /// Comment line 31 to 34 and it still passes the leetcode.
            while( stack.count != 0 && leftHeight == heights[[[stack peek] intValue]]) {
                [stack pop];
            }
            
            int leftMost = stack.count == 0 ? 0 : [[stack peek] intValue] + 1;
            max = MAX(max, leftHeight * (i - leftMost));
        }
    }
    return max;
}

- (int)largestRectangleArea:(int* )heights size:(int)size {
    if(heights == nil || size == 0) {
        return 0;
    }
    
    int max = 0;
    for(int i = 0; i < size; i++) {
        if(i == size - 1 || heights[i] > heights[i + 1]) {
            int minHeight = heights[i];
            for(int j = i; j >= 0; j--) {
                minHeight = MIN(minHeight, heights[j]);
                max = MAX(max, minHeight * (i - j + 1));
            }
        }
    }
    return max;
}

- (void)test {
    int num1[6] = {2,1,5,6,2,3};
    int *ptr = num1;
    int res = [self largestRectangleAreaStack:ptr size:6];
    DLog(@"res:%d", res);
}
@end
