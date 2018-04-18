//
//  Trie.m
//  LC
//
//  Created by ULS on 3/6/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "Trie.h"

@interface Trie()

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
        if([node.children objectAtIndex:(c - 'a')] == [NSNull null]) {
            return NO;
        }
        node = [node.children objectAtIndex:(c - 'a')];
    }
    return node != NULL;
}

@end
