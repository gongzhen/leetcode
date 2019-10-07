//
//  LC1.m
//  LC
//
//  Created by ULS on 2/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC1.h"
#import "PrintHelper.h"

@interface LC1()
{
    NSMutableDictionary<NSNumber *, NSNumber *> *_dict;
}

- (int *)twoSum:(int *)nums numsSize:(int)numsSize target:(int)target;
- (nullable NSArray *)twoSum:(NSArray *)nums target:(int)target;

@end

@implementation LC1

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dict = [NSMutableDictionary dictionary];
    }
    return self;
}

- (NSArray *)twoSum:(NSArray *)nums target:(int)target {
    NSArray *sortedArray = [nums sortedArrayUsingSelector:@selector(compare:)];
    [PrintHelper printIntArray:sortedArray];
    int i = 0;
    int j = (int)sortedArray.count - 1;
    while (i < j) {
        int sum = [sortedArray[i] intValue] + [sortedArray[j] intValue];
        if (sum == target) {
            NSArray *result = [NSArray arrayWithObjects:[NSNumber numberWithInt:i], [NSNumber numberWithInt:j], nil];
            return result;
        } else if (sum > target) {
            --j;
        } else {
            ++i;
        }
    }
    return nil;
}

- (int *)twoSum:(int *)nums numsSize:(int)numsSize target:(int)target {
    if(numsSize == 0) {
        return NULL;
    }
    static int res[2];
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    for(int i = 0; i < numsSize; i++) {
        if([map objectForKey:@(target - nums[i])]) {
            res[0] = nums[i];
            int idx = [[map objectForKey:@(target - nums[i])] intValue];
            res[1] = nums[idx];
            return res;
        } else {
            [map setObject:@(i) forKey:@(nums[i])];
        }
    }
    return NULL;
}

- (void)store:(int)input {
    if (_dict == nil) {
        return;
    }
    NSNumber *count = [_dict objectForKey:@(input)];
    if (count == nil) {
        [_dict setObject:@(1) forKey:@(input)];
    } else {
        int countInt = [count intValue];
        [_dict setObject:@(countInt + 1) forKey:@(input)];
    }
}

- (BOOL)twoSumCheckForSum:(int)sum {
    __block BOOL result = NO;
    [_dict enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull num, NSNumber * _Nonnull count, BOOL * _Nonnull stop) {
        int numInt = [num intValue];
        if ([self->_dict objectForKey:@(sum - numInt)]) {
            int countInt = [[self->_dict objectForKey:@(sum - numInt)] intValue];
            if (countInt == 1 && (sum - numInt) * 2 == sum) {
                result = NO;                
            } else {
                result = YES;
            }
        }
    }];
    return result;
}

- (void)test {
    int nums[6] = {2, 7, 11, 15, 8, 99};
    int *res = [self twoSum:nums numsSize:6 target:107];
    for(int i = 0; i < 2; i++) {
        DLog(@"%d", *(res + i));
    }
    
    NSArray *array = [NSArray arrayWithObjects:@2, @7, @11, @15, nil];
    NSArray *result = [self twoSum:array target:9];
    [PrintHelper printIntArray:result];
    
    
    // test 2
    [self store:1];
    [self store:-2];
    [self store:3];
    [self store:6];
    BOOL val = [self twoSumCheckForSum: 4];
    [PrintHelper printBool:val];
    val = [self twoSumCheckForSum: -1];
    [PrintHelper printBool:val];
    val = [self twoSumCheckForSum: 9];
    [PrintHelper printBool:val];
    
    val = [self twoSumCheckForSum: 10];
    [PrintHelper printBool:val];
    val = [self twoSumCheckForSum: 5];
    [PrintHelper printBool:val];
    val = [self twoSumCheckForSum: 0];
    [PrintHelper printBool:val];
}

@end
