//
//  LC179.m
//  LC
//
//  Created by Zhen Gong on 5/13/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC179.h"

@implementation LC179

- (NSString *)largestNumber:(NSArray *)nums {
    if(nums.count == 0) {
        return @"";
    }
    
    /// 1, 3, 5, 33, 44
    /// 3, 1
    /// 5, 3, 1
    /// 5, 33, 3, 1
    /// 5, 44, 33, 3, 1
    
    /// 0, 0
    /// 0
    
    /// []
    /// ""
    
    /// 999999999999, 999999999, 9999999
    
    NSArray *newArray = [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *s1 = [NSString stringWithFormat:@"%@", obj1];
        NSString *s2 = [NSString stringWithFormat:@"%@", obj2];
        NSString *ss1 = [NSString stringWithFormat:@"%@%@", s1, s2];
        NSString *ss2 = [NSString stringWithFormat:@"%@%@", s2, s1];
        return [ss2 compare:ss1];
    }];
    
    __block BOOL isLeadingZero = YES;
    __block NSMutableString *res = [NSMutableString string];
    [newArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber *num = (NSNumber *)obj;
        if([num integerValue] == 0 && isLeadingZero == YES) {
            
        } else if ([num integerValue] != 0) {
            isLeadingZero = NO;
            [res appendString:[NSString stringWithFormat:@"%@", num]];
        }
    }];
    return res.length == 0 ? @"0" : res;
}

- (void)test {
    DLog(@"res:%@", [self largestNumber:@[@1, @3, @5, @33, @44]]);
    DLog(@"res:%@", [self largestNumber:@[@999999999999, @99999999999, @5]]);
    DLog(@"res:%@", [self largestNumber:@[@0, @0, @12, @0]]);
    DLog(@"res:%@", [self largestNumber:@[]]);
}

@end
