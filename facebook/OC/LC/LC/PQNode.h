//
//  PQNode.h
//  LC
//
//  Created by ULS on 3/31/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC.h"

@interface PQNode : NSObject

@property(assign)int row, col, val;

- (instancetype)initWithRow:(int)row col:(int)col val:(int)val;

@end
