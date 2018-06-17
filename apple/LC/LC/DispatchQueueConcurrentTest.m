//
//  DispatchQueueConcurrentTest.m
//  LC
//
//  Created by Zhen Gong on 6/2/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "DispatchQueueConcurrentTest.h"

@implementation DispatchQueueConcurrentTest

- (void)test {
    dispatch_queue_t gcd = dispatch_queue_create("This is serial Queue", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t gcd = dispatch_queue_create("This is Concurrent Queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(gcd, ^{NSLog(@"b0");});
    dispatch_async(gcd, ^{NSLog(@"b1");});
    dispatch_async(gcd, ^{NSLog(@"b2");});
    dispatch_async(gcd, ^{NSLog(@"b3");});
    dispatch_async(gcd, ^{NSLog(@"b4");});
    dispatch_async(gcd, ^{NSLog(@"b5");});
    dispatch_async(gcd, ^{NSLog(@"b6");});
    dispatch_async(gcd, ^{NSLog(@"b7");});
    dispatch_async(gcd, ^{NSLog(@"b8");});
    dispatch_async(gcd, ^{NSLog(@"b9");});
    dispatch_async(gcd, ^{NSLog(@"b10");});
}

@end
