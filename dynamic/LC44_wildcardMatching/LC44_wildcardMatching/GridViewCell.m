//
//  GridViewCell.m
//  LC44_wildcardMatching
//
//  Created by Zhen Gong on 5/11/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import "GridViewCell.h"

@interface GridViewCell()

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation GridViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _installViewConstraints];
    }
    return self;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.font = [UIFont systemFontOfSize:24.f];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.adjustsFontSizeToFitWidth = YES;
        _contentLabel.minimumScaleFactor = 12.f/14.f;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (void)_installViewConstraints {
    [self.contentView addSubview:self.contentLabel];
    self.contentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [self.contentLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
    [self.contentLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor].active = YES;
    [self.contentLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor].active = YES;
}

- (void)setContentlabelWith:(NSString *)content {
    self.contentLabel.text = content;
}

@end

