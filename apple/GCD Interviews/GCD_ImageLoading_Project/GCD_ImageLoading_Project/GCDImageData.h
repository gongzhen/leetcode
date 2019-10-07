//
//  GCDImageData.h
//  GCD_ImageLoading_Project
//
//  Created by Zhen Gong on 9/7/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCDImageData : NSObject

#pragma mark 索引
@property (nonatomic,assign) int index;

#pragma mark 图片数据
@property (nonatomic,strong) NSData *data;

@end

NS_ASSUME_NONNULL_END
