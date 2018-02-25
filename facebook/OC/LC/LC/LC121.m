//
//  LC121.m
//  LC
//
//  Created by ULS on 2/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC121.h"

@interface LC121()

- (NSInteger)maxProfit:(NSArray *)prices;
- (int)maxProfitDP:(NSArray *)prices;

@end

@implementation LC121

- (NSInteger)maxProfit:(NSArray *)prices {
    NSInteger min = [prices[0] integerValue];
    NSInteger max = 0;
    for(NSInteger i = 0; i < [prices count]; i++) {
        min = MIN(min, [prices[i] integerValue]);
        max = MAX(max, [prices[i] integerValue] - min);
    }
    return max;
}

- (int)maxProfitDP:(NSArray *)prices {
    if(prices.count == 0) {
        return 0;
    }
    int max = 0;
    int *dp = (int *)calloc(prices.count, sizeof(int));
    dp[0] = 0;
    for(int i = 1; i < prices.count; i++) {
        dp[i] = MAX([[prices objectAtIndex:i] intValue] - [[prices objectAtIndex:i-1] intValue] + dp[i - 1], 0);
        max = MAX(max, dp[i]);
        DLog(@"i:%d dp[%d]:%d, max:%d", i, i, dp[i], max);
    }
    return max;
}

- (void)test {
    NSArray *prices = @[@7, @1, @5, @3, @6, @4];
    /// DLog(@"max:%ld", [self maxProfit:prices]);
    DLog(@"max:%d", [self maxProfitDP:prices]);
}

@end
