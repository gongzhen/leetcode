//
//  LC301.m
//  LC
//
//  Created by ULS on 2/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC301.h"
#import "NSMutableArray+Queue.h"

@interface LC301()

@property (nonatomic, strong) NSMutableArray *res;
@property (nonatomic, strong) NSMutableSet *set;

- (NSArray *)removeInvalidParentheses:(NSString *)s;
- (NSArray *)removeInvalidParenthesesDFS:(NSString *)s;

@end

@implementation LC301

- (NSArray *)removeInvalidParenthesesDFS:(NSString *)s {
    // remove from left side
    self.set = [NSMutableSet set];
    self.res = [NSMutableArray array];
    [self removeFromLeft:s];
    DLog(@"%@", self.res);
    return [self.res copy];
}

- (void)removeFromLeft:(NSString *)str {
    int count = 0;
    /// (())
    for(int i = (int)[str length] - 1; i >= 0; i--) {
        if([str characterAtIndex:i] == ')') {
            count++;
        } else if ([str characterAtIndex:i] == '(') {
            count--;
        }
        
        if(count < 0) {
            for(int j = (int)[str length] - 1; j >= i; j--) {
                if([str characterAtIndex:j] != '(') {
                    continue ;
                }
                NSString *substring = [[str substringToIndex:j] stringByAppendingString:[str substringFromIndex:j + 1]];
                if([self.set containsObject:substring]) {
                    continue;
                }
                [self.set addObject:substring];
                [self removeFromLeft:substring];
            }
            return;
        }
    }
    if(count == 0) {
        [self.res addObject:str];
        return;
    }
    [self removeFromRight:str];
}

- (void)removeFromRight:(NSString *)str {
    int count = 0;
    for(int i = 0; i < [str length]; i++) {
        if([str characterAtIndex:i] == '(') {
            count++;
        } else if ([str characterAtIndex:i] == ')') {
            count--;
        }
        if(count < 0) {
            for(int j = 0; j <= i; j++) {
                if([str characterAtIndex:j] != ')') {
                    continue;
                }
                NSString *substring = [[str substringToIndex:j] stringByAppendingString:[str substringFromIndex:j + 1]];
                if([self.set containsObject:substring]) {
                    continue;
                }
                [self.set addObject:substring];
                [self removeFromRight:substring];
            }
            return;
        }
    }
    if(count == 0) {
        [self.res addObject:str];
        return;
    }
}


- (NSArray *)removeInvalidParentheses:(NSString *)s {
    NSMutableArray* res = [NSMutableArray array];
    NSMutableSet* set = [NSMutableSet set];
    
    if(s == nil) {
        return [res copy];
    }
    
    NSMutableArray *pq = [NSMutableArray array];
    [pq offer:s];
    
    BOOL isFound = false;
    while(pq.count != 0) {
        s = [pq poll];
        DLog(@"s:%@",s);
        if([self isValid:s]) {
            [res addObject:s];
            isFound = true;
        }
        
        if(isFound == true) {
            continue;
        }
        
        for(int i = 0; i < [s length]; i++) {
            if([s characterAtIndex:i] == '(' || [s characterAtIndex:i] == ')') {
                NSString *substring = [[s substringToIndex:i] stringByAppendingString:[s substringFromIndex:i + 1]];
                if([set containsObject:substring] == false) {
                    [set addObject:substring];
                    [pq offer:substring];
                }
            }
        }
    }
    DLog(@"%@", res);
    return res;
}

- (BOOL)isValid:(NSString *)str {
    int count = 0;
    int i = 0;
    while(i < [str length]) {
        if([str characterAtIndex:i] == '(') {
            count++;
        } else if ([str characterAtIndex:i] == ')') {
            count--;
        }
        if(count < 0) {
            return false;
        }
        i++;
    }
    return count == 0;
}

- (void)test {
    NSString *str =@"(a)())()";
//    [self removeInvalidParentheses:str];
    [self removeInvalidParenthesesDFS:str];
}

@end
