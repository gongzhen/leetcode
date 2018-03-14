//
//  HashSet.m
//  LC
//
//  Created by ULS on 3/13/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "HashSet.h"

@interface HashSet()<NSCopying>

@end

@implementation HashSet {
    NSMutableDictionary *_map;
    id PRESENT;
}

-(instancetype)init {
    if(self = [super init]) {
        _map = [NSMutableDictionary dictionary];
        PRESENT = [[NSObject alloc] init];
    }
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    HashSet *newHashSet = [[HashSet alloc] init];
    newHashSet->_map = [_map copyWithZone:zone];
    return newHashSet;
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

- (id)clone {
    HashSet* newSet = [[HashSet alloc] init];
    newSet->_map = [_map copy];
    return newSet;
}

- (BOOL)contains:(id)e {
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

@end
