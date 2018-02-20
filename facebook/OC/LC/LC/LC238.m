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
    int product = 1;
    for(int i = 0; i < numsSize; i++) {
        returnSize[i] = product;
        product *= nums[i];
    }
    
    product = 1;
    for(int i = 0; i < 4; i++) {
        DLog(@"%d", returnSize[i]);
    }
    
    for(int i = numsSize - 1; i >= 0; i--) {
        returnSize[i] = product * returnSize[i];
        product *= nums[i];
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
