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

@end

@implementation LC745

- (instancetype)initWithWords:(char **)words len:(int)len {
    if(self = [super init]) {
        _trie = [[IndexTrie alloc] init];
        for(int i = 0; i < len; i++) {
            NSString* key = [NSString stringWithFormat:@"{%s",words[i]];
            [_trie insert:key index:i];
            NSInteger len = strlen(words[i]);
            for(int j = 0; j < len; j++) {
                key = [NSString stringWithFormat:@"%c%@", words[i][len - j - 1], key];
                DLog(@"key:%@", key);
                [_trie insert:key index:i];
            }
        }
    }
    return self;
}

- (int)f:(NSString *)prefix suffix:(NSString *)suffix {
    NSString *key = [NSString stringWithFormat:@"%@{%@", suffix, prefix];
    DLog(@"key:%@", key);
    return [_trie startWith:key];
}

- (void)test {
    int res = [self f:@"a" suffix:@"e"];
    DLog(@"res:%d", res);
}

@end
