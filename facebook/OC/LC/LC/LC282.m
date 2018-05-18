//
//  LC282.m
//  LC
//
//  Created by Admin  on 4/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC282.h"

@implementation LC282

- (NSMutableArray *)addOperators:(NSString *)num target:(int)target {
    NSMutableArray *res = [NSMutableArray array];
    [self dfs:res num:num str:@"" pos:0 target:target sum:0 prev:0];
//    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"obj:%@", obj);
//    }];
    return res;
}

- (void)dfs:(NSMutableArray *)res num:(NSString *)num str:(NSString *)str pos:(int)pos target:(int)target sum:(NSInteger)sum prev:(NSInteger)prev{
    if(pos == num.length && target == sum) {
        DLog(@"str:%@", str);
        DLog(@"sum:%ld", sum);
        [res addObject:str];
        return;
    }
    
    for(int i = pos; i < num.length; i++) {
        if(i != pos && [num characterAtIndex:pos] == '0') {
            DLog(@"continue:%@", [num substringWithRange:NSMakeRange(pos, i + 1 - pos)]);
            continue;
        }
        NSString *subStr = [num substringWithRange:NSMakeRange(pos, i + 1 - pos)];
        NSInteger strNum = [subStr integerValue];
        if(pos == 0) {
            [self dfs:res num:num str:subStr pos:i + 1 target:target sum:sum + strNum prev:strNum];
        } else {
            [self dfs:res num:num str:[NSString stringWithFormat:@"%@+%@", str, subStr] pos:i + 1 target:target sum:sum + strNum prev:strNum];
            [self dfs:res num:num str:[NSString stringWithFormat:@"%@-%@", str, subStr] pos:i + 1 target:target sum:sum - strNum prev:-strNum];
            [self dfs:res num:num str:[NSString stringWithFormat:@"%@*%@", str, subStr] pos:i + 1 target:target sum:sum - prev + prev * strNum prev:prev * strNum];
        }
    }
    
//    for(int i = 0; i < op.count; i++) {
//        if(pos == 0) {
//            [self dfs:res num:num str:[NSString stringWithFormat:@"%c%@", [num characterAtIndex:pos], [op objectAtIndex:i]] pos:pos + 1 op:op];
//        } else if (pos + 1 == num.length) {
//            [self dfs:res num:num str:[NSString stringWithFormat:@"%@%c%@", str, [num characterAtIndex:pos], [op objectAtIndex:i]] pos:pos + 1 op:op];
//        } else {
//            [self dfs:res num:num str:[NSString stringWithFormat:@"%@%c%@",str, [num characterAtIndex:pos], [op objectAtIndex:i]] pos:pos + 1 op:op];
//        }
//    }
}



- (void)test {
    NSString *test1 = @"232";
    int target = 8;
    [self addOperators:test1 target:target];
    test1 = @"105";
    target = 5;
    [self addOperators:test1 target:target];
}
@end
