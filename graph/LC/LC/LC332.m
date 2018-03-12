//
//  LC332.m
//  LC
//
//  Created by ULS on 3/9/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC332.h"
#import "PriorityQueue.h"
#import "Stack.h"

@interface LC332()

- (NSArray *)findItinerary:(NSArray<NSArray *> *)tickets;
- (NSArray *)findItineraryBFS:(NSArray<NSArray *> *)tickets;

@end

@implementation LC332

- (NSArray *)findItineraryBFS:(NSArray<NSArray *> *)tickets {
    if(tickets.count == 0) {
        return [NSArray array];
    }
    
    NSMutableDictionary<NSString *, PriorityQueue *> *map = [NSMutableDictionary dictionary];
    [tickets enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([map objectForKey:[obj objectAtIndex:0]] == NULL) {
            [map setObject:[[PriorityQueue alloc] init] forKey:[obj objectAtIndex:0]];
        }
        PriorityQueue *pq = [map objectForKey:[obj objectAtIndex:0]];
        [pq offer:[obj objectAtIndex:1]];
        [map setObject:pq forKey:[obj objectAtIndex:0]];
    }];
    
    [map enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, PriorityQueue * _Nonnull obj, BOOL * _Nonnull stop) {
//        DLog(@"key:%@", key);
//        [obj printPQ];
    }];
    
    NSMutableArray *res = [NSMutableArray array];
    Stack *stack = [[Stack alloc] init];
    
    [stack push:@"JFK"];
    
    while(![stack empty]) {
        NSString *peek = (NSString *)[stack peek];
        DLog(@"peek:%@", peek);
        while([map objectForKey:[stack peek]] != NULL && [map objectForKey:[stack peek]].isEmpty != YES) {
            PriorityQueue *pq = [map objectForKey:peek];
            [pq printPQ];
            NSString *pop = [pq poll];
            DLog(@"targets.get(stack.peek()).poll():%@", pop);
            [stack push:pop];
            DLog(@"[stack peek]:%@", [stack peek]);
        }
        NSString *spop = (NSString *)[stack pop];
        DLog(@"spop:%@", spop);
        [res insertObject:spop atIndex:0];
    }
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"res:%@", obj);
    }];
    return [res copy];
}

- (NSArray *)findItinerary:(NSArray<NSArray *> *)tickets {
    if(tickets.count == 0) {
        return [NSArray array];
    }
    
    NSMutableDictionary<NSString *, PriorityQueue *> *map = [NSMutableDictionary dictionary];
    [tickets enumerateObjectsUsingBlock:^(NSArray * _Nonnull list, NSUInteger idx, BOOL * _Nonnull stop) {
        if([map objectForKey:[list objectAtIndex:0]] == NULL) {
            PriorityQueue *pq = [[PriorityQueue alloc] init];
            [map setObject:pq forKey:[list objectAtIndex:0]];
        }
        PriorityQueue *pq = [map objectForKey:[list objectAtIndex:0]];
        [pq offer:[list objectAtIndex:1]];
        [map setObject:pq forKey:[list objectAtIndex:0]];
    }];
    [map enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, PriorityQueue * _Nonnull obj, BOOL * _Nonnull stop) {
        DLog(@"key:%@ ==> %@", key, obj);
    }];
    NSMutableArray *res = [NSMutableArray array];
    [self dfs:map res:res origin:@"JFK"];
    return [res copy];
}

- (void)dfs:(NSMutableDictionary<NSString *, PriorityQueue *> *)map res:(NSMutableArray *)res origin:(NSString *)origin {
    DLog(@"origin:%@", origin);
    PriorityQueue *pq = [map objectForKey:origin];
    while(pq != NULL && ![pq isEmpty]) {
        NSString *dest = (NSString *)[pq poll];
        [self dfs:map res:res origin:dest];
    }
    [res insertObject:origin atIndex:0];
}

- (void)test {
//    NSArray *list1 = @[@[@"MUC", @"LHR"], @[@"JFK", @"MUC"], @[@"SFO", @"SJC"], @[@"LHR", @"SFO"]];
//    NSArray *res = [self findItinerary:list1];
//    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"%@", (NSString *)obj);
//    }];
//
//    NSArray *list2 = @[@[@"JFK", @"SFO"], @[@"JFK", @"ATL"], @[@"SFO", @"ATL"], @[@"ATL", @"JFK"], @[@"ATL", @"SFO"]];
//    NSArray *res2 = [self findItinerary:list2];
//    [res2 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"%@", (NSString *)obj);
//    }];
    
    NSArray *list1 = @[@[@"MUC", @"LHR"], @[@"JFK", @"MUC"], @[@"SFO", @"SJC"], @[@"LHR", @"SFO"]];
    NSArray *res = [self findItineraryBFS:list1];
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"%@", (NSString *)obj);
    }];
    
//    NSArray *list2 = @[@[@"JFK", @"SFO"], @[@"JFK", @"ATL"], @[@"SFO", @"ATL"], @[@"ATL", @"JFK"], @[@"ATL", @"SFO"]];
//    NSArray *res2 = [self findItineraryBFS:list2];
//    [res2 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"%@", (NSString *)obj);
//    }];
}

@end
