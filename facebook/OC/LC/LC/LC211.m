//
//  LC211.m
//  LC
//
//  Created by ULS on 2/15/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC211.h"
#import "TrieNode.h"

@interface LC211()

@property (strong, nonatomic) TrieNode* root;
- (void)addWord:(NSString *)word;
- (BOOL)search:(NSString *)word;

@end

@implementation LC211

-(instancetype)init {
    if(self = [super init]) {
        _root = [[TrieNode alloc] init];
    }
    return self;
}

- (void)addWord:(NSString *)word {
    TrieNode *ptr = _root;
    for(NSInteger i = 0; i < [word length]; i++) {
        if([ptr.children objectAtIndex:[word characterAtIndex:i] - 'a'] == [NSNull null]) {
            [ptr.children replaceObjectAtIndex:([word characterAtIndex:i] - 'a') withObject:[[TrieNode alloc] init]];
        }
        ptr = [ptr.children objectAtIndex:([word characterAtIndex:i] - 'a')];
    }
    ptr.isWord = YES;
}

- (BOOL)search:(NSString *)word {
    TrieNode *ptr = self.root;
    if(ptr == NULL) {
        return NO;
    }
    
    return [self dfs:word node:ptr idx:0];
}

- (BOOL)dfs:(NSString *)word node:(TrieNode *)node idx:(NSInteger)idx {
    if(node == NULL) { /// check node is null
        return NO;
    }
    
    if(idx == word.length) { /// check if idx reach the end of string word.
        return node.isWord == YES;
    }
    
    char c = [word characterAtIndex:idx]; /// fetch the current char.
    
    if(c == '.') {
        for(int j = 0; j < 26; j++) {
            if([node.children objectAtIndex:j] != [NSNull null]) {
                node = [node.children objectAtIndex:j];
                if ([self dfs:word node:node idx:idx + 1]) {
                    return YES;
                }
//                else { //// don't return NO because you still want to traverse the next char.
//                    return NO;
//                }
            }
        }
    } else {
        if([node.children objectAtIndex:(c - 'a')] != [NSNull null]) {
            node = [node.children objectAtIndex:(c - 'a')];
            if([self dfs:word node:node idx:idx + 1]) {
                return YES;
            }
        }
    }
    return NO;
}



- (void)test {
    NSString *word1 = @"bad";
    NSString *word2 = @"dad";
    NSString *word3 = @"mad";
    NSString *word4 = @"pad";
    [self addWord:word1];
    [self addWord:word2];
    [self addWord:word3];
    DLog(@"search:%d", [self search:word1]); /// 1
    DLog(@"search:%d", [self search:word2]); /// 1
    DLog(@"search:%d", [self search:word3]); /// 1
    DLog(@"search:%d", [self search:word4]); /// 0
    
    NSString *word5 = @".ad";
    NSString *word6 = @"b..";
    NSString *word7 = @"z..";
    DLog(@"search:%d", [self search:word5]); /// 1
    DLog(@"search:%d", [self search:word6]); /// 1
    DLog(@"search:%d", [self search:word7]); /// 0
}

@end
