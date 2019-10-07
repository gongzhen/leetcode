//
//  Queue+Internal.m
//  Airbnb
//
//  Created by Zhen Gong on 9/18/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import "Queue+Internal.h"

@implementation Queue (Internal)

+ (void)test
{
    Queue *queue = [[Queue alloc] initWith:5];
    [queue offer:@"A"];
    [queue offer:@"B"];
    [queue offer:@"C"];
    [queue offer:@"D"];
    NSLog(@"size:%ld", [queue size]);
    [queue offer:@"E"];
    NSLog(@"size:%ld", [queue size]);
    [queue offer:@"F"];
    NSLog(@"size:%ld", [queue size]);
    [queue offer:@"G"];
    NSLog(@"size:%ld", [queue size]);
    [queue printQueue];
    id last = [queue poll];
    NSLog(@"last:%@", last);
    // [queue printQueue];
    last = [queue poll];
    last = [queue poll];
    last = [queue poll];
    last = [queue poll];
    last = [queue poll];
    [queue printQueue];
}

+ (void)testThreadSafe
{
    
}

@end
