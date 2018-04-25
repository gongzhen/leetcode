//
//  LC127.m
//  LC
//
//  Created by ULS on 4/1/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC127.h"
#import "Queue.h"

@interface LC127()

- (int)ladderLength:(NSString *)beginWord endWord:(NSString *)endWord wordList:(char **)wordList size:(int)size;

@end

@implementation LC127

/**
 Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation
 sequence from beginWord to endWord, such that:
 
 Only one letter can be changed at a time.
 Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
 */
- (int)ladderLength:(NSString *)beginWord endWord:(NSString *)endWord wordList:(char **)wordList size:(int)size {
    if(beginWord.length == 0 || endWord.length == 0 || size == 0) {
        return 0;
    }
    
    // 1: wordSet:store all the words from wordList.
    NSMutableSet<NSString *> *wordSet = [[NSMutableSet alloc] init];
    for(int i = 0; i < size; i++) {
        NSString *str = [NSString stringWithCString:wordList[i] encoding:NSUTF8StringEncoding];
        [wordSet addObject:str];
    }
    /// queue:structure to breath first search.
    /// hashSet: saved the visted word.
    Queue<NSString *> *queue = [Queue queue];
    NSMutableSet *hashSet = [NSMutableSet set];
    
    /// qeueu: add the beginWord.
    [queue offer:beginWord];
    /// length: initial length is 1.
    int length = 1;
    while(![queue isEmpty]) {                           /// while loop condition: queue is not empty.
        /// start to count length
        length++;
        /// loop the queue from its size.
        NSUInteger size = [queue size];                 /// size: queue's size.
        for(int i = 0; i < size; i++) {
            /// queue the top word.
            NSString *word = [queue poll];              /// queue poll the top word.
            NSMutableString *mutWord = [word mutableCopy];          /// mutWord: word mutable copy.

            /// loop the 26 characters and replace one character from the word.
            /// loop each character of word
            for(int i = 0; i < word.length; i++) {                  /// for loop: each char from word.
                /// loop 26 characters
                for(char j = 'a'; j <= 'z'; j++) {                  /// for loop: each char from 'a' 'b' ... 'z'
                    /// NSString* newWord = [NSString stringWithFormat:@"%@%c%@", [word substringToIndex:i], c, [word substringFromIndex:i + 1]];
                    char c = [mutWord characterAtIndex:i];          /// c: character at index i of mutWord.
                    if(c != j) {                                    /// c != j: compare char c and char j.
                        /// replace ith char with char j.
                        [mutWord replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%c", j]];
                        DLog(@"mutWord:%@", mutWord);
                        /// check if wordSet contains the mutWord.
                        if([wordSet containsObject:mutWord]) {
                            /// if hashSet visited mutWord, then continue
                            if([hashSet containsObject:mutWord]) {
                                continue;
                            }
                            NSLog(@"mutWord:%@", mutWord);
                            if([mutWord isEqualToString:endWord]) {
                                return length;
                            } else {
                                [queue offer:[mutWord copy]];
                                [hashSet addObject:[mutWord copy]];
                            }
                        }
                        /// replace ith char with char c. You don't want to change the word. You wanna the word as same as before.
                        [mutWord replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%c", c]];
                    }
                    DLog(@"mutWord:%@", mutWord);
                }
            }
        }
    }
    
    return 0;
}

- (void)test {
//    char* wordList[6] = {"hot", "dot", "dog", "lot", "log", "cog"};
//    int res = [self ladderLength:@"hit" endWord:@"cog" wordList:wordList size:6];
//    DLog(@"res:%d", res);
    
    char* wordList[5] = {"hot", "dot", "dog", "lot", "log"};
    int res = [self ladderLength:@"hit" endWord:@"cog" wordList:wordList size:5];
    DLog(@"res:%d", res);
}
@end
