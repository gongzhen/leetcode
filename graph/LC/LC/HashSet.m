//
//  HashSet.m
//  LC
//
//  Created by ULS on 3/13/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "HashSet.h"
#import "UndirectedGraphNode.h"

@interface HashSet() {
    id PRESENT;
}

@property(strong, nonatomic)NSMapTable *map;

@end

@implementation HashSet

-(instancetype)init {
    if(self = [super init]) {
        _map = [[NSMapTable alloc] init];
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
    return _map.count == 0;
}

- (BOOL)remove:(id)e {
    if([_map objectForKey:e] == NULL) {
        return NO;
    }
    [_map removeObjectForKey:e];
    return YES;
}

- (NSInteger)size {
    return _map.count;
}

- (NSArray *)arrayList {
    NSMutableArray *array = [NSMutableArray array];
    for(id obj in _map.keyEnumerator) {
        [array addObject:obj];
    }
    return [array copy];
}

- (void)printSet {
    [self add:@(1)];
    [self add:@(2)];
    [self add:@(3)];
    if([self contains:@(1)]) {
        [self add:@(1)];
    }
    UndirectedGraphNode *n1 = [[UndirectedGraphNode alloc] initWith:1];
    UndirectedGraphNode *n2 = [[UndirectedGraphNode alloc] initWith:2];
    [self add:n1];
    if([self contains:n1]) {
        [self add:n2];
    }
}

- (void)test {
    [self printSet];
}

@end
