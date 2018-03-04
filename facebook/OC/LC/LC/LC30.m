//
//  LC30.m
//  LC
//
//  Created by ULS on 3/3/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC30.h"

@interface LC30()

- (NSArray *)findSubstring:(NSString *)s words:(NSArray <NSString *> *)words;

@end

@implementation LC30

- (NSArray *)findSubstring:(NSString *)s words:(NSArray <NSString *> *)words {
    if(words.count == 0 || s.length == 0) {
        return [NSArray array];
    }
    
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    [words enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([map objectForKey:obj] != NULL) {
            int count = [[map objectForKey:obj] intValue];
            [map setObject:@(count + 1) forKey:obj];
        } else {
            [map setObject:@(1) forKey:obj];
        }
    }];
    
    NSMutableArray *res = [NSMutableArray array];
    int wordLen = (int)[words objectAtIndex:0].length;
    NSMutableDictionary *current = [[NSMutableDictionary alloc] init];
    for(int i = 0; i < wordLen; i++) {
        int count = 0;
        int index = i;
        for(int j = i; j <= s.length - wordLen; j += wordLen) {
            NSString *curWord = [s substringWithRange:NSMakeRange(j, wordLen)];
            if([map objectForKey:curWord] == NULL) {
                [current removeAllObjects];
                count = 0;
                index = j + wordLen;
            } else {
                if([current objectForKey:curWord] == NULL) {
                    [current setObject:@(1) forKey:curWord];
                } else {
                    int count = [[current objectForKey:curWord] intValue];
                    [current setObject:@(count + 1) forKey:curWord];
                }
                if([[current objectForKey:curWord] intValue] <= [[map objectForKey:curWord] intValue]) {
                    count++;
                } else {
                    while([[current objectForKey:curWord] intValue] > [[map objectForKey:curWord] intValue]) {
                        NSString *temp = [s substringWithRange:NSMakeRange(index, wordLen)];
                        int count = [[current objectForKey:temp] intValue];
                        [current setObject:@(count - 1) forKey:temp];
                        index = index + wordLen;
                    }
                }
                
                if(count == words.count) {
                    [res addObject:@(index)];
                    NSString *temp = [s substringWithRange:NSMakeRange(index, wordLen)];
                    int count = [[current objectForKey:temp] intValue];
                    [current setObject:@(count - 1) forKey:temp];
                    index = index + wordLen;
                    count--;
                }
            }
        }
    }
    return res;
}

- (void)test {
    NSString *s = @"barfoothefoobarman";
    NSArray *words = @[@"foo", @"bar"];
    NSArray *res = [self findSubstring:s words:words];
    [res enumerateObjectsUsingBlock:^(NSNumber*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"%d", [obj intValue]);
    }];
}

@end
