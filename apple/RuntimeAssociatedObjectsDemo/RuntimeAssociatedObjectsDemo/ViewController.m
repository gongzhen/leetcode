//
//  ViewController.m
//  RuntimeAssociatedObjectsDemo
//
//  Created by Zhen Gong on 9/21/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface UIView (DefaultColor)

@property(strong, nonatomic) UIColor *defaultColor;
@end

@implementation UIView (DefaultColor)

static char kDefaultColorKey;

- (void)setDefaultColor:(UIColor *)defaultColor {
    objc_setAssociatedObject(self, &kDefaultColorKey, defaultColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)defaultColor {
    return objc_getAssociatedObject(self, &kDefaultColorKey);
}

@end

@interface ViewController ()

@end

/**
 https://www.jianshu.com/p/bf51e9d52188
 https://juejin.im/post/5ac0a6116fb9a028de44d717
 
 */
@implementation ViewController

+ (void)load {
    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = [self class];
//        SEL originalSelector = @selector(viewDidLoad);
//        SEL swizzledSelector = @selector(gzViewDidLoad);
//
//        Method originalMethod = class_getInstanceMethod(class, originalSelector);
//        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
//
//        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
//        if (didAddMethod) {
//            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
//        } else {
//            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
//    });
    
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(xxx_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        // ...
        // Method originalMethod = class_getClassMethod(class, originalSelector);
        // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setDefaultColor:UIColor.greenColor];
    NSLog(@"self.view.defaultColor:%@", self.view.defaultColor);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view setBackgroundColor:self.view.defaultColor];
    [button setFrame:CGRectMake(0, 0, 300, 200)];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:40]];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [button setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    button.center = self.view.center;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:UIColor.whiteColor];
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated]; /// 2: call here 2nd.
    NSLog(@"original viewWillAppear: %@", self);
}


- (void)xxx_viewWillAppear:(BOOL)animated {
    [self xxx_viewWillAppear:animated]; /// 1: call here 1st
    NSLog(@"xxx_viewWillAppear: %@", self);
}


- (void)gzViewDidLoad {
    NSLog(@"gzViewDidLoad");
    [self gzViewDidLoad];
}

- (void)buttonPressed:(UIButton *)sender {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                    message:@"Runtime Testin" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"CANCEL" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}


@end
