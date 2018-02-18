//
//  LC78.m
//  LC
//
//  Created by ULS on 2/17/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC78.h"

@interface LC78()

- (NSArray *)subsets:(NSArray *)nums;
@end

@implementation LC78

- (NSArray *)subsets:(NSArray *)nums {
    if(nums.count == 0) {
        return [NSArray array];
    }
    
    NSArray * sortedSums = [nums sortedArrayUsingComparator:^NSComparisonResult(NSNumber*  _Nonnull obj1, NSNumber*  _Nonnull obj2) {
        return [obj1 integerValue] - [obj2 integerValue];
        //        NSInteger num1 = [obj1 integerValue];
        //        NSInteger num2 = [obj2 integerValue];
        //
        //        if (num1 < num2)
        //            return NSOrderedAscending;
        //        else if (num1 > num2)
        //            return NSOrderedDescending;
        //
        //        return NSOrderedSame;
    }];
    DLog(@"nums:%@", sortedSums);
    NSMutableArray *res = [NSMutableArray array];
    NSMutableArray *list = [NSMutableArray array];
    [self dfs:res list:list idx:0 nums:nums];
    
    return [res copy];
}

- (void)dfs:(NSMutableArray *)res list:(NSMutableArray *)list idx:(NSInteger)idx nums:(NSArray *)nums {
    [res addObject:[list copy]];
    
    for(NSInteger i = idx; i < nums.count; i++) {
        [list addObject:[nums objectAtIndex:i]];
        [self dfs:res list:list idx:i + 1 nums:nums];
        [list removeLastObject];
    }
}

- (void)test {
    NSArray *nums = @[@3, @2, @1];
    NSArray * res = [self subsets:nums];
    [res enumerateObjectsUsingBlock:^(NSArray *  _Nonnull list, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"%@",list);
    }];
}
@end
