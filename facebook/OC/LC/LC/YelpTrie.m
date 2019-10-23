//
//  YelpTrie.m
//  LC
//
//  Created by Zhen Gong on 10/7/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "YelpTrie.h"
#import "TrieNodeWithMap.h"

@interface YelpTrie()

@property (strong, nonatomic) TrieNodeWithMap *root;
@property (strong, nonatomic) NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *map;

@end

@implementation YelpTrie

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.root = [[TrieNodeWithMap alloc] init];
        self.map = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)insert:(NSString *)word
{
    NSArray<NSString *> *wordArray = [word componentsSeparatedByString:@" "];
    for(NSString *value in wordArray) {
        NSString *lowerCaseWord = [value lowercaseString];
        NSMutableArray<NSString *> *array = [self.map objectForKey:lowerCaseWord];
        if (array == nil) {
            array = [NSMutableArray array];
        }
        [array addObject:word];
        [self.map setObject:array forKey:lowerCaseWord];
        [self _insert:lowerCaseWord];
    }
}

- (void)_insert:(NSString *)word
{
    // ABCd -> abcd : ABCd
    // save abcd to trie. map.get(abcd) = ABCd
    if (self.root == nil) {
        return;
    }
    
    TrieNodeWithMap *ptr = self.root;
    for(NSUInteger i = 0; i < word.length; i++) {
        char c = [word characterAtIndex:i];
        NSString *key = [NSString stringWithFormat:@"%c", c];
        TrieNodeWithMap *node = [ptr.children objectForKey:key];
        if(node == nil) {
            node = [[TrieNodeWithMap alloc] init];
            [ptr.children setObject:node forKey:key];
        }
        ptr = node;
    }
    ptr.isWord = true;
}

- (NSArray<NSString *> *)searchPrefix:(NSString *)word
{
    if (self.root == nil) {
        return nil;
    }
    NSString *lowerCaseWord = [word lowercaseString];
    TrieNodeWithMap *ptr = self.root;
    for(NSUInteger i = 0; i < lowerCaseWord.length; i++) {
        char c = [lowerCaseWord characterAtIndex:i];
        NSString *key = [NSString stringWithFormat:@"%c", c];
        TrieNodeWithMap *node = [ptr.children objectForKey:key];
        if(node == nil) {
            return nil;
        }
        ptr = node;
    }
    
    NSMutableArray<NSString *> *res = [NSMutableArray array];
    [self dfs:ptr res:res word:word];
    return res;
}

- (void)dfs:(TrieNodeWithMap *)node res:(NSMutableArray *)res word:(NSString *)word {
    if (node == nil) {
        return;
    }
    if (node.isWord == true) {
        NSArray<NSString *> *array = [self.map objectForKey:word];
        [array enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [res addObject:obj];
        }];
    }
    
    for (NSString *key in node.children.allKeys) {
        TrieNodeWithMap *value = [node.children objectForKey:key];
        if (value != nil) {
            NSString* appendWord = [NSString stringWithFormat:@"%@%@", word, key];
            [self dfs:value res:res word:appendWord];
        }
    }
}

- (NSArray<NSString *> *)search:(NSString *)word {
    if (self.root == nil) {
        return nil;
    }
    NSString *lowerCaseWord = [word lowercaseString];
    NSMutableArray<NSString *> *res = [NSMutableArray array];
    [self _search:self.root word:@"" target:lowerCaseWord res:res idx:0];
    return res;
}

- (void)_search:(TrieNodeWithMap *)node word:(NSString *)word target:(NSString *)target res:(NSMutableArray *)res idx:(NSUInteger)idx{
    if (node == nil) {
        return;
    }
    if (node.isWord == true && idx == target.length) {
        NSArray<NSString *> *wordList = [self.map objectForKey:word];
        [res addObjectsFromArray:wordList];
    }
    
    TrieNodeWithMap *ptr = node;
    for(NSString *key in ptr.children.allKeys) {
        NSString *append = [NSString stringWithFormat:@"%@%@", word, key];
        if (idx < target.length) {
            NSString *match = [NSString stringWithFormat:@"%c", [target characterAtIndex:idx]];
            if ([key isEqualToString:match]) {
                TrieNodeWithMap *value = [ptr.children objectForKey:key];
                [self _search:value word:append target:target res:res idx:idx + 1];
            } else {
                if (idx == 0) {
                    TrieNodeWithMap *value = [ptr.children objectForKey:key];
                    [self _search:value word:append target:target res:res idx:0];
                }
            }
        } else if (idx == target.length) {
            TrieNodeWithMap *value = [ptr.children objectForKey:key];
            [self _search:value word:append target:target res:res idx:idx];
        }
    }
}

@end
