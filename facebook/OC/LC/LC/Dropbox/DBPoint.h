//
//  DBPoint.h
//  LC
//
//  Created by Zhen Gong on 11/12/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBPoint : NSObject

+ (instancetype)pointWithX:(NSInteger)x Y:(NSInteger)y;

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;

@end

@interface DBSize : NSObject
/** Returns an instance of a DBSize with the provided width and height */
+ (instancetype)sizeWithWidth:(NSInteger)width height:(NSInteger)height;

@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;
@end

NS_ASSUME_NONNULL_END
