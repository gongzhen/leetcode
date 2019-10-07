//
//  RuntimeTest.m
//  LC
//
//  Created by Zhen Gong on 7/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "RuntimeTest.h"
#import <objc/message.h>
#import <objc/runtime.h>

@implementation GZRunTime

- (void)getName:(NSString *)name {
    NSLog(@"%@", name);
}

- (NSString *)findName {
    return NSStringFromClass([self class]);
}

@end

@interface RuntimeTest()

@end

@implementation RuntimeTest

- (void)test {
    GZRunTime *gz = [[GZRunTime alloc] init];
    Class myClass = [gz class];
    NSLog(@"myClass: %@ is from super class: %@", NSStringFromClass(myClass), NSStringFromClass(class_getSuperclass(myClass)));
    
    SEL selector = @selector(getName:);
    NSLog(@"selector: %@", NSStringFromSelector(selector));
    
    Method method = class_getInstanceMethod([gz class], @selector(getName:));
    NSLog(@"%d arguments here.", method_getNumberOfArguments(method));
    
    if ([gz respondsToSelector:@selector(getName:)]) {
        // [gz getName:@"MyName is GZ"];
        [gz performSelector:@selector(getName:) withObject:@"My Name is GONG ZHEN"];
    }
    
    void (*castMsgSend)(id, SEL, NSString*) = (void*)objc_msgSend;
    castMsgSend(gz, @selector(getName:), @"My name is gongzhen");
    
    NSString *findName = objc_msgSend(gz, @selector(findName));
    NSLog(@"findName is %@", findName);
    
    
}

@end
