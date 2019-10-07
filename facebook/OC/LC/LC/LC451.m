
//
//  LC451.m
//  LC
//
//  Created by Zhen Gong on 9/24/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "LC451.h"

@interface Pair451: NSObject

@property(assign, nonatomic) NSInteger count;
@property(strong, nonatomic) NSString* key;

@end

@implementation Pair451

- (instancetype)initWithCount:(NSInteger)count key:(NSString *)key
{
    self = [super init];
    if (self) {
        _count = count;
        _key = key;
    }
    return self;
}

@end

@implementation LC451

- (NSString *)frequencySort:(NSString *)str {
    NSMutableDictionary<NSString *, NSNumber *> *map = [NSMutableDictionary new];
    for (NSUInteger i = 0; i < str.length; i++) {
        char c = [str characterAtIndex:i];
        NSString *key = [NSString stringWithFormat:@"%c", c];
        NSNumber *count = [map objectForKey:key];
        if (count != nil) {
            NSInteger intCount = [count integerValue];
            intCount++;
            [map setObject:[NSNumber numberWithInteger:intCount] forKey:key];
        } else {
            [map setObject:[NSNumber numberWithInteger:1] forKey:key];
        }
    }
    
    NSMutableArray<Pair451 *> *list = [NSMutableArray arrayWithCapacity:map.count];
    for(NSString* key in map.allKeys) {
        NSNumber *count = [map objectForKey:key];
        if (count != nil) {
            NSInteger intCount = [count integerValue];
            [list addObject:[[Pair451 alloc] initWithCount:intCount key:key]];
        }
    }
    [list sortUsingComparator:^NSComparisonResult(Pair451 * _Nonnull  obj1, Pair451 * _Nonnull obj2) {
        NSInteger count1 = obj1.count;
        NSInteger count2 = obj2.count;
        if (count1 == count2) {
            return 0;
        } else if (count1 < count2) {
            return 1;
        }
        return -1;
    }];
    
    NSMutableString *result = [NSMutableString string];
    for (Pair451 *pair in list) {
        NSInteger count = pair.count;
        NSString *key = pair.key;
        for (NSInteger i = 0; i < count; i++) {
            [result appendString:key];
        }
    }
    return result;
}

- (void)test {
    NSString *res = [self frequencySort:@"tree"];
    NSLog(@"%@", res);
}

@end
