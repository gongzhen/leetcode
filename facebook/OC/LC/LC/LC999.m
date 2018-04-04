//
//  LC999.m
//  LC
//
//  Created by ULS on 3/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC999.h"
#import "LCPoint.h"
#import "PriorityQueue.h"

@interface LC999()

/// Find the K closest points to the origin in a 2D plane, given an array containing N points.

- (NSArray *)findKClosest:(NSArray<LCPoint *> *)p k:(int)k;

@end

@implementation LC999

- (NSArray *)findKClosest:(NSArray<LCPoint *> *)p k:(int)k {
    if(p.count == 0) {
        return [NSArray array];
    }
    NSMutableArray *res = [NSMutableArray array];
    PriorityQueue *pq = [[PriorityQueue alloc] init];
    pq.comparator = ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        LCPoint *p1 = (LCPoint *)obj1;
        LCPoint *p2 = (LCPoint *)obj2;
        if((p2.x * p2.x + p2.y * p2.y) > (p1.x * p1.x + p1.y * p1.y)) {
            return NSOrderedDescending;
        } else if((p2.x * p2.x + p2.y * p2.y) == (p1.x * p1.x + p1.y * p1.y)) {
            return NSOrderedSame;
        }
        return NSOrderedAscending;
    };
    
    
    for(int i = 0; i < [p count]; i++) {
        DLog(@"p.x%d p.y:%d", p[i].x, p[i].y);
        if(i < k) {
            [pq offer:p[i]];
        } else {
            LCPoint *top = [pq peek];
            if(p[i].x * p[i].x + p[i].y * p[i].y - (top.x * top.x + top.y * top.y) < 0) {
                [pq poll];
                [pq offer:p[i]];
            }
        }
        [pq printPQ];
    }
    

    
    while(![pq isEmpty]) {
        [res addObject:[pq poll]];
    }
    return res;
}

- (void)test {
    LCPoint* p1 = [[LCPoint alloc] initWith:1 y:3]; /// 10
    LCPoint* p2 = [[LCPoint alloc] initWith:4 y:3]; /// 25
    LCPoint* p3 = [[LCPoint alloc] initWith:2 y:5]; /// 29
    LCPoint* p4 = [[LCPoint alloc] initWith:2 y:3]; /// 13
    LCPoint* p5 = [[LCPoint alloc] initWith:3 y:2]; /// 13
    LCPoint* p6 = [[LCPoint alloc] initWith:3 y:8]; /// 73
    NSMutableArray *points = [NSMutableArray array];
    [points addObject:p1];
    [points addObject:p2];
    [points addObject:p3];
    [points addObject:p4];
    [points addObject:p5];
    [points addObject:p6];
    NSArray *res = [self findKClosest:points k:3];
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LCPoint *p = (LCPoint *)obj;
        DLog(@"p.x%d p.y:%d", p.x, p.y);
        
    }];
    
}
@end
