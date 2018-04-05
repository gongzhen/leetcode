//
//  LC996.m
//  LC
//
//  Created by ULS on 4/4/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC996.h"
#import "LCPoint.h"
#import "PriorityQueue.h"

@interface LC996()

- (NSArray *)findKClosest:(NSArray<LCPoint *> *)p k:(int)k target:(LCPoint *)target;
- (NSArray *)findKClosest_1:(NSArray<LCPoint *> *)p k:(int)k target:(LCPoint *)target;
- (NSArray *)findKClosest_2_quickSelect:(NSArray<LCPoint *> *)p k:(int)k target:(LCPoint *)target;
- (NSArray *)findKClosest_2_quickSelect_2:(NSArray<LCPoint *> *)p k:(int)k target:(LCPoint *)target;

@end

@implementation LC996

- (NSArray *)findKClosest_2_quickSelect_2:(NSArray<LCPoint *> *)p k:(int)k target:(LCPoint *)target {
    if(p.count == 0) {
        return [NSArray array];
    }
    int left = 0;
    int right = (int)p.count - 1;
    __block NSMutableArray<LCPoint *> *mutArray = [NSMutableArray array];
    [p enumerateObjectsUsingBlock:^(LCPoint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mutArray addObject:obj];
    }];
    while(true) {
        int idx = [self partition_2:mutArray left:left right:right target:target];
        if(idx == k - 1) {
            break;
        } else if (idx > k - 1) {
            right = idx - 1;
        } else {
            left = idx + 1;
        }
    }
    NSMutableArray *res = [NSMutableArray array];
    for(int i = 0; i < k; i++) {
        [res addObject:mutArray[i]];
    }
    return res;
}

- (int)partition_2:(NSMutableArray <LCPoint *> *)array left:(int)left right:(int)right target:(LCPoint *) target{
    int i = left;
    int j = right;
    while(i < j) {
        while(i < right && [self less:array[i] pivot:array[left] target:target]) {
            i++;
        }
        while(left < j && [self less:array[left] pivot:array[j] target:target]) {
            j--;
        }
        if(i < j) {
            [self swap:array left:i right:j];
            i++;
            j--;
        }
    }
    
    [self swap:array left:i right:j];
    return j;
}

- (BOOL)less:(LCPoint *)p pivot:(LCPoint *)pivot target:(LCPoint *)target {
    int d2 = [self getDistance:p target:target];
    int d1 = [self getDistance:pivot target:target];
    return d2 < d1;
}

- (NSArray *)findKClosest_2_quickSelect:(NSArray<LCPoint *> *)p k:(int)k target:(LCPoint *)target {
    if(p.count == 0) {
        return [NSArray array];
    }
    int left = 0;
    int right = (int)p.count - 1;
    __block NSMutableArray<LCPoint *> *mutArray = [NSMutableArray array];
    [p enumerateObjectsUsingBlock:^(LCPoint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mutArray addObject:obj];
    }];
    while(true) {
        int idx = [self partition:mutArray left:left right:right target:target];
        if(idx == k - 1) {
            break;
        } else if (idx > k - 1) {
            right = idx - 1;
        } else {
            left = idx + 1;
        }
    }
    
    NSMutableArray *res = [NSMutableArray array];
    for(int i = 0; i < k; i++) {
        [res addObject:mutArray[i]];
    }
    return res;
}

- (int)partition:(NSMutableArray <LCPoint *> *)array left:(int)left right:(int)right target:(LCPoint *) target{
    int idx = left;
    LCPoint *pivot = array[idx];
    int pDist = [self getDistance:pivot target:target];
    [self swap:array left:idx right:right];
    for(int i = left; i <= right; i++) {
        int iDist = [self getDistance:array[i] target:target];
        if(iDist < pDist) {
            [self swap:array left:i right:idx++];
        }
    }
    [self swap:array left:idx right:right];
    return idx;
 }

- (int)getDistance:(LCPoint *)p target:(LCPoint *)target {
    return (p.x - target.x) * (p.x - target.x) + (p.y - target.y) * (p.y - target.y);
}

- (void)swap:(NSMutableArray<LCPoint *> *)array left:(int)left right:(int)right {
    LCPoint *temp = array[left];
    array[left] = array[right];
    array[right] = temp;
}

- (NSArray *)findKClosest_1:(NSArray<LCPoint *> *)p k:(int)k target:(LCPoint *)target {
    if(p.count == 0) {
        return [NSArray array];
    }
    
    PriorityQueue<LCPoint *> *pq = [[PriorityQueue alloc] init];
    pq.comparator = ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        LCPoint *p1 = (LCPoint *)obj1;
        LCPoint *p2 = (LCPoint *)obj2;
        int d2 = (p2.x - target.x) * (p2.x - target.x) + (p2.y - target.y) * (p2.y - target.y);
        int d1 = (p1.x - target.x) * (p1.x - target.x) + (p1.y - target.y) * (p2.y - target.y);
        if(d2 > d1) {
            return 1;
        } else if (d2 == d1) {
            return 0;
        }
        return -1;
    };
    
    for(int i = 0; i < p.count; i++) {
        [pq offer:p[i]];
        if(pq.size > k) {
            [pq poll];
        }
    }
    
    NSMutableArray<LCPoint *> *res = [NSMutableArray array];
    while(![pq isEmpty]) {
        [res addObject:[pq poll]];
    }
    return res;
}

- (NSArray *)findKClosest:(NSArray<LCPoint *> *)p k:(int)k target:(LCPoint *)target {
    if(p.count == 0) {
        return [NSArray array];
    }
    
    PriorityQueue<LCPoint *> *pq = [[PriorityQueue alloc] init];
    pq.comparator = ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        LCPoint *p1 = (LCPoint *)obj1;
        LCPoint *p2 = (LCPoint *)obj2;
        int d2 = (p2.x - target.x) * (p2.x - target.x) + (p2.y - target.y) * (p2.y - target.y);
        int d1 = (p1.x - target.x) * (p1.x - target.x) + (p1.y - target.y) * (p2.y - target.y);
        if(d2 > d1) {
            return 1;
        } else if (d2 == d1) {
            return 0;
        }
        return -1;
    };
    
    for(int i = 0; i < p.count; i++) {
        if(i < k) {
            [pq offer:p[i]];
        } else {
            LCPoint *max = [pq peek];
            int d2 = (max.x - target.x) * (max.x - target.x) + (max.y - target.y) * (max.y - target.y);
            int d1 = (p[i].x - target.x) * (p[i].x - target.x) + (p[i].y - target.y) * (p[i].y - target.y);
            if(d1 < d2) {
                [pq poll];
                [pq offer:p[i]];
            }
        }
    }
    
    NSMutableArray<LCPoint *> *res = [NSMutableArray array];
    while(![pq isEmpty]) {
        [res addObject:[pq poll]];
    }
    return res;
}

- (void)test {
    LCPoint* p0 = [[LCPoint alloc] initWith:0 y:0]; /// 73
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
    // NSArray *res = [self findKClosest_1:points k:3 target:p0];
    // NSArray *res = [self findKClosest_2_quickSelect:points k:3 target:p0];
    NSArray *res = [self findKClosest_2_quickSelect_2:points k:3 target:p0];
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LCPoint *p = (LCPoint *)obj;
        DLog(@"p.x%d p.y:%d", p.x, p.y);
        
    }];
}

@end
