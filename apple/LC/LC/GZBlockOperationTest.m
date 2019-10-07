//
//  GZBlockOperationTest.m
//  LC
//
//  Created by Zhen Gong on 10/1/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "GZBlockOperationTest.h"
#import "GZBlockOperation.h"

@implementation GZBlockOperationTest

- (void)test {
    GZBlockOperation *operation0 = [GZBlockOperation blockOperationWithBlock:^{
        NSLog(@"operation 0 is executed");
    }];

    GZBlockOperation *operation1 = [GZBlockOperation blockOperationWithBlock:^{
        NSLog(@"operation 1 is executed");
    }];
    GZBlockOperation *operation2 = [GZBlockOperation blockOperationWithBlock:^{
        NSLog(@"operation 2 is executed");
    }];
    [operation2 addDependency:operation0];
    [operation2 addDependency:operation1];
    [operation0 start];
    [operation1 start];
    [operation2 start];
}

@end
