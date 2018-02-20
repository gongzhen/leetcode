//
//  LC670.m
//  LC
//
//  Created by ULS on 2/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC670.h"

@interface LC670()

- (int)maximumSwap:(int)num;

@end

@implementation LC670

- (int)maximumSwap:(int)num {
    int size = 0;
    int copy = num;
    while(copy) {
        copy = copy / 10;
        size++;
    }
    char str[size + 1];
    char original[size + 1];
    sprintf(str, "%d", num);
//    DLog(@"%s", str);
    strncpy(original, str, size + 1);
//    DLog(@"%s", original);
    for(int i = 0; i < size; i++) {
        for(int j = i + 1; j < size; j++) {
            char temp =  str[i];
            str[i] = str[j];
            str[j] = temp;
            for(int k = 0; k < size; k++) { /// loop original string.
                if(original[k] != str[k]) { /// Find the first digit of char not equals with new string.
                    DLog(@"str:%s", str);
                    if(original[k] < str[k]) { /// if first char of original < first char of str, then replace.
                        strncpy(original, str, size + 1);
                        DLog(@"original:%s", original);
//                        break;
                    }
                    break; /// Find the first not equals one then quit here.
                }
            }
            str[j] = str[i];
            str[i] = temp;
        }
    }
    DLog(@"original:%s", original);
    return atoi(original);
}

- (void)test {
    int num = 2226;
    [self maximumSwap:num];
}
@end
