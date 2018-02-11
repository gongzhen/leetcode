//
//  LC146.m
//  LC
//
//  Created by ULS on 2/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC146.h"

@interface Node: NSObject {

}

@property (assign) NSInteger key;
@property (assign) NSInteger value;
@property(nonatomic, strong) Node *prev;
@property(nonatomic, strong) Node *next;

@end

@implementation Node

- (instancetype)initWith:(NSInteger)key value:(NSInteger)value {
    if(self = [super init]) {
        _key = key;
        _value = value;
        _prev = NULL;
        _next = NULL;
    }
    return self;
}

@end

@interface LRUCache: NSObject {
    NSInteger _capacity;
    NSMutableDictionary *_map;
}

@property (nonatomic, strong) Node *head;
@property (nonatomic, strong) Node *tail;

- (NSInteger)get:(NSInteger)key;
- (void)put:(NSInteger)key value:(NSInteger)value;

@end

@implementation LRUCache

- (instancetype)initWith:(NSInteger)capacity {
    if(self = [super init]) {
        _capacity = capacity;
        _map = [NSMutableDictionary new];
        _head = [[Node alloc] initWith:-1 value:-1]; /// initialize dummpy value
        _tail = [[Node alloc] initWith:-1 value:-1];
        _head.next = _tail;
        _tail.prev = _head;
    }
    return self;
}

- (NSInteger)get:(NSInteger)key {
    if(![_map objectForKey:[NSNumber numberWithInteger:key]]) {
        return -1;
    }
    
    Node *node = [_map objectForKey:[NSNumber numberWithInteger:key]];
    
    /// disconnect node
    [self disconnect:node];
    
    /// move node to tail
    [self moveToTail:node];
    return node.value;
}

- (void)moveToTail:(Node *)node {
    if(node == NULL) {
        return;
    }
    
    self.tail.prev.next = node;
    node.prev = self.tail.prev;
    node.next = self.tail;
    self.tail.prev = node;
}

- (void)disconnect:(Node *)node {
    if(node == NULL) {
        return;
    }
    
    node.prev.next = node.next;
    node.next.prev = node.prev;
}

- (void)put:(NSInteger)key value:(NSInteger)value {
    if([self get:key] != -1) {
        Node *node = [_map objectForKey:[NSNumber numberWithInteger:key]];
        node.value = value;
        [_map setObject:node forKey:[NSNumber numberWithInteger:key]];
        return;
    }
    
    Node *node = [[Node alloc] initWith:key value:value];
    /// check capacity is full
    if(_map.count == _capacity) {
        /// remove head's next node if full.
        [_map removeObjectForKey:[NSNumber numberWithInteger:self.head.next.key]];
        [self disconnect:self.head.next];
    }
    [_map setObject:node forKey:[NSNumber numberWithInteger:node.key]];
    [self moveToTail:node];
}

@end

@interface LC146()

@end

@implementation LC146

- (void)test {
    LRUCache *cache = [[LRUCache alloc] initWith:2];
    [cache put:1 value:1];
    [cache put:2 value:2];
    NSLog(@"get :%d %ld", 1, [cache get:1]);
    [cache put:3 value:3];
    NSLog(@"get :%d %ld", 2, [cache get:2]);
    [cache put:4 value:4];
    NSLog(@"get :%d %ld", 1, [cache get:1]);
    NSLog(@"get :%d %ld", 3, [cache get:3]);
    NSLog(@"get :%d %ld", 4, [cache get:4]);
}

@end
