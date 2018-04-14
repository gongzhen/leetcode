//
//  LC68.m
//  LC
//
//  Created by Admin  on 4/13/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC68.h"

@implementation LC68

- (NSArray *)fullJustify:(char **)words wordsSize:(int)wordsSize maxWidth:(int)maxWidth {
    NSMutableArray *res = [NSMutableArray array];
    if(wordsSize == 0) {
        return res;
    }
    
    int i = 0;
    while( i < wordsSize) {
        NSInteger count = strlen(words[i]);
        int last = i + 1;
        while( last < wordsSize) {
            if(strlen(words[last]) + count + 1 > maxWidth) {
                break;
            }
            count += strlen(words[last]) + 1;
            last++;
        }
        
        NSMutableString *str = [NSMutableString string];
        NSInteger diff = last - i - 1;
        DLog(@"diff:%ld last:%d", diff, last);
        if(diff == 0) {
            
        } else {
            NSInteger spaces = (maxWidth - count) / diff;
            NSInteger r = (maxWidth - count) % diff;
            
        }
        
        i = last;
    }
    
    return res;
}

- (void)test {
    char* words[7] = {"This", "is", "an", "example", "of", "text", "justification."};
    [self fullJustify:words wordsSize:7 maxWidth:16];
}
@end
