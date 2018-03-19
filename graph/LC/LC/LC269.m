//
//  LC269.m
//  LC
//
//  Created by Admin  on 3/19/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC269.h"
#import "HashSet.h"
#import "Queue.h"

@interface LC269()

- (NSString *)alienOrder:(NSArray<NSString *> *)words;

@end

@implementation LC269

- (NSString *)alienOrder:(NSArray<NSString *> *)words {
    if(words.count == 0) {
        return @"";
    }
    
    HashSet *set = [[HashSet alloc] init];
    for(NSString *word in words) {
        for(int i = 0; i < word.length; i++) {
            char c = [word characterAtIndex:i];
            printf("%c\n", c);
            DLog(@"%@", @(c));
            [set add:@(c)];
        }
    }
    
    NSMutableDictionary<NSNumber *, HashSet*> *graph = [NSMutableDictionary dictionary];
    int* indegree = (int *)calloc(26, sizeof(int));
    
    for(int i = 1; i < words.count; i++) {
        NSString *preWord = words[i - 1];
        NSString *curWord = words[i];
        NSInteger len = MIN(preWord.length, curWord.length);
        for(int j = 0; j < len; j++) {
            char preChar = [preWord characterAtIndex:j];
            char curChar = [curWord characterAtIndex:j];
            if(preChar != curChar) {
                if([graph objectForKey:@(preChar)] == nil) {
                    [graph setObject:[[HashSet alloc] init] forKey:@(preChar)];
                }
                if([[graph objectForKey:@(preChar)] add:@(curChar)] == YES) {
                    indegree[curChar - 'a']++;
                }
                break;
            }
        }
    }
    
    Queue* pq = [Queue queue];
    for(int i = 0; i < 26; i++){
        if(indegree[i] == 0) {
            char c = i + 'a';
            printf("%c", c);
            if([set contains:@(c)] == YES) {
                [pq offer:@(c)];
            }
        }
    }
    
    NSMutableString *res = [NSMutableString string];
    
    while(![pq isEmpty]) {
        NSNumber *top = (NSNumber *)[pq poll];
        char topChar = [top charValue];
        [res appendFormat:@"%c", topChar];
        DLog(@"top:%@", top);
        DLog(@"res:%@", res);
        DLog(@"topChar:%c", topChar);
        if([set contains:top]) {
            HashSet* wordSet = [graph objectForKey:top];
            NSArray<NSNumber *> *list = [wordSet toArray];
            for(NSNumber *obj in list) {
                char ch = [obj charValue];
                DLog(@"ch:%c", ch);
                indegree[ch - 'a']--;
                if(indegree[ch - 'a'] == 0) {
                    [pq offer:@(ch)];
                }
            }
        }
    }
    
    return res.length != set.size ? @"" : [res copy];;
}

- (void)test {
//    NSArray *words = @[@"wrt",@"wrf", @"er", @"ett", @"rftt"];
//    NSString* res =  [self alienOrder:words];
//    DLog(@"res:%@", res);
    
    NSArray *words = @[@"z",@"x", @"z"];
    NSString* res =  [self alienOrder:words];
    DLog(@"res:%@", res);
}
@end
