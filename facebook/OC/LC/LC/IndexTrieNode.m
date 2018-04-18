//
//  IndexTrieNode.m
//  LC
//
//  Created by ULS on 4/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "IndexTrieNode.h"

@implementation IndexTrieNode

- (instancetype)init {
    if(self = [super init]) {
        _index = -1;
        _indexedChildren = [[NSMutableArray alloc] initWithCapacity:27];
        for(int i = 0; i < 27; i++) {
            [_indexedChildren setObject:[NSNull null] atIndexedSubscript:i];
        }
    }
    return self;
}

@end
