//
//  LCPoint.h
//  LC
//
//  Created by ULS on 3/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCPoint : NSObject

@property(assign)int x;
@property(assign)int y;

- (instancetype)initWith:(int)x y:(int)y;

@end
