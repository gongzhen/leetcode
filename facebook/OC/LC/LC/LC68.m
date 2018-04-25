//
//  LC68.m
//  LC
//
//  Created by Admin  on 4/13/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC68.h"

@implementation LC68

/// Cannot pass test case {""} and maxWidth = 0
/// Cannot pass test case {"a"} and maxWidth = 1
- (NSArray *)fullJustify:(char **)words wordsSize:(int)wordsSize maxWidth:(int)maxWidth {
    NSMutableArray *res = [NSMutableArray array];
    if(wordsSize == 0) {
        return res;
    }
    
    int i = 0;
    /// step1: start index i = 0;
    while(i < wordsSize) {
        /// step2: count is 0 and last index = i.
        /// added count from last to the index that is larger than maxLength.
        NSInteger count = 0;
        int last = i;
        while( last < wordsSize) {
            DLog(@"count:%ld ==> maxWidth:16 > %ld <=== words[last]:%s: strlen(%ld)", count, (strlen(words[last]) + count + 1), words[last], strlen(words[last]));
            if(strlen(words[last++]) + count + 1 > maxWidth) {
                break;
            }
            count += strlen(words[last]) + 1; /// +1 is at leaset one space between two words. Every loop needs +1!!!This[]is[]an
//            last++;
        }
        /// last: index last will be the word that the word index that exceeds ther maxWidth.
        /// count: count is the total length of words that less than maxWidth.
        NSMutableString *tmp = [NSMutableString new];
        for(int j = i; j < last; j++) {
            [tmp appendString: [NSString stringWithUTF8String:words[j]]];
        }
        DLog(@"tmp:%@ == length:%ld", tmp, tmp.length); /// tmp is "Thisisan" not "Thisisanexample".
        /// step3: str to added for each line.
        /// diff is the number of the spaces
        /// 1: last is the last word of words array OR diff == 0 means there is only one word for this line.
        NSMutableString *str = [NSMutableString string];
        NSInteger diff = last - i - 1; /// last - i - 1 is the number of spaces
        DLog(@"diff(number of spaces):%ld last:%d count:%ld", diff, last, count);
        if(last == wordsSize || diff == 0) {
            for(int j = i; j < last; j++) {
                if(j + 1 == last) {
                    [str appendFormat:@"%@", [NSString stringWithUTF8String:words[j]]];
                } else {
                    [str appendFormat:@"%@ ", [NSString stringWithUTF8String:words[j]]];
                }
            }
            /// Fill all the space before maxWidth.
            for(NSInteger i = str.length; i < maxWidth; i++) {
                [str appendString:@" "];
            }
        } else {
            /// 2:Calcuat the spaces and reminder
            NSInteger spaces = (maxWidth - count) / diff;
            DLog(@"space for each gap:%ld <==== (16 - %ld) / %ld.", spaces, count, diff);
            /// maxWidth - count is the total space length, then divided by how many block of space.
            NSInteger r = (maxWidth - count) % diff;
            /// r: r is the reminder of space if the spaces is not integer.
            DLog(@"r:%ld <==== (16 - %ld) model %ld.", r, count, diff);
            DLog(@"spaces:%ld r:%ld count:%ld", spaces, r, count);
            for(int j = i; j < last; j++) {
                [str appendString:[NSString stringWithCString:words[j] encoding:NSUTF8StringEncoding]];
                DLog(@"i:%d, j:%d, str:%@", i, j, str);
                if(j < last - 1) { /// If j is less than last index, then str has to append space from "spaces" and "r".
                    /// For example, if r == 2, then
                    /// when i = 0, j = 0, j - i == 0 < r(2)
                    /// spaces + 1
                    /// when i = 0, j = 1, j - i == 1 < r(2)
                    /// spaces + 1
                    /// when i = 0, j = 2, j - i == 2 == r(2)
                    /// all the reminder spaces are added and no needed to add space here.
                    /// so space + 0 is good.
                    for(int k = 0; k <= (spaces + ((j - i) <= r ? 1 : 0)); k++) {
                        [str appendString:@" "];
                        DLog(@"str:%@|", str);
                    }
                }
            }
            DLog(@"str:%@", str);
        }
        [res addObject:str];
        i = last;
    }
    return res;
}

- (NSArray *)fullJustify_1:(char **)words wordsSize:(int)wordsSize maxWidth:(int)maxWidth {
    NSMutableArray *res = [NSMutableArray array];
    
    int i = 0;
    /// step1: start index i = 0;
    while(i < wordsSize) {
        /// step2: count is 0 and last index = i.
        /// added count from last to the index that is larger than maxLength.
        NSInteger count = strlen(words[i]);
        int last = i + 1;
        while( last < wordsSize) {
            DLog(@"count:%ld ==> maxWidth:16 > %ld <=== words[last]:%s: strlen(%ld)", count, (strlen(words[last]) + count + 1), words[last], strlen(words[last]));
            if(strlen(words[last]) + count + 1 > maxWidth) {
                break;
            }
            count += strlen(words[last]) + 1; /// +1 is at leaset one space between two words. Every loop needs +1!!!This[]is[]an
            last++;
        }
        /// last: index last will be the word that the word index that exceeds ther maxWidth.
        /// count: count is the total length of words that less than maxWidth.
        NSMutableString *tmp = [NSMutableString new];
        for(int j = i; j < last; j++) {
            [tmp appendString: [NSString stringWithUTF8String:words[j]]];
        }
        DLog(@"tmp:%@ == length:%ld", tmp, tmp.length); /// tmp is "Thisisan" not "Thisisanexample".
        /// step3: str to added for each line.
        /// numberOfSpace is the number of the spaces
        /// 1: last is the last word of words array OR diff == 0 means there is only one word for this line.
        NSMutableString *str = [NSMutableString string];
        NSInteger numberOfSpace = last - i - 1; /// last - i - 1 is the number of spaces
        DLog(@"numberOfSpace(number of spaces):%ld last:%d count:%ld", numberOfSpace, last, count);
        if(last == wordsSize || numberOfSpace == 0) {
            for(int j = i; j < last; j++) {
                if(j + 1 == last) {
                    [str appendFormat:@"%@", [NSString stringWithUTF8String:words[j]]];
                } else {
                    [str appendFormat:@"%@ ", [NSString stringWithUTF8String:words[j]]];
                }
            }
            /// Fill all the space before maxWidth.
            for(NSInteger i = str.length; i < maxWidth; i++) {
                [str appendString:@" "];
            }
        } else {
            /// 2:Calcuat the spaces and reminder
            NSInteger spaces = (maxWidth - count) / numberOfSpace;
            DLog(@"space for each gap:%ld <==== (16 - %ld) / %ld.", spaces, count, numberOfSpace);
            /// maxWidth - count is the total space length, then divided by how many block of space.
            NSInteger r = (maxWidth - count) % numberOfSpace;
            /// r: r is the reminder of space if the spaces is not integer.
            DLog(@"r:%ld <==== (16 - %ld) model %ld.", r, count, numberOfSpace);
            DLog(@"spaces:%ld r:%ld count:%ld", spaces, r, count);
            for(int j = i; j < last; j++) {
                [str appendString:[NSString stringWithCString:words[j] encoding:NSUTF8StringEncoding]];
                DLog(@"i:%d, j:%d, str:%@", i, j, str);
                if(j < last - 1) { /// If j is less than last index, then str has to append space from "spaces" and "r".
                    /// For example, if r == 2, then
                    /// when i = 0, j = 0, j - i == 0 < r(2)
                    /// spaces + 1
                    /// when i = 0, j = 1, j - i == 1 < r(2)
                    /// spaces + 1
                    /// when i = 0, j = 2, j - i == 2 == r(2)
                    /// all the reminder spaces are added and no needed to add space here.
                    /// so space + 0 is good.
                    for(int k = 0; k <= (spaces + ((j - i) < r ? 1 : 0)); k++) {
                        [str appendString:@" "];
                        DLog(@"[str:%@]", str);
                    }
                }
            }
            DLog(@"str:%@", str);
        }
        [res addObject:str];
        i = last;
    }
    return res;
}

/// https://leetcode.com/problems/text-justification/discuss/24873/Share-my-concise-c++-solution-less-than-20-lines
- (NSArray *)fullJustify_2:(char **)words wordsSize:(int)wordsSize maxWidth:(int)maxWidth {
    NSMutableArray *res = [NSMutableArray array];
    if(wordsSize == 0 || maxWidth == 0) {
        [res addObject:@""];
        return res;
    }
    
    for(int i = 0; i < wordsSize;) {
        
        int count = (int)strlen(words[i]);
        int last = i + 1;
        
//        int count = -1;
//        int last = i;
        for(; last < wordsSize && count + strlen(words[last]) + 1 <= maxWidth; last++) {
            count += strlen(words[last]) + 1;
        }
        
        int evenlyDistributedSpaces = 1;
        int extraSpace = 0;
        int numOfGapsBwWords = last - i - 1;
        
        if(last != i + 1 && last != wordsSize) {
            evenlyDistributedSpaces = (maxWidth - count) / numOfGapsBwWords + 1;
            extraSpace = (maxWidth - count) % numOfGapsBwWords;
        }
        
        NSMutableString *sb = [NSMutableString string];
        for(int j = i; j < last; j++) {
            [sb appendString:[NSString stringWithUTF8String:words[j]]];
            if(j + 1 < last) {
                for(int s = 0; s < evenlyDistributedSpaces; s++) {
                    [sb appendString:@" "];
                }
                if(extraSpace > 0) {
                    [sb appendString:@" "];
                    extraSpace--;
                }
            }
        }
        
        int remaining = maxWidth - (int)sb.length;
        while(remaining > 0) {
            [sb appendString:@" "];
            remaining--;
        }
        DLog(@"[%@]",sb)
        [res addObject:sb];
        i = last;
    }
    return res;
}

- (void)test {
//    char* words[7] = {"This", "is", "an", "example", "of", "text", "justification."};
//    NSArray<NSString *> *res = [self fullJustify:words wordsSize:7 maxWidth:16];
//    [res enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"%@", obj);
//    }];
//    char* words[1] = {""};
//    NSArray<NSString *> *res = [self fullJustify_1:words wordsSize:1 maxWidth:0];
//    [res enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"%@", obj);
//    }];
//    char* words[1] = {"a"};
//    NSArray<NSString *> *res = [self fullJustify:words wordsSize:1 maxWidth:1];
//    [res enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"%@", obj);
//    }];
//
    char* words[7] = {"This", "is", "an", "example", "of", "text", "justification."};
    NSArray<NSString *> *res = [self fullJustify_1:words wordsSize:7 maxWidth:16];
    [res enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"%@", obj);
    }];

    res = [self fullJustify_2:words wordsSize:7 maxWidth:16];
    [res enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"%@", obj);
    }];

}
@end
