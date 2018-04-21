//
//  LC642.m
//  LC
//
//  Created by Admin  on 4/19/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC642.h"

@interface LC642Node: NSObject

@property (copy, nonatomic) NSString *sentense;
@property (assign, nonatomic) int times;

- (instancetype)initWithSentense:(NSString *)sentense time:(int)times;

@end

@implementation LC642Node

- (instancetype)initWithSentense:(NSString *)sentense time:(int)times {
    if(self = [super init]) {
        _sentense = sentense;
        _times = times;
    }
    return self;
}

@end

@interface AutocompleteSystem: NSObject

@property(strong, nonatomic) NSMutableString* currentSentense;
- (instancetype)initWithSentense:(char **)sentense size:(int)size times:(int *)times;
- (NSArray<NSString *> *)input:(char)c;

@end

@implementation AutocompleteSystem {
    NSMutableDictionary *_map;
}

- (instancetype)initWithSentense:(char **)sentense size:(int)size times:(int *)times {
    if(self = [super init]) {
        _map = [NSMutableDictionary dictionary];
        _currentSentense = [NSMutableString string];
        for(int i = 0; i < size; i++) {
            [_map setObject:@(times[i]) forKey:[NSString stringWithFormat:@"%s", sentense[i]]];
        }
        
        [_map enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            DLog(@"key:%@ ==> value:%@", key, obj);
        }];
        DLog(@"--------------------------------------------------------------------------------------------");
    }
    return self;
}

- (NSArray<NSString *> *)input:(char)c {
    NSMutableArray<NSString *> *res = [NSMutableArray array];
    if(c == '#') {
        if([_map objectForKey:_currentSentense] == NULL) {
            [_map setObject:@(0) forKey:_currentSentense];
        }
        NSNumber* num = [_map objectForKey:_currentSentense];
        [_map setObject:@([num intValue] + 1) forKey:_currentSentense];
        _currentSentense = [NSMutableString stringWithString:@""];
    } else {
        NSMutableArray<LC642Node *> *list = [NSMutableArray array];
        [_currentSentense appendFormat:@"%c", c];
        for(NSString *key in _map.allKeys) {
            if([key rangeOfString:_currentSentense].location == 0) {
                int time = [[_map objectForKey:key] intValue];
                LC642Node *newNode = [[LC642Node alloc] initWithSentense:key time:time];
                [list addObject:newNode];
            }
        }
        [list sortUsingComparator:^NSComparisonResult(LC642Node*  _Nonnull obj1, LC642Node* _Nonnull obj2) {
            if(obj1.times > obj2.times) {
                return NSOrderedDescending;
            } else if(obj1.times == obj2.times) {
                return [obj1.sentense compare:obj2.sentense];
            }
            return NSOrderedAscending;
        }];
        for(int i = 0; i < MIN(3, list.count); i++) {
            LC642Node* node = [list objectAtIndex:i];
            [res addObject:node.sentense];
        }
    }
    return res;
}


@end

@implementation LC642

- (void)test {
    char* sentense[4] = {"i love you", "island", "ironman", "i love leetcode"};
    int timesArray[4] = {5, 3, 2, 2};
    int* times = timesArray;
    AutocompleteSystem *obj = [[AutocompleteSystem alloc] initWithSentense:sentense size:4 times:times];
    NSArray* res = [obj input:'i'];
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"%@,", obj);
    }];
}

@end
