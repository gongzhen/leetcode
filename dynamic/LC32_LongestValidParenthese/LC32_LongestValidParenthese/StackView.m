//
//  StackView.m
//  LC32_LongestValidParenthese
//
//  Created by Zhen Gong on 5/12/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import "StackView.h"

@interface StackView()
{
    CGFloat _stackViewWidth;
    CGFloat _stackViewHeight;
}
@end

@implementation StackView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _stackViewWidth = 150.f;
        _stackViewHeight = 500.f;
    }
    return self;
}

- (void)layoutSubviews {
    NSLog(@"ratio:%.2f", self.frame.size.width / self.frame.size.height);
    [super layoutSubviews];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *color = [UIColor blueColor];
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, 1.25f);
    CGFloat inset = (self.bounds.size.width - _stackViewWidth) / 8;
    CGContextMoveToPoint(context, inset, inset / 2);
    CGContextAddLineToPoint(context, inset, _stackViewHeight + inset);
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, inset, _stackViewHeight + inset);
    CGContextAddLineToPoint(context, inset + _stackViewWidth, _stackViewHeight + inset);
    CGContextStrokePath(context);    
    CGContextMoveToPoint(context, inset + _stackViewWidth, _stackViewHeight + inset);
    CGContextAddLineToPoint(context, inset + _stackViewWidth, inset / 2);
    CGContextStrokePath(context);
}

@end
