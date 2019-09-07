//
//  PrintHelper.h
//  LC
//
//  Created by Zhen Gong on 8/21/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "LC.h"

NS_ASSUME_NONNULL_BEGIN

@interface PrintHelper : NSObject

+ (void)printDouble:(double)number;
+ (void)printInteger:(NSInteger)number;
+ (void)printString:(nullable NSString *)string;

+ (void)printIntArray:(NSArray<NSNumber *> *)list;
+ (void)printStringArray:(NSArray<NSString *> *)list;

@end

NS_ASSUME_NONNULL_END
