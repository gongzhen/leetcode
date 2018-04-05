//
//  LC49.m
//  LC
//
//  Created by ULS on 3/2/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC49.h"
#import "QuickSort.h"

@interface LC49()

- (NSArray *)groupAnagrams:(char **)strs size:(int)size;

@end

@implementation LC49

/**
 49. Group Anagrams
 Given an array of strings, group anagrams together.
 
 For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Return:
 
 [
 ["ate", "eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 */
- (NSArray *)groupAnagrams:(char **)strs size:(int)size {
    if(size == 0) {
        return [NSArray array];
    }
    
    NSMutableDictionary<NSString *, NSMutableArray *> *map = [NSMutableDictionary dictionary];
    for(int i = 0; i < size; i++) {
        char* word = strs[i];
        char* copy = malloc(strlen(word) + 1 * sizeof(char));
        strcpy(copy, word);
        [QuickSort quickSort:copy size:(int)strlen(copy)];
//        DLog(@"word:%s", word);
        NSString *key = [NSString stringWithUTF8String:copy];
        if([map objectForKey:key] == NULL) {
            [map setObject:[NSMutableArray array] forKey:key];
        }
        [[map objectForKey:key] addObject:[NSString stringWithUTF8String:word]];
    }
    
    NSMutableArray *res = [NSMutableArray array];
    [map enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSMutableArray * _Nonnull obj, BOOL * _Nonnull stop) {
        [res addObject:obj];
    }];
    
    return [res copy];
}

- (void)test{
    char* strs[6] = {"eat", "tea", "tan", "ate", "nat", "bat"};
    char** chars = (char **)malloc(6 * sizeof(char *));
    for(int i = 0; i < 6; i++) {
        chars[i] = malloc(strlen(strs[i]) * sizeof(char));
    }
    
    for(int i = 0; i < 6; i++) {
        for(int j = 0; j < strlen(strs[i]); j++) {
            chars[i][j] = strs[i][j];
        }
    }
    NSArray<NSArray *> *res = [self groupAnagrams:chars size:6];
    [res enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DLog(@"obj:%@", obj);
        }];
        DLog(@"-------------------------------------------------------------");
    }];
    /// Only free when use malloc
//    [self free_fields:strs size:6];
    [self free_fields:chars size:6];
}
@end
