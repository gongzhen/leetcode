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
    NSArray *_radix;
}

- (NSString *)numberToWords:(NSInteger) num;

@end

@implementation LC273

- (instancetype)init {
    if(self = [super init]) {
        /// @"" is just a placeholder for num with less than 20
        _LESSTHAN20 = @[@"", @"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight", @"Nine", @"Ten", @"Eleven",
                        @"Twelve", @"Thirteen", @"Fourteen", @"Fifteen", @"Sixteen", @"Seventeen", @"Eighteen", @"Nineteen"];
        _TENS = @[@"Twenty", @"Thirty", @"Forty", @"Fifty", @"Sixty", @"Seventy", @"Eighty", @"Ninety"];
        _THOUSANDS = @[@"Billion", @"Million", @"Thousand", @"Hundred"];
        _radix = @[@1000000000, @1000000, @1000, @100];
    }
    return self;
}

- (NSString *)numberToWords:(NSInteger) num {
    if(num == 0) {
        return @"Zero";
    }
    
    NSInteger count = 0;
    NSMutableString *res = [NSMutableString string];
    for(NSUInteger i = 0; i < [_radix count]; i++) {
        count = num / [[_radix objectAtIndex:i] integerValue];
        if(count == 0) {
            continue;
        }
        
        [res appendString:[self numberToWords:count]];
        [res appendString:@" "];
        [res appendString:[_THOUSANDS objectAtIndex:i]];
        [res appendString:@" "];
        num %= [[_radix objectAtIndex:i] integerValue];
    }
    /// all the number will be less than 99
    if(num < 20) {
        [res appendString:[_LESSTHAN20 objectAtIndex:num]];
    } else {
        [res appendString:[_TENS objectAtIndex:(num / 10 - 2)]];
        [res appendString:@" "];
        [res appendString:[_LESSTHAN20 objectAtIndex:num % 10]];
    }
    [res stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    return [res copy];
}

- (void)test {
    NSInteger num = 1000000000;
    DLog(@"%@", [self numberToWords:num]);
    num = 1001000000;
    DLog(@"%@", [self numberToWords:num]);
    num = 123;
    DLog(@"%@", [self numberToWords:num]);
}

@end
