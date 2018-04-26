//
//  LC269.m
//  LC
//
//  Created by ULS on 4/17/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC269.h"
#import "Queue.h"

@implementation LC269

/**
 269. Alien Dictionary
 There is a new alien language which uses the latin alphabet. However, the order among letters are unknown to you. You receive a list of words from the dictionary, wherewords are sorted lexicographically by the rules of this new language. Derive the order of letters in this language.
 
 For example,
 Given the following words in dictionary,
 
 [
 "wrt",
 "wrf",
 "er",
 "ett",
 "rftt"
 ]
 
 
 The correct order is: "wertf".
 Note:
 
 You may assume all letters are in lowercase.
 If the order is invalid, return an empty string.
 There may be multiple valid order of letters, return any one of them is fine.
 */

- (NSString *)alienOrder:(NSArray *)words {
    if(words.count == 0) {
        return @"";
    }
    
    int *indegree = (int *)malloc(sizeof(int) * 26);
    int count = 0; /// count how many character totally.
    for(NSString *word in words) {
        for(int i = 0; i < word.length; i++) {
            char c = [word characterAtIndex:i];
            if(indegree[c - 'a'] == 0) {
                indegree[c - 'a'] = 1;
                count++;
            }
        }
    }
    
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    for(int i = 0; i < words.count - 1; i++) {
        NSString* current = words[i];
        NSString* next = words[i + 1];
        NSInteger len = MIN(current.length, next.length);
        for(int j = 0; j < len; j++) {
            if([current characterAtIndex:j] != [next characterAtIndex:j]) {
                if([map objectForKey:@([current characterAtIndex:j])] == NULL) {
                    [map setObject:[NSMutableSet set] forKey:@([current characterAtIndex:j])];
                }
                NSMutableSet *set = [map objectForKey:@([current characterAtIndex:j])];
                if([set containsObject:@([next characterAtIndex:j])] == NO) {
                    char c = [next characterAtIndex:j];
                    indegree[c - 'a']++;
                    [set addObject:@([next characterAtIndex:j])];
                }
                break;
            }
        }
    }
    
    [map enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        DLog(@"key:%c", (char)[key intValue]);
        [((NSSet *)obj) enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
            DLog(@"value:%c", (char)[obj intValue]);
        }];
    }];
    
    NSMutableString *res = [ NSMutableString string];
    Queue* queue = [Queue queue];
    for(int i = 0; i < 26; i++) {
        if(indegree[i] == 1) {
            [queue offer:@('a' + i)];
        }
    }
    
    while(![queue isEmpty]) {
        NSNumber *num = (NSNumber *)[queue poll];
        char key = [num charValue];
        [res appendString:[NSString stringWithFormat:@"%c", key]];
        if([map objectForKey:@(key)] != NULL) {
            NSSet *set = [map objectForKey:@(key)];
            for(NSNumber *num in set) {
                char key = [num charValue];
                indegree[key - 'a']--;
                if(indegree[key - 'a'] == 1) {
                    [queue offer:@(key)];
                }
            }
        }
    }
    if(res.length != count) {
        return @"";
    }
    return res;
}

- (void)test {
    NSArray *words = @[@"wrt", @"wrf", @"er", @"ett", @"rftt"];
    NSString *result = [self alienOrder:words];
    DLog(@"res:%@", result); /// wertf
}
@end
