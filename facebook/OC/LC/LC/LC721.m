//
//  LC721.m
//  LC
//
//  Created by ULS on 3/7/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC721.h"

@interface LC721()

- (NSArray *)accountsMerge:(NSArray <NSArray <NSString *> *> *)accounts;

@end

@implementation LC721

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
        }
    }
    
    [graph enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSMutableArray * _Nonnull obj, BOOL * _Nonnull stop) {
        DLog(@"key:%@", key);
        [obj enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *email = (NSString *)obj;
            DLog(@"email:%@", email);
        }];
    }];
    return [NSArray array];
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
