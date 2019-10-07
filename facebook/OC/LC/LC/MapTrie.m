//
//  MapTrie.m
//  LC
//
//  Created by Zhen Gong on 10/7/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "MapTrie.h"
#import "TrieNodeWithMap.h"

@interface MapTrie()

@property (strong, nonatomic) TrieNodeWithMap *root;

@end

@implementation MapTrie

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.root = [[TrieNodeWithMap alloc] init];
    }
    return self;
}

- (void)insert:(NSString *)word
{
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

- (BOOL)search:(NSString *)word
{
    if (self.root == nil) {
        return NO;
    }
    TrieNodeWithMap *ptr = self.root;
    for(NSUInteger i = 0; i < word.length; i++) {
        char c = [word characterAtIndex:i];
        NSString *key = [NSString stringWithFormat:@"%c", c];
        TrieNodeWithMap *node = [ptr.children objectForKey:key];
        if(node == nil) {
            return NO;
        }
        ptr = node;
    }
    return ptr.isWord;
}

- (BOOL)startWith:(NSString *)prefix
{
    if (self.root == nil) {
        return NO;
    }
    TrieNodeWithMap *ptr = self.root;
    for(NSUInteger i = 0; i < prefix.length; i++) {
        char c = [prefix characterAtIndex:i];
        NSString *key = [NSString stringWithFormat:@"%c", c];
        TrieNodeWithMap *node = [ptr.children objectForKey:key];
        if(node == nil) {
            return NO;
        }
        ptr = node;
    }
    return ptr != nil;
}

- (NSArray *)listStartWith:(NSString *)prefix
{
    if (self.root == nil) {
        return nil;
    }
    TrieNodeWithMap *ptr = self.root;
    for (NSUInteger i = 0; i < prefix.length; i++) {
        char c = [prefix characterAtIndex:i];
        NSString *key = [NSString stringWithFormat:@"%c", c];
        TrieNodeWithMap *node = [ptr.children objectForKey:key];
        if(node == nil) {
            return nil;
        }
        ptr = node;
    }
    
    // prefix abc
    // trie: abcd, abcde, abcf, abcg
    // insert: node a, b, c, d, e, f, g
    // ptr stops at node
    
    NSMutableArray<NSString *> *res = [NSMutableArray array];
    [self dfs:ptr res:res word:prefix];
    return [res copy];
}

- (void)dfs:(TrieNodeWithMap *)node res:(NSMutableArray<NSString *> *)res word:(NSString *)word {
    if (node == nil) {
        return;
    }
    if (node.isWord == true) {
        [res addObject:word];
    }
    
    for (NSString* key in node.children.allKeys) {
        TrieNodeWithMap *value = [node.children objectForKey:key];
        if (value != nil) {
            NSString *wordAppendKey = [NSString stringWithFormat:@"%@%@", word, key];
            [self dfs:value res:res word:wordAppendKey];
        }
    }    
}


@end
