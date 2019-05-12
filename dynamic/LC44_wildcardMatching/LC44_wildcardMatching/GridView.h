//
//  GridView.h
//  LC44_wildcardMatching
//
//  Created by Zhen Gong on 5/11/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class GridView;
@class GridModel;

@protocol GridViewDataSource<NSObject>

- (NSInteger)numberOfRowsInGridView:(GridView *)gridView;

- (NSInteger)numberOfColumnsInGridView:(GridView *)gridView;

@end

@interface GridView : UIView

@property (nonatomic, weak, nullable) id<GridViewDataSource> dataSource;

- (instancetype)initWithModel:(GridModel *)model;
- (void)reloadData;

@end
