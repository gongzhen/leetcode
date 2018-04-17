//
//  IndexTrie.h
//  LC
//
//  Created by ULS on 4/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IndexTrieNode;

@interface IndexTrie : NSObject

@property(strong, nonatomic) IndexTrieNode *root;

- (void)insert:(NSString *)word index:(int)index;
- (int)startWith:(NSString *)prefix;

@end
