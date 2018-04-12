//
//  RetainCount.m
//  LC
//
//  Created by ULS on 4/11/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "RetainCount.h"

@interface SampleClass: NSObject

- (void)sampleMethod;

@end

@implementation SampleClass

- (void)dealloc {
    DLog(@"obj is delocated.");
}

- (void)sampleMethod {
    
}

@end

@implementation RetainCount

- (void)test {
    [self test2];
}

- (void)test1 {
    SampleClass *sampleClass = [[SampleClass alloc] init];
    [sampleClass sampleMethod];
    NSLog(@"Retain Count after initial allocation: %d", [[sampleClass valueForKey:@"retainCount"] intValue]);
    SampleClass *sampleClass1 = sampleClass; /// without __weak, sampleClass1 will never released.
    // __weak SampleClass *sampleClass1 = sampleClass;
    DLog(@"Retain Count after retain: %d", [[sampleClass valueForKey:@"retainCount"] intValue]);
    DLog(@"Retain Count after retain: %d", [[sampleClass1 valueForKey:@"retainCount"] intValue]);
    // Should set the object to nil
    sampleClass = nil;
    DLog(@"Retain Count after retain: %d", [[sampleClass valueForKey:@"retainCount"] intValue]);
    DLog(@"Retain Count after retain: %d", [[sampleClass1 valueForKey:@"retainCount"] intValue]);
}

- (void)test2 {
    NSString *str1 = [NSString new];
    DLog(@"Retain Count after initial allocation: %d", [[str1 valueForKey:@"retainCount"] intValue]);
}

@end
