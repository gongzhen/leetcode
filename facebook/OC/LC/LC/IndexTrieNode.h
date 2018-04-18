//
//  IndexTrieNode.h
//  LC
//
//  Created by ULS on 4/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "TrieNode.h"

@interface IndexTrieNode : TrieNode

@property(strong, nonatomic)NSMutableArray* indexedChildren;
@property(assign) int index;

@end
