//
//  ArraysUtility.h
//  LC
//
//  Created by Zhen Gong on 8/21/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "LC.h"

@interface ArraysUtility : NSObject

+ (nullable NSArray *)generateArray:(int *_Nullable)array size:(int)size;
+ (nullable NSArray *)generateCharMatrix:(char *_Nullable*_Nullable)array row:(int)row col:(int)col;
+ (int *_Nullable*_Nullable)generateBoolMatrix:(int)row col:(int)col;

@end

