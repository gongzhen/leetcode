//
//  CustomCollectionViewCell.m
//  HooView
//
//  Created by Zhen Gong on 6/29/18.
//  Copyright © 2018 Yahoo. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = UIColor.clearColor;
    }
    return self;
}

- (void)configure:(CustomButton *)button {
    [self.contentView addSubview:(UIView *)button];
}

@end
