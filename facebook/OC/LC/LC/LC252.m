//
//  LC252.m
//  LC
//
//  Created by ULS on 2/17/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC252.h"
#import "Interval.h"

@interface LC252()

- (BOOL)canAttendMeetings:(NSArray *)intervals;

@end

@implementation LC252

- (BOOL)canAttendMeetings:(NSArray *)intervals {
    if(intervals.count == 0) {
        return YES;
    }
    
    [intervals sortedArrayUsingComparator:^NSComparisonResult(Interval*  _Nonnull obj1, Interval*  _Nonnull obj2) {
        return obj1.start - obj2.start;
    }];
    
    Interval *prev = (Interval *)[intervals objectAtIndex:0];
    for(NSInteger i = 1; i < intervals.count; i++) {
        if(prev.end > ((Interval *)[intervals objectAtIndex:i]).start) {
            return NO;
        }
    }
    return YES;
}

- (void)test {
    Interval *interval1 = [[Interval alloc] initWith:0 e:30];
    Interval *interval2 = [[Interval alloc] initWith:5 e:10];
    Interval *interval3 = [[Interval alloc] initWith:15 e:20];
    NSArray *intervals = @[interval1, interval2, interval3];
    DLog(@"res:%d", [self canAttendMeetings:intervals]);
}

@end
