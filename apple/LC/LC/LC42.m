//
//  LC42.m
//  LC
//
//  Created by ULS on 4/8/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC42.h"

@interface LC42()

- (int)trap:(int *)height size:(int)size;
- (int)trap_1:(int *)height size:(int)size;

@end

@implementation LC42

- (int)trap_1:(int *)height size:(int)size {
    if(size == 0) {
        return 0;
    }
    
    int res = 0;
    int left =0, right = size - 1;
    int leftMost = 0, rightMost = 0;
    
    /// 0,1,0,2,1,0,1,3,2,1,2,1
    /// 0 0 1 1 2 2 2 2 3 3 3 3 leftMost
    /// 0,1,0,2,1,0,1,3,2,1,2,1
    /// 3,3,3,3,3,3,3,2,2,2,1,0 rightMost
    while(left <= right) {
        /// left height <= right height.
        if(height[left] <= height[right]) {
            /// left height >= leftMost then update leftMost.
            if(height[left] >= leftMost) {
                leftMost = height[left];
            } else {
                /// left Most > left height && left height <= right Height,
                // 0  (leftMost)1  (left height)0 ...... 1 (right)
                res += leftMost - height[left];
            }
            printf("leftMost:%d ===> res:%d\n", leftMost, res);
            left++;
        } else { /// left Height > right Height
            /// right height >= right Most
            if(height[right] >= rightMost) {
                /// then update right Most
                rightMost = height[right];
            } else {
                /// leftHeight > right Height && right Height < right Most
                /// .. 3(left)......1(right height) 2(right Most) 1
                res += rightMost - height[right];
            }
            printf("rightMost:%d ===> res:%d\n", rightMost, res);
            right--;
        }
    }
    return res;
}

- (int)trap:(int *)height size:(int)size {
    if(size == 0) {
        return 0;
    }
    
    int *leftMost = (int *)calloc(size, 0);
    int max = height[0];
    printf("%d\n", leftMost[0]);
    for(int i = 1; i < size; i++) {
        leftMost[i] = max;
        printf("%d\n", leftMost[i]);
        max = MAX(max, height[i]);
    }
    /// 0,1,0,2,1,0,1,3,2,1,2,1
    /// 0 0 1 1 2 2 2 2 3 3 3 3 leftMost
//    for(int i = 0; i < size; i++) {
//        printf("%d\n", leftMost[i]);
//    }
    DLog(@"-------------------------------------------------------------------------")
    int *rightMost = (int *)calloc(size, 0);
    rightMost[size - 1] = 0;
    max = height[size - 1];
    int total = 0;
    int current = 0;
    /// rightMost[size -1] = 0
    /// 0,1,0,2,1,0,1,3,2,1,2,1
    /// 0 0 1 1 2 2 2 2 3 3 3 3 leftMost
    /// 0,1,0,2,1,0,1,3,2,1,2,1
    /// 3,3,3,3,3,3,3,2,2,2,1,0 rightMost
    printf("%d\n", rightMost[size - 1]);
    for(int j = size - 2; j >= 0; j--) {
        rightMost[j] = max; /// j starts from size - 2.
        printf("%d\n", rightMost[j]);
        current = MIN(rightMost[j], leftMost[j]) - height[j];
        if(current > 0) {
            printf("j:%d:MIN(%d, %d) = %d => current:%d\n", j, rightMost[j], leftMost[j], MIN(rightMost[j], leftMost[j]), current);
            total += current;
        }
        max = MAX(max, height[j]);
    }
    return total;
}

- (void)test {
    int height[12] = {0,1,0,2,1,0,1,3,2,1,2,1};
    int res = [self trap:height size:(int)(sizeof(height) / sizeof(height[0]))];
    DLog(@"res:%d", res);
    int res2 = [self trap_1:height size:(int)(sizeof(height) / sizeof(height[0]))];
    DLog(@"res2:%d", res2);
}
@end
