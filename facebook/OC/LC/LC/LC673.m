//
//  LC673.m
//  LC
//
//  Created by Admin  on 4/29/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC673.h"

@implementation LC673

- (int)findNumberOfLIS:(int*)nums numSize:(int)numsSize {
    if(numsSize == 0){
        return 0;
    }
    
    int res = 0;
    int maxLen = 0;
    int* len = (int *)calloc(numsSize, sizeof(int));
    int* count = (int *)calloc(numsSize, sizeof(int));
    
    for(int i = 0; i < numsSize; i++) {
        len[i] = 1;
        count[i] = 1;
        for(int j = 0; j < i; j++) {
            if(nums[i] > nums[j]) {
                if(len[i] == len[j] + 1) {
                    count[i] += count[j];
                }
                if(len[i] < len[j] + 1) {
                    len[i] = len[j] + 1;
                    count[i] = count[j];
                }
            }
        }
        
        if(maxLen == len[i]) {
            res += count[i];
        }
        
        if(maxLen)
    }
}

- (void)test {
    int nums[] = {1, 3, 5, 4, 7};
    int *ptr = nums;
    [self findNumberOfLIS:ptr numSize:5];
}
@end
