//
//  LC208.m
//  LC
//
//  Created by ULS on 3/6/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC208.h"
#import "Trie.h"
#import "MapTrie.h"

@implementation LC208
/**
 Implement a trie with insert, search, and startsWith methods.
 Note:
 You may assume that all inputs are consist of lowercase letters a-z.
 */
- (void)test {
    Trie *trie = [[Trie alloc] init];
    [trie insert:@"abc"];
    [trie insert:@"abd"];
    [trie insert:@"acd"];
    DLog(@"search:%d",[trie search:@"abc"]);
    DLog(@"search:%d",[trie search:@"abf"]);
    DLog(@"search:%d",[trie search:@"ab"]);
    DLog(@"prefix:%d",[trie startWith:@"ab"]);
    DLog(@"prefix:%d",[trie startWith:@"db"]);
    NSArray<NSString *> *res1 = [trie listStartWith:@"ab"];
    [res1 enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"listStartWith:%@", obj);
    }];
    
    MapTrie* mapTrie = [[MapTrie alloc] init];
    [mapTrie insert:@"abc"];
    [mapTrie insert:@"abd"];
    [mapTrie insert:@"acd"];
    DLog(@"search:%d",[mapTrie search:@"abc"]);
    DLog(@"search:%d",[mapTrie search:@"abf"]);
    DLog(@"search:%d",[mapTrie search:@"ab"]);
    DLog(@"prefix:%d",[mapTrie startWith:@"ab"]);
    DLog(@"prefix:%d",[mapTrie startWith:@"db"]);
    NSArray<NSString *> *res2 = [mapTrie listStartWith:@"ab"];
    [res2 enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"listStartWith:%@", obj);
    }];
}
@end
