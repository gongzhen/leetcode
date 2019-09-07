//
//  ColorSetObject.h
//  HooView
//
//  Created by Zhen Gong on 6/29/18.
//  Copyright © 2018 Yahoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorSetObject : NSObject

@property(nonatomic, copy) NSString *color;
@property(nonatomic, assign) NSInteger count;
@property(nonatomic, strong) NSMutableArray *buttonList;

-(instancetype)initWithColor:(NSString *)color count:(NSInteger)count;

@end
