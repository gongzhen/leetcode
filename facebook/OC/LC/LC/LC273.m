//
//  LC273.m
//  LC
//
//  Created by ULS on 2/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC273.h"

@interface LC273() {
    NSArray *_LESSTHAN20;
    NSArray *_TENS;
    NSArray *_THOUSANDS;
    NSArray *_THOUSANDS_1;
    NSArray *_radix;
}

- (NSString *)numberToWords:(NSInteger) num;
- (NSString *)numberToWords_1:(NSInteger) num;

@end

@implementation LC273

- (instancetype)init {
    if(self = [super init]) {
        /// @"" is just a placeholder for num with less than 20
        _LESSTHAN20 = @[@"", @"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight", @"Nine", @"Ten", @"Eleven",
                        @"Twelve", @"Thirteen", @"Fourteen", @"Fifteen", @"Sixteen", @"Seventeen", @"Eighteen", @"Nineteen"];
        _TENS = @[@"Twenty", @"Thirty", @"Forty", @"Fifty", @"Sixty", @"Seventy", @"Eighty", @"Ninety"];
        _THOUSANDS = @[@"Billion", @"Million", @"Thousand", @"Hundred"];
        _THOUSANDS_1 = @[@"", @"Thousand", @"Million", @"Billion"];
        ///      Billion(9 * 0's)   Million(6 * 0's)   Thousand (3 * 0's)  Hundred
        _radix = @[@1000000000,     @1000000,           @1000,               @100];
    }
    return self;
}

- (NSString *)numberToWords_1:(NSInteger) num {
    if(num == 0) {
        return @"Zero";
    }
    
    NSString *res = [NSString string];
    int i = 0;
    while (num > 0) {
        if(num % 1000 != 0) {
            NSString *res1 = [self dfs:num % 1000];
            DLog(@"res1:%@", res1);
            NSString *res2 = [res1 stringByAppendingString:_THOUSANDS_1[i]];
            DLog(@"res2:%@", res2);
            res = [res2 stringByAppendingFormat:@" %@", res];
            DLog(@"res:%@", res);
        }
        i++;
        num /= 1000;
    }
    
    [res stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    DLog(@"res:%@", res);
    return [res copy];
}

- (NSString *)dfs:(NSInteger) num {
    DLog(@"num:%ld", num);
    if(num == 0) {
        return [@"" mutableCopy];
    }
    
    if(num < 20) {
        return  [_LESSTHAN20[num % 20] stringByAppendingString:@" "];
    } else if (num < 100) {
        return [NSString stringWithFormat:@"%@ %@", _TENS[num / 10], [self dfs:num % 10]];
    }
    return [NSString stringWithFormat:@"%@ Hundred %@", _LESSTHAN20[num / 100], [self dfs:num % 100]];
}

- (NSString *)numberToWords:(NSInteger) num {
    /// if num == 0 then return ZERO.
    DLog(@"num:%ld", num);
    if(num == 0) {
        return @"Zero";
    }
    
    NSInteger count = 0;
    NSMutableString *res = [NSMutableString string];
    
    /// part 1: one billion, million, thoudsand
    for(NSUInteger i = 0; i < [_radix count]; i++) {
        /// Cannot handle 1 --- 99
        /// 1,000,000,000   1,000,000,  1,000
        count = num / [[_radix objectAtIndex:i] integerValue];
        if(count == 0) {
            continue;
        }
//        DLog(@"count:%ld", count);
        [res appendString:[self numberToWords:count]];
//        DLog(@"res:%@", res);
        [res appendString:@" "];
//        DLog(@"res:%@", res);
        [res appendString:[_THOUSANDS objectAtIndex:i]];
//        DLog(@"res:%@", res);
        [res appendString:@" "];
//        DLog(@"res:%@", res);
        num %= [[_radix objectAtIndex:i] integerValue];
//        DLog(@"num:%ld", num);/// deduct 1000 each time.
    }
    /// part 2: handle all the number that are less than 20
    if(num < 20) { /// 1, 2, 3, 4, .... 19
        [res appendString:[_LESSTHAN20 objectAtIndex:num]];
    } else {
        /// 20 ... 99
        [res appendString:[_TENS objectAtIndex:(num / 10 - 2)]];
        [res appendString:@" "];
        [res appendString:[_LESSTHAN20 objectAtIndex:num % 10]];
    }
    NSString *trimed = [res stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    DLog(@"res:%@|||", trimed);
    return trimed;
}

- (void)test {
    NSInteger num = 19900900909; /// 19, 900, 900, 909,
    DLog(@"%@", [self numberToWords:num]);
//    DLog(@"%@", [self numberToWords_1:num]);
//    num = 1001000000;
//    DLog(@"%@", [self numberToWords:num]);
//    DLog(@"%@", [self numberToWords_1:num]);
//    num = 123;
//    DLog(@"%@", [self numberToWords:num]);
//    DLog(@"%@", [self numberToWords_1:num]);
}

@end
