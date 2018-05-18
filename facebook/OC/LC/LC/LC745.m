//
//  LC745.m
//  LC
//
//  Created by Admin  on 4/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC745.h"
#import "IndexTrie.h"

@interface LC745()

@property(strong, nonatomic) IndexTrie* trie;
@property(strong, nonatomic) NSMutableDictionary *dict;

@end

@implementation LC745

- (instancetype)initWithWords:(char **)words len:(int)len {
    if(self = [super init]) {
//        [self initWithTrie:words len:len];
        [self initWithMap:words len:len];
    }
    return self;
}

- (void)initWithMap:(char **)words len:(int)len {
    _dict = [[NSMutableDictionary alloc] init];
    for(int i = 0; i < len; i++) {
        NSString *key = [NSString stringWithFormat:@"%s", words[i]];
        NSMutableArray *prefixes = [NSMutableArray array];
        NSMutableArray *suffixes = [NSMutableArray array];
        [self initArray:prefixes len:key.length + 1];
        [self initArray:suffixes len:key.length + 1];
        for(int i = 0; i < key.length; i++) {
            prefixes[i + 1] = [NSString stringWithFormat:@"%@%c", prefixes[i], [key characterAtIndex:i]];
            suffixes[i + 1] = [NSString stringWithFormat:@"%c%@", [key characterAtIndex:key.length - i - 1], suffixes[i]];
        }
        
        __block NSMutableDictionary *temp = [NSMutableDictionary dictionary];
        [prefixes enumerateObjectsUsingBlock:^(id  _Nonnull preObj, NSUInteger idx, BOOL * _Nonnull stop) {
            [suffixes enumerateObjectsUsingBlock:^(id  _Nonnull sufObj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSString *key = [NSString stringWithFormat:@"%@_%@", preObj, sufObj];
                [temp setObject:@(i) forKey:key];
            }];
        }];
        _dict = [temp mutableCopy];
        DLog(@"_dict:%@", _dict);
    }
}

- (void)initArray:(NSMutableArray *)array len:(NSInteger)len{
    for(int i = 0; i < len; i++) {
        [array addObject:@""];
    }
}

- (void)initWithTrie:(char **)words len:(int)len {
    _trie = [[IndexTrie alloc] init];
    for(int i = 0; i < len; i++) {
        NSString* key = [NSString stringWithFormat:@"{%s",words[i]];
        DLog(@"key:%@", key);
        [_trie insert:key index:i];
        NSInteger len = strlen(words[i]);
        for(int j = 0; j < len; j++) {
            key = [NSString stringWithFormat:@"%c%@", words[i][len - j - 1], key];
            DLog(@"key:%@", key);
            [_trie insert:key index:i];
        }
    }
}

- (int)f:(NSString *)prefix suffix:(NSString *)suffix {
    NSString *key = [NSString stringWithFormat:@"%@{%@", suffix, prefix];
    DLog(@"key:%@", key);
    return [_trie startWith:key];
}

- (int)f_1:(NSString *)prefix suffix:(NSString *)suffix {
    NSString *key = [NSString stringWithFormat:@"%@_%@", prefix, suffix];
    DLog(@"key:%@", key);
    NSNumber *index = [_dict objectForKey:key];
    if(index != nil) {
        return [index intValue];
    }
    return -1;
}

- (void)test {
//    int res = [self f:@"a" suffix:@"e"];
//    DLog(@"res:%d", res);
    int res = [self f_1:@"a" suffix:@"e"];
    DLog(@"res:%d", res);
}

@end
