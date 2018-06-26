//
//  MobileFormingQ1Test.m
//  LC
//
//  Created by Zhen Gong on 6/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "MobileFormingQ1Test.h"

@interface FizzBuzz:NSObject

@property(weak, nonatomic) id<FizzBuzzProtocol> delegate;
- (NSString *)startFizzBuzz:(NSInteger)number;
@end

@implementation FizzBuzz

- (instancetype)initWithDelegate:(id<FizzBuzzProtocol>)delegate {
    if(self = [super init]) {
        _delegate = delegate;
    }
    return self;
}

- (NSString *)startFizzBuzz:(NSInteger)number {
    return [self.delegate fizzBuzz:number];
}

@end


@interface MobileFormingQ1Test() <FizzBuzzProtocol>

@end

@implementation MobileFormingQ1Test

- (NSString *)startTest:(NSInteger)number {
    FizzBuzz* obj = [[FizzBuzz alloc] initWithDelegate:self];
    return [obj startFizzBuzz:number];
}

- (NSString *)fizzBuzz:(NSInteger)number {
    // check if number is 1 to 100.
    if(number < 1 || number > 100) {
        return @"";
    }
    if( number % 3 == 0 && number % 5 == 0) {
        return @"FizzBuzz";
    } else if (number % 3 == 0 ) {
        return @"Fizz";
    } else if (number % 5 == 0) {
        return @"Buzz";
    }
    return @"";
}

@end
