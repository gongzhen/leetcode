//
//  LC208.m
//  LC
//
//  Created by ULS on 3/6/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC208.h"
#import "Trie.h"

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
}
@end
