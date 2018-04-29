//
//  LC71.m
//  LC
//
//  Created by Admin  on 4/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC71.h"

@implementation LC71

-(char* )simplifyPath:(char* )path {

    NSSet* skipSet = [[NSSet alloc] initWithObjects:@"..", @".", @"", nil];
    NSArray* res = [self split:path c:'/'];
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"res:%@", obj);
    }];
    return "as";
}

- (NSArray *)split:(char *)str c:(char)c {
    NSMutableArray *res = [NSMutableArray array];
    int len = (int)strlen(str);
    int i = 0;
    int j = 0;
    while(*str != '\0') {
        printf("*(str + %d):%c\n", j, *(str + j));
        if(*(str + j) == c) {
            if(j == i) {
                j++;
                i = j;
                continue;
            }
            char subStr[len];
            DLog(@"subStr:%s", subStr);
            strncpy(subStr, str + j, j - i);
            subStr[j - i + 1] = '\0';
            DLog(@"subStr:%s", subStr);
            [res addObject:[NSString stringWithFormat:@"%s", subStr]];
            [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                DLog(@"obj:%@", obj);
            }];
            i = j + 1;
        }
        j++;
    }
    return res;
}

- (void)test {
    char* path = "/a/./b/../../c/";
    [self simplifyPath:path];
}

@end
