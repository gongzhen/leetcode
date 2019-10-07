//
//  MenuItemSolution.m
//  Airbnb
//
//  Created by Zhen Gong on 9/18/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import "MenuItemSolution.h"

@interface MenuItem : NSObject
@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) double price;
- (instancetype)initWith:(NSString *)name price:(double)price;
@end

@implementation MenuItem

- (instancetype)initWith:(NSString *)name price:(double)price
{
    if (self = [super init]) {
        self.name = name;
        self.price = price;
    }
    return self;
}

@end

@interface MenuItemSolution()

@property(nonatomic, strong) NSMutableArray<MenuItem *> *list;

@end

@implementation MenuItemSolution

-(instancetype)init {
    if (self = [super init]) {
        self.list = [NSMutableArray array];
        [self.list addObject:[[MenuItem alloc] initWith:@"a" price:1.8]];
        [self.list addObject:[[MenuItem alloc] initWith:@"b" price:1.5]];
        [self.list addObject:[[MenuItem alloc] initWith:@"c" price:1.5]];
        [self.list addObject:[[MenuItem alloc] initWith:@"d" price:1.5]];
        [self.list sortUsingComparator:^NSComparisonResult(MenuItem * _Nonnull obj1, MenuItem  * _Nonnull obj2) {
            if (obj1.price == obj2.price) {
                return 0;
            } else if (obj1.price > obj2.price) {
                return 1;
            } else {
                return -1;
            }
        }];
        [self.list enumerateObjectsUsingBlock:^(MenuItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%@:%f", obj.name, obj.price);
        }];
    }
    return self;
}

- (NSString *)findMenuFor:(double)target {
    NSMutableArray<NSString *> *temp = [NSMutableArray array];
    NSMutableArray<NSMutableArray<NSString *> *> *result = [NSMutableArray array];
    NSMutableArray *visited = [NSMutableArray new];
    for(int i = 0; i < self.list.count; i++) {
        [visited addObject:@(0)];
    }
    [self dfs:result temp:temp target:target visited:visited index:0];
    NSMutableString *str = [NSMutableString string];
    for(NSMutableArray<NSString *> *subList in result) {
        [str appendString:@"["];
        for(NSString *item in subList) {
            [str appendString:item];
            [str appendString:@","];
        }
        [str appendString:@"],"];
    }
    return [str copy];
}

- (void)dfs:(NSMutableArray<NSMutableArray<NSString *> *> *)result
       temp:(NSMutableArray<NSString *> *)temp
     target:(double)target
     visited:(NSMutableArray *)visited
      index:(int)index {
    if (index >= (int)self.list.count || target < 0) {
        return;
    }
    if (target == 0) {
        [result addObject:[temp copy]];
        return;
    }
    
    for (int i = index; i < self.list.count; i++) {
        MenuItem *item = [self.list objectAtIndex:i];
        [temp addObject:item.name];
        [visited replaceObjectAtIndex:i withObject:@(1)];
        [self dfs:result temp:temp target:target - item.price visited:visited index:i + 1];
        [temp removeLastObject];
        [visited replaceObjectAtIndex:i withObject:@(0)];
    }
}

@end
