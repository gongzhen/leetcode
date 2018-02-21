//
//  LC57.m
//  LC
//
//  Created by ULS on 2/19/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC57.h"
#import "Interval.h"

@interface LC57()

- (NSArray *)insert:(NSArray *)intervals newInterval:(Interval *)newInterval;

@end

@implementation LC57

- (NSArray *)insert:(NSArray *)intervals newInterval:(Interval *)newInterval {
    NSMutableArray *res = [NSMutableArray array];
    
    int i = 0; /// start pointer i = 0;
    
    // list:        [1,         2(end)], [3, 4], [5, 6] //
    // newInterval: [3.5(start), 4.5]
    while (i < intervals.count && newInterval.start > ((Interval *)[intervals objectAtIndex:i]).end) {
        [res addObject:[intervals objectAtIndex:i]];
        i++;
    }
    // newInterval.start <= intervasl[i].end
    // [3, 4(end)], [5, 6(end)] //
    // [3.5(start), 4.5] or [2.5(start), 4.5] or [2,5(start), 2.9]
    NSInteger start = newInterval.start;
    NSInteger end = newInterval.end;
    /// [2, 4], [[6, 9], [7, 12]]
    while(i < intervals.count && end >= ((Interval *)[intervals objectAtIndex:i]).start) { /// if end < start, just add it to res.
        // [3(start), 4], [5, 6] //
        // [3.5, 4.5(end)] or [2.5, 4.5(end)] or [3.5, 10]
        start = MIN(start, ((Interval *)[intervals objectAtIndex:i]).start);
        end = MAX(end, ((Interval *)[intervals objectAtIndex:i]).end);
        /// it will loop all the intervals and compare start and end.
        i++;
    }
    //              MIN MAX     MIN    MAX
    // new interval [3, 4.5] or [2.5, 4.5]
    [res addObject:[[Interval alloc] initWith:start e:end]];
    
    while(i < intervals.count) {
        [res addObject:[intervals objectAtIndex:i]];
        i++;
    }
    return [res copy];
}

- (void)test {
    Interval *interval1 = [[Interval alloc] initWith:1 e:3];
    Interval *interval2 = [[Interval alloc] initWith:6 e:9];
    Interval *interval3 = [[Interval alloc] initWith:2 e:5];
    NSArray *intervals = @[interval1, interval2];
    NSArray *res = [self insert:intervals newInterval:interval3];
    [res enumerateObjectsUsingBlock:^(Interval *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"[%ld, %ld]", obj.start, obj.end);
    }];
}

@end
