//
//  NSObject+GZObjectCategory.m
//  LC
//
//  Created by Zhen Gong on 6/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "NSObject+GZObjectCategory.h"
#import <objc/runtime.h>

// https://draveness.me/ao
// https://draveness.me/ao
// https://draveness.me/ao
@implementation NSObject (GZObjectCategory)

//@dynamic categoryProperty;

/*
 @selector(categoryProperty) 也就是参数中的 key，其实可以使用静态指针 static void * 类型的参数来代替，不过在这里，笔者强烈推荐使用
 @selector(categoryProperty) 作为 key 传入。因为这种方法省略了声明参数的代码，并且能很好地保证 key 的唯一性。
 */
- (NSString *)categoryProperty {
    return objc_getAssociatedObject(self, _cmd);
}

/*
 @selector(categoryProperty) 也就是参数中的 key，其实可以使用静态指针 static void * 类型的参数来代替，不过在这里，笔者强烈推荐使用
 @selector(categoryProperty) 作为 key 传入。因为这种方法省略了声明参数的代码，并且能很好地保证 key 的唯一性。
 */
- (void)setCategoryProperty:(NSString *)categoryProperty {
    objc_setAssociatedObject(self, @selector(categoryProperty), categoryProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
