//
//  Trie.m
//  LC
//
//  Created by ULS on 3/6/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "Trie.h"
#import "TrieNode.h"

@interface Trie()

@property (strong, nonatomic) TrieNode *root;

@end

@implementation Trie

- (instancetype)init {
    if(self = [super init]) {
        _root = [[TrieNode alloc] init];
    }
    return self;
}

- (void)insert:(NSString *)word {
    if(_root == nil) {
        return;
    }
    TrieNode *node = _root;
    for(int i = 0; i < [word length]; i++) {
        char c = [word characterAtIndex:i];
        if([node.children objectAtIndex:(c - 'a')] == [NSNull null]) {
            TrieNode *newNode = [[TrieNode alloc] init];
            [node.children replaceObjectAtIndex:(c - 'a') withObject:newNode];
        }
        node = [node.children objectAtIndex:(c - 'a')];
    }
    node.isWord = YES;
}

- (void)insert:(NSString *)word index:(int)index {
    if(_root == nil) {
        return;
    }
    TrieNode *node = _root;
    for(int i = 0; i < [word length]; i++) {
        char c = [word characterAtIndex:i];
        if([node.children objectAtIndex:(c - 'a')] == [NSNull null]) {
            TrieNode *newNode = [[TrieNode alloc] init];
            [node.children replaceObjectAtIndex:(c - 'a') withObject:newNode];
        }
        node = [node.children objectAtIndex:(c - 'a')];
    }
    node.isWord = YES;
}

- (BOOL)search:(NSString *)word {
    if(word.length == 0 || _root == NULL) {
        return NO;
    }
    TrieNode *node = _root;
    for(int i = 0; i < [word length]; i++) {
        char c = [word characterAtIndex:i];
        if([node.children objectAtIndex:(c - 'a')] == [NSNull null]) {
            return NO;
        }
        node = [node.children objectAtIndex:(c - 'a')];
    }
    return node.isWord == YES;
}

- (BOOL)startWith:(NSString *)prefix {
    if(prefix.length == 0 || _root == NULL) {
        return NO;
    }
    
    TrieNode *node = _root;
    for(int i = 0; i < [prefix length]; i++) {
        char c = [prefix characterAtIndex:i];
        NSLog(@"%@", [node.children objectAtIndex:(c - 'a')]); // null is ouput if null object.
//        if([node.children objectAtIndex:(c - 'a')] == [NSNull null]) {
        if ([[node.children objectAtIndex:(c - 'a')] isEqualTo:[NSNull null]] == true) {
            return NO;
        }
        node = [node.children objectAtIndex:(c - 'a')];
    }
    return node != NULL;
}

/// Xcode teacher add this method.
/// return the list containing all the words with same prefix.
/// prefix: abc
/// list: abc, abcd, abcef, abccc, abcdf
- (NSArray *)listStartWith:(NSString *)prefix {
    if(prefix.length == 0 || _root == NULL) {
        return [NSArray array];
    }
    
    TrieNode *node = _root;
    for(int i = 0; i < [prefix length]; i++) {
        char c = [prefix characterAtIndex:i];
        if([node.children objectAtIndex:(c - 'a')] == [NSNull null]) {
            return [NSArray array];
        }
        node = [node.children objectAtIndex:(c - 'a')];
    }
    NSMutableArray *list = [NSMutableArray array];
    [self dfs:node list:list word:prefix];
    return list;
}

- (void)dfs:(TrieNode *)node list:(NSMutableArray *)list word:(NSString *)word {
    if(node == nil) {
        return;
    }
    if(node.isWord == true) {
        [list addObject:word];
    }
    
    for(int i = 0; i < 26; i++) {
        if([node.children objectAtIndex:i] != [NSNull null]) {
            char c = (char)('a' + i);
            [self dfs:[node.children objectAtIndex:i] list:list word:[NSString stringWithFormat:@"%@%c", word, c]];
        }
    }
}

@end
