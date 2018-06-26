//
//  MobileFormingQ1UnitTest.m
//  LC
//
//  Created by Zhen Gong on 6/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "MobileFormingQ1UnitTest.h"
#import "MobileFormingQ1Test.h"

@interface MobileFormingQ1UnitTest()

@end

@implementation MobileFormingQ1UnitTest

- (void)test {
    [self setUp];
}

- (void)setUp {
    MobileFormingQ1Test *obj = [[MobileFormingQ1Test alloc] init];
    NSAssert([MobileFormingQ1Test conformsToProtocol:@protocol(FizzBuzzProtocol)], @"Fail");
    NSAssert([[obj startTest:9] isEqualToString:@"Fizz"], @"Fail");
    NSAssert([[obj startTest:15] isEqualToString:@"FizzBuzz"], @"Fail");
    NSAssert([[obj startTest:30] isEqualToString:@"FizzBuzz"], @"Fail");
    NSAssert([[obj startTest:32] isEqualToString:@""], @"Fail");
}

@end
