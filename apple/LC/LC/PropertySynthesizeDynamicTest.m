//
//  PropertySynthesizeDynamicTest.m
//  LC
//
//  Created by Zhen Gong on 4/21/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "PropertySynthesizeDynamicTest.h"
#import <objc/objc-runtime.h>

@interface DynamicInvalidTest : NSObject

@property (nonatomic, copy) NSString *dynamicInvalidProperty;

/// Implement setter and getter.
@property (nonatomic, copy) NSString *dynamicValidProperty;

/// Add the property from runtime.
@property (nonatomic, copy) NSString *dynamicPropertyAddedFromRuntime;

@end

@implementation DynamicInvalidTest
{
    NSString *_dynamicValidProperty;
    NSString *_dynamicPropertyAddedFromRuntime;
}

/// @dynamic dynamicInvalidProperty;
@dynamic dynamicValidProperty;

/// Add the property from runtime.
@dynamic dynamicPropertyAddedFromRuntime;

- (void)setDynamicValidProperty:(NSString *)dynamicValidProperty {
    _dynamicValidProperty = dynamicValidProperty;
}

- (NSString *)dynamicValidProperty {
    return _dynamicValidProperty;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s: selector=%s", __FUNCTION__, sel_getName(sel));
    if (sel == @selector(setDynamicPropertyAddedFromRuntime:)) {
        class_addMethod([self class], sel, (IMP)setDynamicPropertyAddedFromRuntime, "v@:@");
        return YES;
    }else if (sel == @selector(dynamicPropertyAddedFromRuntime)){
        class_addMethod([self class], sel, (IMP)getDynamicPropertyAddedFromRuntime, "@@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void setDynamicPropertyAddedFromRuntime(id self, SEL _cmd, NSString* dynamicPropertyAddedFromRuntime) {
    if (((DynamicInvalidTest*)self)->_dynamicPropertyAddedFromRuntime != dynamicPropertyAddedFromRuntime) {
        ((DynamicInvalidTest *)self)->_dynamicPropertyAddedFromRuntime = [dynamicPropertyAddedFromRuntime copy];
    }
}

NSString* getDynamicPropertyAddedFromRuntime(id self, SEL _cmd) {
    return ((DynamicInvalidTest *)self)->_dynamicPropertyAddedFromRuntime;
}


@end

@implementation PropertySynthesizeDynamicTest

- (void)test {
//    [self testDynamicInvalidTest];
//    [self testDynamicValidTest];
    [self testDynamicPropertyAddedFromRuntime];
}

- (void) testDynamicInvalidTest {
    DynamicInvalidTest *obj = [[DynamicInvalidTest alloc] init];
    obj.dynamicInvalidProperty = @"dynamicInvalidProperty"; /// program will crash here since we don't implement getter and setter for dynamicInvalidProperty.
    /// 1: remove @dynamic dynamicInvalidProperty;
    /// 2: Implement getter and setter
}

- (void) testDynamicValidTest {
    DynamicInvalidTest *obj = [[DynamicInvalidTest alloc] init];
    obj.dynamicValidProperty = @"dynamicValidProperty";
    NSLog(@"obj.dynamicValidProperty:%@", obj.dynamicValidProperty);
    obj.dynamicValidProperty = @"empty";
    NSLog(@"obj.dynamicValidProperty:%@", obj.dynamicValidProperty);
}

- (void) testDynamicPropertyAddedFromRuntime {
    DynamicInvalidTest *obj = [[DynamicInvalidTest alloc] init];
    obj.dynamicPropertyAddedFromRuntime = @"dynamicPropertyAddedFromRuntime";
    NSLog(@"obj.dynamicPropertyAddedFromRuntimey:%@", obj.dynamicPropertyAddedFromRuntime);
    obj.dynamicPropertyAddedFromRuntime = @"empty";
    NSLog(@"obj.dynamicPropertyAddedFromRuntime:%@", obj.dynamicPropertyAddedFromRuntime);
}

@end
