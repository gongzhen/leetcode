//
//  Trie.h
//  LC
//
//  Created by ULS on 3/6/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC.h"
#import "TrieNode.h"

@interface Trie : LC

@property (strong, nonatomic) TrieNode *root;

- (void)insert:(NSString *)word;
- (void)insert:(NSString *)word index:(int)index;
- (BOOL)search:(NSString *)word;
- (BOOL)startWith:(NSString *)prefix;
    
@end
