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
    DLog(@"SampleClass is delocated.");
}

- (void)sampleMethod {
    
}

@end


@class Child;

@interface Parent: NSObject

@property(strong, nonatomic)Child *child;

- (void)sampleMethod;
@end

@implementation Parent

- (void)dealloc {
    DLog(@"Parent is delocated.");
}

- (void)sampleMethod {
    
}

@end

@interface Child: NSObject

// @property(weak, nonatomic)Parent *parent;
@property(strong, nonatomic)Parent *parent;
- (void)sampleMethod;

@end

@implementation Child

- (void)dealloc {
    DLog(@"Child is delocated.");
}

- (void)sampleMethod {
}

@end

@implementation RetainCount

- (void)test {
    [self test3];
}

- (void)test1 {
    SampleClass *sampleClass = [[SampleClass alloc] init];
    [sampleClass sampleMethod];
    NSLog(@"Retain Count after initial allocation: %d", [[sampleClass valueForKey:@"retainCount"] intValue]);
    SampleClass *sampleClass1 = sampleClass; /// without __weak, sampleClass1 will never released.
    // __weak SampleClass *sampleClass1 = sampleClass;
    DLog(@"Retain Count after retain: %d", [[sampleClass valueForKey:@"retainCount"] intValue]);
    DLog(@"Retain1 Count after retain: %d", [[sampleClass1 valueForKey:@"retainCount"] intValue]);
    /// Now reference count is 2 because two pointers reference the same memory.
    // Should set the object to nil
    sampleClass = nil;
    DLog(@"Retain Count after retain: %d", [[sampleClass valueForKey:@"retainCount"] intValue]);
    DLog(@"Retain1 Count after retain: %d", [[sampleClass1 valueForKey:@"retainCount"] intValue]);
    sampleClass1 = nil;
    DLog(@"Retain Count after retain: %d", [[sampleClass valueForKey:@"retainCount"] intValue]);
    DLog(@"Retain1 Count after retain: %d", [[sampleClass1 valueForKey:@"retainCount"] intValue]);

}

- (void)test2 {
    NSString *str1 = [NSString new];
    DLog(@"Retain Count after initial allocation: %d", [[str1 valueForKey:@"retainCount"] intValue]);
}

- (void)test3 {
    Parent *parent = [Parent new];
    DLog(@"parent Retain Count after initial allocation: %d", [[parent valueForKey:@"retainCount"] intValue]); /// 1
    Child *child = [Child new];
    DLog(@"child Retain Count after initial allocation: %d", [[parent valueForKey:@"retainCount"] intValue]); /// 1
    parent.child = child;
    child.parent = parent;
    DLog(@"parent Retain Count after initial allocation: %d", [[parent valueForKey:@"retainCount"] intValue]); /// 2 two pointers point to memory.
    DLog(@"child Retain Count after initial allocation: %d", [[parent valueForKey:@"retainCount"] intValue]);  /// 2
    parent = nil; /// child still point to parent
    child = nil;  /// parent still point to child
    /**
     parent --> [Parent memory: var child] (2)
                    |   |         |   |               /// parent and child point to each other.
     child -->  [Child memory: var parent] (2)
     
     parent = nil   [Parent memory: var child] (1)
                                        |   |       /// Memory cannot be dellocated because they still point to each other.
     child = nil    [Child memory: var parent] (1)

     
     */
    DLog(@"parent Retain Count after initial allocation: %d", [[parent valueForKey:@"retainCount"] intValue]);
    DLog(@"child Retain Count after initial allocation: %d", [[parent valueForKey:@"retainCount"] intValue]);
}

@end
