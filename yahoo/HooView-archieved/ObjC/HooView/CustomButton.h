//
//  CustomButton.h
//  HooView
//
//  Created by Zhen Gong on 6/29/18.
//  Copyright © 2018 Yahoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIButton

@property(copy, nonatomic) NSString *btnIdx;
@property(copy, nonatomic) NSString *colorSet;
@property(copy, nonatomic) NSString *poemLine;
@property(copy, nonatomic) NSString *poemTitle;
@property(strong, nonatomic) UIImageView *bgImage;


- (void)configure:(NSDictionary *)dict;

@end
