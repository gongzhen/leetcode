//
//  OpenParentheseImageView.m
//  LC32_LongestValidParenthese
//
//  Created by Zhen Gong on 5/12/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//
// https://www.quora.com/How-do-I-create-a-circle-with-a-fill-in-by-percentage-in-Objective-C

#include <math.h>
#import "OpenParentheseImageView.h"

@implementation UIImage(Parenthese)

+ (UIImage *)imageWithSize:(CGSize)size {
    // https://blog.csdn.net/biangabiang/article/details/82993772
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGFloat x = size.width / 2;
    CGFloat y = size.height / 2;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIColor.redColor setStroke];
    CGContextSetLineWidth(context, 5.0);
    CGContextAddArc(context, x, y, x / 2, M_PI_2, -M_PI_2, 0);
    CGContextDrawPath(context, kCGPathStroke);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

@end

@interface OpenParentheseImageView()

@end

@implementation OpenParentheseImageView

- (instancetype)initWithFrame:(CGRect)frame {
    NSLog(@"frame:%@", NSStringFromCGRect(frame));
    if (self = [super initWithFrame:frame]) {
        CGSize size = self.bounds.size;
        UIImage *image = [UIImage imageWithSize:size];
        if (image) {
            [CATransaction begin];
            [CATransaction setDisableActions:YES];
            self.layer.contents = (__bridge id)image.CGImage;
            self.layer.frame = self.bounds;
            [CATransaction commit];
        }
    }
    return self;
}


@end
