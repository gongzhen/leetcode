//
//  LC998.m
//  LC
//
//  Created by ULS on 3/29/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC998.h"
#import "Interval.h"

@interface LC998()

- (NSArray *)mergeIntervalLists:(NSArray *)list1 list2:(NSArray *)list2;
- (NSArray *)mergeIntervalLists_1:(NSArray *)list1 list2:(NSArray *)list2;

@end

@implementation LC998

- (NSArray *)mergeIntervalLists:(NSArray *)list1 list2:(NSArray *)list2 {
    if(list1.count == 0) {
        return list2;
    }
    if(list2.count == 0) {
        return list1;
    }
    
    NSArray *sortedList1 = [list1 sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Interval *int1 = (Interval *)obj1;
        Interval *int2 = (Interval *)obj2;
        
        if(int1.start > int2.start) {
            return NSOrderedDescending;
        } else if (int1.start == int2.start) {
            return NSOrderedSame;
        }
        return NSOrderedAscending;
    }];
    // [self printArray:sortedList1];
    
    NSArray *sortedList2 =  [list2 sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Interval *int1 = (Interval *)obj1;
        Interval *int2 = (Interval *)obj2;
        
        if(int1.start < int2.start) {
            return NSOrderedAscending;
        } else if (int1.start == int2.start) {
            return NSOrderedSame;
        }
        return NSOrderedDescending;
    }];
    // [self printArray:sortedList2];
    NSMutableArray *start = [NSMutableArray array];
    NSMutableArray *end = [NSMutableArray array];
    int i = 0, j = 0;
    while(i < sortedList1.count && j < sortedList2.count) {
        Interval *int1 = sortedList1[i];
        Interval *int2 = sortedList2[j];
        if(int1.start < int2.start) {
            [start addObject:@(int1.start)];
            i++;
        } else {
            [start addObject:@(int2.start)];
            j++;
        }
    }
    while(i < sortedList1.count) {
        Interval *int1 = sortedList1[i];
        [start addObject:@(int1.start)];
        i++;
    }
    while(j < sortedList2.count) {
        Interval *int2 = sortedList2[j];
        [start addObject:@(int2.start)];
        j++;
    }
    
    i = 0;
    j = 0;
    while(i < sortedList1.count && j < sortedList2.count) {
        Interval *int1 = sortedList1[i];
        Interval *int2 = sortedList2[j];
        if(int1.end < int2.end) {
            [end addObject:@(int1.end)];
            i++;
        } else {
            [end addObject:@(int2.end)];
            j++;
        }
    }
    while(i < sortedList1.count) {
        Interval *int1 = sortedList1[i];
        [end addObject:@(int1.end)];
        i++;
    }
    while(j < sortedList2.count) {
        Interval *int2 = sortedList2[j];
        [end addObject:@(int2.end)];
        j++;
    }
    [self printNumArray:start];
    [self printNumArray:end];
    NSMutableArray *res = [NSMutableArray array];
    int endIndex = 0;
    int startIndex = 0;
    i = 0;
    for(; i < start.count; i++) {
        if(endIndex < end.count && [start[i] intValue] > [end[endIndex] intValue]) {
            while(endIndex < end.count && [start[i] intValue] > [end[endIndex] intValue]) {
                endIndex++;
            }
            if(endIndex < end.count) {
                DLog(@"start:%d == end:%d", [start[startIndex] intValue], [end[i - 1] intValue]);
                Interval *current = [[Interval alloc] initWith:[start[startIndex] intValue] e:[end[i - 1] intValue]];
                [res addObject:current];
                startIndex = i;
            }
        }
    }
    Interval *current = [[Interval alloc] initWith:[start[startIndex] intValue] e:[end[i - 1] intValue]];
    [res addObject:current];
    [self printArray:res];
    return res;
}

- (void)printArray:(NSArray<Interval *> *)list {
    [list enumerateObjectsUsingBlock:^(Interval * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"obj.start:%ld obj.end:%ld", obj.start, obj.end);
    }];
}

- (void)printNumArray:(NSArray<NSNumber *> *)list {
    [list enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"%d", [obj intValue]);
    }];
}

- (NSArray *)mergeIntervalLists_1:(NSArray *)list1 list2:(NSArray *)list2 {
    if(list1.count == 0) {
        return list2;
    }
    if(list2.count == 0) {
        return list1;
    }
    
    NSComparator comparator = ^NSComparisonResult(Interval * obj1, Interval *obj2) {
        if(obj1.start == obj2.start) {
            return NSOrderedSame;
        }
        return obj1.start < obj2.start ? NSOrderedAscending : NSOrderedDescending;
    };
    
    NSArray *sortedList1 = [list1 sortedArrayUsingComparator:comparator];
    NSArray *sortedList2 = [list2 sortedArrayUsingComparator:comparator];
    
    NSMutableArray *res = [NSMutableArray array];
    int i = 0;
    int j = 0;
    Interval *prev = NULL;
    if(((Interval *)sortedList1[i]).start < ((Interval *)sortedList2[j]).start) {
        prev = (Interval *)sortedList1[i];
        i++;
    } else {
        prev = (Interval *)sortedList2[i];
        j++;
    }
    
    while (i < sortedList1.count || j < sortedList2.count) {
        if(j == sortedList2.count ||  (i < sortedList1.count && ((Interval *)sortedList1[i]).start < ((Interval *)sortedList2[j]).start)) {
            if(prev.end < ((Interval *)sortedList1[i]).start) {
                [res addObject:prev];
                prev = (Interval *)sortedList1[i];
            } else {
                prev.end = MAX(prev.end, ((Interval *)sortedList1[i]).end);
            }
            i++;
        } else {
            if(prev.end < ((Interval *)sortedList2[j]).start) {
                [res addObject:prev];
                prev = (Interval *)sortedList2[j];
            } else {
                prev.end = MAX(prev.end, ((Interval *)sortedList2[j]).end);
            }
            j++;
        }
    }
    [res addObject:prev];
    [self printArray:res];
    return res;
}

- (void)test {
    Interval *int1 = [[Interval alloc] initWith:16 e:18];
    Interval *int2 = [[Interval alloc] initWith:10 e:14];
    Interval *int3 = [[Interval alloc] initWith:1 e:5];
    NSArray *list1 = @[int1, int2, int3];
    
    Interval *int4 = [[Interval alloc] initWith:13 e:20];
    Interval *int5 = [[Interval alloc] initWith:8 e:11];
    Interval *int6 = [[Interval alloc] initWith:2 e:6];
    NSArray *list2 = @[int4, int5, int6];
    
    [self mergeIntervalLists_1:list1 list2:list2];
}
@end
