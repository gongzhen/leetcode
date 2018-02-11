//
//  main.m
//  LRU
//
//  Created by Zhen Gong on 1/28/18.
//  Copyright © 2018 Zhen Gong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node: NSObject {
    
}

@property(assign) NSInteger key;
@property(assign) NSInteger value;
@property(strong, nonatomic) Node *prev;
@property(strong, nonatomic) Node *next;

@end

@implementation Node

- (instancetype)init:(NSInteger)key value:(NSInteger)value {
    if(self = [super init]) {
        _key = key;
        _value = value;
        _prev = NULL;
        _next = NULL;
    }
    return self;
}

@end

@interface LRUCache:NSObject {
    
}

@property(assign) NSUInteger capacity;
@property(copy,nonatomic) NSMutableDictionary *map;
@property(strong, nonatomic) Node *head;
@property(strong, nonatomic) Node *tail;

- (NSInteger)get:(NSInteger)key;
- (void)put:(NSInteger)key value:(NSInteger)value;

@end

@implementation LRUCache

- (instancetype)initWith:(NSUInteger)capacity {
    if(self = [super init]) {
        _capacity = capacity;
        _map = [NSMutableDictionary new];
        _head = [[Node alloc] init:-1 value:-1]; /// head and tail dummy nodes.
        _tail = [[Node alloc] init:-1 value:-1];
        _head.next = _tail;
        _tail.prev = _head;
    }
    return self;
}

- (NSInteger)get:(NSInteger)key {
    /// key not in map, return -1;
    if(![self.map objectForKey:[NSNumber numberWithInteger:key]]) {
        return -1;
    }
    
    /// find node from map
    Node *node = [self.map objectForKey:[NSNumber numberWithInteger:key]];
    
    // disconnect node
    [self disconnect:node];
    
    // move node to tail.
    [self moveToTial:node];
    if(node == NULL) {
        return -1;
    }
    return node.value;
}

- (void)moveToTial:(Node *)node {
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
    
    // connect node's prev and next
    node.prev.next = node.next;
    node.next.prev = node.prev;
}

- (void)put:(NSInteger)key value:(NSInteger)value {
    if([self get:key] != -1) {
        /// get the node from map.
        Node *node = [self.map objectForKey:[NSNumber numberWithInteger:key]];
        /// update node's value.
        node.value = value;
        [self.map setObject:node forKey:[NSNumber numberWithInteger:key]];
        return;
    }
    /// create new node
    Node *node = [[Node alloc] init:key value:value];
    /// LRU Cache is full
    if(self.capacity != 0 && [self.map count] == self.capacity) {
        /// Remove head's next node.
        [self.map removeObjectForKey:[NSNumber numberWithInteger:self.head.next.key]];
        [self disconnect:self.head.next];
    }
    [self.map setObject:node forKey:[NSNumber numberWithInteger:key]];
    /// move node to tail.
    [self moveToTial:node];
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        LRUCache *cache = [[LRUCache alloc] initWith:2];
        [cache put:1 value:1];
        [cache put:2 value:2];
        NSLog(@"cache get:1 %ld", (long)[cache get:1]);
        [cache put:3 value:3];
        NSLog(@"cache get:2 %ld", (long)[cache get:2]);
        [cache put:4 value:4];
        NSLog(@"cache get:1 %ld", (long)[cache get:1]);
        NSLog(@"cache get:3 %ld", (long)[cache get:3]);
        NSLog(@"cache get:4 %ld", (long)[cache get:4]);
    }
    return 0;
}
