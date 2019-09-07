//
//  CustomButton.m
//  HooView
//
//  Created by Zhen Gong on 6/29/18.
//  Copyright © 2018 Yahoo. All rights reserved.
//

#import "CustomButton.h"

@interface CustomButton()

@property(strong, nonatomic) UILabel *btnLabel;

@end

@implementation CustomButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.blackColor;
        _btnLabel = [[UILabel alloc] initWithFrame:self.frame];
        _btnLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_btnLabel];
    }
    return self;
}

- (void)configure:(NSDictionary *)dict {
    _btnLabel.textColor = UIColor.whiteColor;
    NSString *idx = [dict objectForKey:@"btnIdx"];
    _btnLabel.text = idx;
}



@end
