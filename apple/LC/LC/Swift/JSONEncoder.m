//
//  JSONEncoder.m
//  LC
//
//  Created by Zhen Gong on 10/23/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "JSONEncoder.h"

@implementation JSONEncoder

- (NSString *)convertFromSnakeCase:(NSString *)stringKey {
    return [self _convertFromSnakeCase:stringKey];
}

- (NSString *)_convertFromSnakeCase:(NSString *)stringKey {
    if (stringKey.length == 0) {
        return stringKey;
    }
    
    NSUInteger len = [stringKey length];
    unichar buffer[len + 1];
    [stringKey getCharacters:buffer range:NSMakeRange(0, len)];
    printf("%hu", (unichar)buffer);
    int i = 0;
    for(; i < len; i++) {
        if (buffer[i] != '_') {
            break;
        }
    }
    
    return @"";
}

@end
