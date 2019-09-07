//
//  CustomCollectionViewCell.h
//  HooView
//
//  Created by Zhen Gong on 6/29/18.
//  Copyright © 2018 Yahoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomButton;

@interface CustomCollectionViewCell : UICollectionViewCell

- (void)configure:(CustomButton *)button;

@end
