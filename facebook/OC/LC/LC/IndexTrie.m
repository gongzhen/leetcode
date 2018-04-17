//
//  IndexTrie.m
//  LC
//
//  Created by ULS on 4/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "IndexTrie.h"
#import "IndexTrieNode.h"

@implementation IndexTrie

- (instancetype)init {
    if(self = [super init]) {
        _root = [[IndexTrieNode alloc] init];
    }
    return self;
}

- (void)insert:(NSString *)word index:(int)index {
    if(_root == nil) {
        return;
    }
    IndexTrieNode* node = _root;
    for(int i = 0; i < word.length; i++) {
        char c = [word characterAtIndex:i];
        if([node.indexedChildren objectAtIndex:(c - 'a')] == [NSNull null]) {
            IndexTrieNode* newNode = [[IndexTrieNode alloc] init];
            [node.indexedChildren replaceObjectAtIndex:(c - 'a') withObject:newNode];
        }
        node = [node.indexedChildren objectAtIndex:(c - 'a')];
        node.index = index;
    }
    node.isWord = YES;
}

- (int)startWith:(NSString *)prefix {
    if(_root == nil) {
        return -1;
    }
    
    IndexTrieNode* node = _root;
    for(int i = 0; i < prefix.length; i++) {
        char c = [prefix characterAtIndex:i];
        if([node.indexedChildren objectAtIndex:(c - 'a')] != [NSNull null]) {
            node = [node.indexedChildren objectAtIndex:(c - 'a')];
        } else {
            node = NULL;
            break;
        }
    }
    if(node == NULL) {
        return -1;
    }
    return node.index;
}

@end
