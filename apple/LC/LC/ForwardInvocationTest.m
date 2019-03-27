//
//  ForwardInvocationTest.m
//  LC
//
//  Created by Zhen Gong on 12/25/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "ForwardInvocationTest.h"

@implementation Test1

- (void)testMethod {
    NSLog(@"Test1 => testMethod1");
}

@end

@implementation Test2

- (void)testMethod {
    NSLog(@"Test2 => testMethod2");
}

@end

@implementation ForwardInvocationTest

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(testMethod)) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if (anInvocation.selector == @selector(testMethod)) {
        Test1 *t1 = [[Test1 alloc] init];
        Test2 *t2 = [[Test2 alloc] init];
        [anInvocation invokeWithTarget:t1];
        [anInvocation invokeWithTarget:t2];
    }
}

@end
