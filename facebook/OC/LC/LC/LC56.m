//
//  LC56.m
//  LC
//
//  Created by ULS on 2/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC56.h"
#import "Interval.h"

@interface LC56()

- (NSArray *)merge:(NSArray *)intervals;

@end

@implementation LC56

- (NSArray *)merge:(NSArray *)intervals {
    if(intervals.count == 0) {
        return [NSArray array];
    }
    NSMutableArray *res = [NSMutableArray array];
    [intervals sortedArrayUsingComparator:^NSComparisonResult(Interval *  _Nonnull obj1, Interval * _Nonnull obj2) {
        return obj1.start - obj2.start;
    }];
    
    Interval *prev = (Interval *)[intervals objectAtIndex:0];
    for(int i = 1; i < intervals.count; i++) {
        if(prev.end < ((Interval *)[intervals objectAtIndex:i]).start) {
            [res addObject:[[Interval alloc] initWith:prev.start e:prev.end]];
            // prev = [[Interval alloc] initWith:((Interval *)intervals[i]).start e:((Interval *)intervals[i]).end];
            prev.start = ((Interval *)intervals[i]).start;
            prev.end = ((Interval *)intervals[i]).end;
        } else {
            if(prev.end < ((Interval *)[intervals objectAtIndex:i]).end) {
                prev.end = ((Interval *)[intervals objectAtIndex:i]).end;
            }
        }
    }
    [res addObject:prev];
    for(Interval *interval in res) {
        DLog(@"interval{ %ld, %ld}", interval.start, interval.end);
    }
    return [NSArray array];
    
}

- (void)test {
    Interval *interval1 = [[Interval alloc] initWith:1 e:3];
    Interval *interval2 = [[Interval alloc] initWith:2 e:6];
    Interval *interval3 = [[Interval alloc] initWith:8 e:10];
    Interval *interval4 = [[Interval alloc] initWith:15 e:18];
    NSArray *intervals = @[interval1, interval2, interval3, interval4];
    [self merge:intervals];
}

@end
