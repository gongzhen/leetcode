//
//  LC84.m
//  LC
//
//  Created by Admin  on 4/21/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC84.h"

@implementation LC84

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
    int res = [self largestRectangleArea:ptr size:6];
    DLog(@"res:%d", res);
}
@end
