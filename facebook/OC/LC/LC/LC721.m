//
//  LC721.m
//  LC
//
//  Created by ULS on 3/7/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC721.h"
#import "NSMutableArray+Stack.h"

@interface LC721()

- (NSArray *)accountsMerge:(NSArray <NSArray <NSString *> *> *)accounts;

@end

@implementation LC721

/**
 Given a list accounts, each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account.
 Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some email that is common to both accounts. Note that even if two accounts have the same
 name, they may belong to different people as people could have the same name. A person can have any number of accounts initially, but all of their accounts definitely have the same name.
 After merging the accounts, return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts
 themselves can be returned in any order.
 */

- (NSArray *)accountsMerge:(NSArray <NSArray <NSString *> *> *)accounts {
    NSMutableDictionary *emailToName = [NSMutableDictionary dictionary];
    NSMutableDictionary<NSString *, NSMutableArray *> *graph = [NSMutableDictionary dictionary];
    for(NSArray <NSString *> *list in accounts) {
        NSString *name = @"";
        for(NSString *element in list) {
            if([name isEqualToString:@""]) {
                name = [element copy];
                continue;
            }
            if([graph objectForKey:element] == NULL) {
                NSMutableArray *emailList = [NSMutableArray array];
                [graph setObject:emailList forKey:element];
            }
            NSMutableArray *emailList = [graph objectForKey:element];
            [emailList addObject:list[1]];
            [graph setObject:emailList forKey:element];
            
            if([graph objectForKey:list[1]] == NULL) {
                NSMutableArray *emailList = [NSMutableArray array];
                [graph setObject:emailList forKey:list[1]];
            }
            NSMutableArray *anotherEmailList = [graph objectForKey:list[1]];
            [anotherEmailList addObject:element];
            [graph setObject:anotherEmailList forKey:list[1]];
            [emailToName setObject:name forKey:element];
        }
    }
    
    [graph enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSMutableArray * _Nonnull obj, BOOL * _Nonnull stop) {
        DLog(@"key:%@", key);
        [obj enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *email = (NSString *)obj;
            DLog(@"email:%@", email);
        }];
    }];
    
    [emailToName enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        DLog(@"key: %@, value: %@", key, obj);
    }];
    
    NSMutableSet *visitedSet = [NSMutableSet set];
    NSMutableArray *ans = [NSMutableArray array];
    for(NSString *email in graph.allKeys) {
        if(![visitedSet containsObject:email]) {
            [visitedSet addObject:email];
            NSMutableArray *stack = [NSMutableArray array];
            NSMutableArray *component = [NSMutableArray array];
            [stack push:email];
            while(stack.count != 0) {
                NSString *node = (NSString *)[stack pop];
                [component addObject:node];
                for(NSString *nei in [graph objectForKey:node]) {
                    if(![visitedSet containsObject:nei]) {
                        [visitedSet addObject:nei];
                        [stack push:nei];
                    }
                }
            }
            [component sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
            [component insertObject:[emailToName objectForKey:email] atIndex:0];
            [ans addObject:component];
        }
    }
    
    return [ans copy];
}

- (void)test {
    NSArray *list1 = @[@"John", @"johnsmith@mail.com", @"john00@mail.com"];
    NSArray *list2 = @[@"John", @"johnnybravo@mail.com"];
    NSArray *list3 = @[@"John", @"johnsmith@mail.com", @"john_newyork@mail.com"];
    NSArray *list4 = @[@"Mary", @"mary@mail.com"];
    NSArray *accounts = @[list1, list2, list3, list4];
    [self accountsMerge:accounts];
    
}
@end
