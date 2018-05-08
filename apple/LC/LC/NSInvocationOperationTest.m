//
//  NSInvocationOperationTest.m
//  LC
//
//  Created by Zhen Gong on 5/8/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "NSInvocationOperationTest.h"

@implementation NSInvocationOperationTest

- (void)test {
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"value1" forKey:@"key1"];
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(operationSelector:) object:dict];
    DLog(@"start before");
    [op start];
    DLog(@"start after");
}

- (void)operationSelector:(NSDictionary *)dict {
    // 接收传进来的dict
    DLog(@"dictValue = %@", [dict valueForKey:@"key1"]);
    sleep(10);  // 加个睡眠模仿耗时操作
    DLog(@"currentThread = %@", [NSThread currentThread]);
    DLog(@"mainThread = %@", [NSThread mainThread]);
}

@end
