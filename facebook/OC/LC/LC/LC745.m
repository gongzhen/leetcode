//
//  LC745.m
//  LC
//
//  Created by Admin  on 4/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC745.h"

@interface LC745()

@property(strong, nonatomic) Trie* trie;

@end

@implementation LC745

- (instancetype)initWithWords:(char **)words {
    if(self = [super init]) {
        int len = sizeof(words) / sizeof(words[0]);
        for(int i = 0; i < len; i++) {
            
        }
    }
    return self;
}

- (void)test {
    char* words[2] = {"apple", "abc"};
    int len = sizeof(words) / sizeof(words[0]);
    DLog(@"%d", len);
}

@end
