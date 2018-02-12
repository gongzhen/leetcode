//
//  LC17.m
//  LC
//
//  Created by ULS on 2/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC17.h"

@interface LC17()

- (NSArray *)letterCombinations:(NSString *)digits;

@end

@implementation LC17

- (NSArray *)letterCombinations:(NSString *)digits {
    NSMutableArray *res = [NSMutableArray array];
    
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    [map setObject:@"abc" forKey:@2];
    [map setObject:@"def" forKey:@3];
    [map setObject:@"ghi" forKey:@4];
    [map setObject:@"jkl" forKey:@5];
    [map setObject:@"mno" forKey:@6];
    [map setObject:@"pqrs" forKey:@7];
    [map setObject:@"tuv" forKey:@8];
    [map setObject:@"wxyz" forKey:@9];
    NSString *str = [NSString string];
    
    // dfs(digits, map, str, 0, res);
    [self dfs:digits map:map str:str idx:0 res:res];
    DLog(@"self.res:%@", res);
    return [res copy];
}

- (void)dfs:(NSString *)digits map:(NSMutableDictionary *)map str:(NSString *)str idx:(NSInteger)idx res:(NSMutableArray *)res{
    if(str.length == digits.length) {
        [res addObject:str];
        return;
    }
    
    //@"23"
    char c = [digits characterAtIndex:idx]; // '2'
    NSInteger digitNumber = c - '0'; // 2
    NSString* digitString = [map objectForKey:[NSNumber numberWithInteger:digitNumber]]; /// abc /// def
    for(NSInteger i = 0; i < [digitString length]; i++) {
        /// str: "a" -> ad, ae af
        NSString *combinedStr = [NSString stringWithFormat:@"%@%@", str, [digitString substringWithRange:NSMakeRange(i, 1)]];
        [self dfs:digits map:map str:combinedStr idx:idx + 1 res:res];                 /// str: "b" ->
    }
}

- (void)test {
    NSString *str = @"23";
    [self letterCombinations:str];
}

@end
