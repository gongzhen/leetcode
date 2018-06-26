//
//  MobileFormingQ4Test.m
//  LC
//
//  Created by Zhen Gong on 6/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "MobileFormingQ4Test.h"

@interface Employee : NSObject <MoFoEmployee>

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *middleName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSDate *startDate;

@end

@implementation Employee

- (instancetype)initWith:(NSString *)fn ln:(NSString *)ln date:(NSDate *)date {
    if(self = [super init]) {
        _firstName = fn;
        _lastName = ln;
        _startDate = date;
    }
    return self;
}

@end

@implementation MobileFormingQ4Test

- (void)test {
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"MMMM dd,yyyy";
    NSDate *d1 = [formatter dateFromString:@"June 12, 2018"];
    NSDate *d2 = [formatter dateFromString:@"May 22, 2018"];
    NSDate *d3 = [formatter dateFromString:@"May 20, 2018"];
    NSDate *d4 = [formatter dateFromString:@"May 19, 2018"];
    NSDate *d5 = [formatter dateFromString:@"February 02, 2018"];
    NSDate *d6 = [formatter dateFromString:@"August 02, 2017"];
    NSDate *d7 = [formatter dateFromString:@"December 02, 2017"];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps.day = -30;
    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDate *prev = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:NSCalendarSearchBackwards];
    NSDate *prev = [calendar dateByAddingUnit:NSCalendarUnitDay value:-30 toDate:[NSDate date] options:NSCalendarMatchStrictly];
    DLog(@"prev:%@", prev);
    
    Employee *e1 = [[Employee alloc] initWith:@"A" ln:@"A2" date:d1];
    Employee *e2 = [[Employee alloc] initWith:@"B" ln:@"B2" date:d2];
    Employee *e3 = [[Employee alloc] initWith:@"C" ln:@"C2" date:d3];
    Employee *e4 = [[Employee alloc] initWith:@"D" ln:@"D2" date:d4];
    Employee *e5 = [[Employee alloc] initWith:@"E" ln:@"E2" date:d5];
    Employee *e6 = [[Employee alloc] initWith:@"F" ln:@"F2" date:d6];
    Employee *e7 = [[Employee alloc] initWith:@"G" ln:@"G2" date:d7];
    NSArray<id<MoFoEmployee>> *employee = @[e1, e2, e3, e4, e5, e6, e7];
    [self printEmployeeName:employee];
}

- (void)printEmployeeName:(NSArray<id<MoFoEmployee>> *)employees {
    // get current date and find all employees at least 30days.
    // 30 * 24 * 60 * 60
//    NSTimeInterval timeDiff = 30 * 24 * 60 * 60; // 30days gap: 30 days * 24 hours * 60 mins * 60 seconds
//    NSTimeInterval todayTimeInterval = [[NSDate date] timeIntervalSince1970];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate* thirdDaysAgo = [calendar dateByAddingUnit:NSCalendarUnitDay value:-30 toDate:[NSDate date] options:NSCalendarMatchStrictly];
    __block NSMutableArray<id<MoFoEmployee>> *moreThan30days = [NSMutableArray array];
    [employees enumerateObjectsUsingBlock:^(id<MoFoEmployee> obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj.startDate compare:thirdDaysAgo] == NSOrderedAscending) {
            [moreThan30days addObject:obj];
        }
    }];
    
    [moreThan30days sortUsingComparator:^NSComparisonResult(id<MoFoEmployee> e1, id<MoFoEmployee> e2) {
        return [e1.startDate compare:e2.startDate];
    }];
    [moreThan30days enumerateObjectsUsingBlock:^(id<MoFoEmployee>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"fn:%@ ln:%@ date:%@", obj.firstName, obj.lastName, obj.startDate);
    }];
}

@end
