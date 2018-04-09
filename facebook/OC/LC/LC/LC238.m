//
//  LC238.m
//  LC
//
//  Created by ULS on 2/19/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC238.h"

@interface LC238()

- (int *)productExceptSelf:(int *)nums numsSize:(int)numsSize returnSize:(int *)returnSize;

@end

@implementation LC238

- (int *)productExceptSelf:(int *)nums numsSize:(int)numsSize returnSize:(int *)returnSize;
{
    returnSize[0] = 1;
    ///      1,   2,   3,   4
    ///   1, 1*1, 1*2  2*3
    /// left side of 1 has no number, so only 1.
    
    for(int i = 1; i < numsSize; i++) {
        /// Collect product from left side.
        returnSize[i] = nums[i - 1] * returnSize[i - 1];
    }
    
    for(int i = 0; i < 4; i++) {
        /// 1, 1, 2, 6
        DLog(@"%d", returnSize[i]);
    }
    
    int right = 1; /// right side of 4 has no number, so only 1
    /// 1,      2,      3,              4
    /// 1       1       2               6
    ///                                 1 * 6 = 6, right = 1 * 4 = 4
    /// 1       1      2*right(4)=8 right=right*3=12
    /// 1       1*12=12 right=right*2=12
    /// 1*24=24
    for(int i = numsSize - 1; i >= 0; i--) {
        returnSize[i] = right * returnSize[i];
        right *= nums[i];
    }
 
    return returnSize;
}
- (void)test {
    int nums[4] = {1, 2, 3, 4};
    int* returnSize = calloc(4, sizeof(int *));
    returnSize = [self productExceptSelf:nums numsSize:4 returnSize:returnSize];
    for(int i = 0; i < 4; i++) {
        DLog(@"%d", returnSize[i]);
    }
    free(returnSize);
}

@end
