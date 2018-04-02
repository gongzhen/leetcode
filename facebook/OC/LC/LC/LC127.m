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

- (int)ladderLength:(NSString *)beginWord endWord:(NSString *)endWord wordList:(char **)wordList size:(int)size {
    if(beginWord.length == 0 || endWord.length == 0 || size == 0) {
        return 0;
    }
    
    // beginWord
    NSMutableSet<NSString *> *wordSet = [[NSMutableSet alloc] init];
    for(int i = 0; i < size; i++) {
        NSString *str = [NSString stringWithCString:wordList[i] encoding:NSUTF8StringEncoding];
        [wordSet addObject:str];
    }
    /// queue for breath first search
    /// set for saving the visited word and avoid repeated word.
    Queue<NSString *> *queue = [Queue queue];
    NSMutableSet *hashSet = [NSMutableSet set];
    
    /// qeueu add beginWord.
    
    [queue offer:beginWord];
    int length = 1;
    while(![queue isEmpty]) {
        /// start to count length
        length++;
        /// loop the queue from its size.
        NSUInteger size = [queue size];
        for(int i = 0; i < size; i++) {
            /// queue the top word.
            NSString *word = [queue poll];
            NSMutableString *mutWord = [word mutableCopy];

            /// loop the 26 characters and replace one character from the word.
            /// loop each character of word
            for(int i = 0; i < word.length; i++) {
                /// loop 26 characters
                for(char j = 'a'; j <= 'z'; j++) {
                    /// NSString* newWord = [NSString stringWithFormat:@"%@%c%@", [word substringToIndex:i], c, [word substringFromIndex:i + 1]];
                    char c = [mutWord characterAtIndex:i];
                    if(c != j) {
                        /// replace ith char from j
                        [mutWord replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%c", j]];
                        DLog(@"mutWord:%@", mutWord);
                        /// check if wordSet contains the mutWord.
                        if([wordSet containsObject:mutWord]) {
                            /// if hashSet visited mutWord, then continue
                            if([hashSet containsObject:mutWord]) {
                                continue;
                            }
                            if([wordSet containsObject:mutWord]) {
                                NSLog(@"mutWord:%@", mutWord);
                                if([mutWord isEqualToString:endWord]) {
                                    return length;
                                } else {
                                    [queue offer:[mutWord copy]];
                                    [hashSet addObject:[mutWord copy]];
                                }
                            }
                        }
                        [mutWord replaceCharactersInRange:NSMakeRange(i, 1) withString:[NSString stringWithFormat:@"%c", c]];
                    }
                    DLog(@"mutWord:%@", mutWord);
                }
            }
        }
    }
    
    return length;
}

- (void)test {
    char* wordList[6] = {"hot", "dot", "dog", "lot", "log", "cog"};
    int res = [self ladderLength:@"hit" endWord:@"cog" wordList:wordList size:6];
    DLog(@"res:%d", res);
}
@end
