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

- (void)test {
    NSArray *prices = @[@7, @1, @5, @3, @6, @4];
    DLog(@"max:%ld", [self maxProfit:prices]);
}

@end
