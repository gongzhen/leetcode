//
//  TrieNodeWithMap.m
//  LC
//
//  Created by Zhen Gong on 10/7/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "TrieNodeWithMap.h"

@implementation TrieNodeWithMap

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.children = [[NSMutableDictionary alloc] init];
        self.isWord = NO;
    }
    return self;
}

@end
