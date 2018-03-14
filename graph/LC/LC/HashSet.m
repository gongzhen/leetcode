//
//  HashSet.m
//  LC
//
//  Created by ULS on 3/13/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "HashSet.h"

@interface HashSet() {
    id PRESENT;
}

@property(strong, nonatomic)NSMutableDictionary *map;

@end

@implementation HashSet

-(instancetype)init {
    if(self = [super init]) {
        _map = [NSMutableDictionary dictionary];
        PRESENT = [[NSObject alloc] init];
    }
    return self;
}

#pragma mark - public methods

- (BOOL)add:(id)e {
    if(_map == NULL) {
        return NO;
    }
    [_map setObject:PRESENT forKey:e];
    return YES;
}

- (void)clear {
    [_map removeAllObjects];
}

//- (id)clone {
//    HashSet* newSet = [[HashSet alloc] init];
//    newSet->_map = [_map copy];
//    return newSet;
//}

- (BOOL)contains:(id)e {
    DLog(@"e:%@", e);
    DLog(@"_map objectForKey:e:%@", [_map objectForKey:e]);
    DLog(@"_map:%@", _map);
    return [_map objectForKey:e] != NULL;
}

- (BOOL)isEmpty {
    return _map.allKeys.count == 0;
}

- (BOOL)remove:(id)e {
    if([_map objectForKey:e] == NULL) {
        return NO;
    }
    [_map removeObjectForKey:e];
    return YES;
}

- (NSInteger)size {
    return _map.allKeys.count;
}

- (NSArray *)arrayList {
    return _map.allKeys;
}

@end
