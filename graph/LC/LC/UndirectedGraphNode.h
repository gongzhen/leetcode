//
//  UndirectedGraphNode.h
//  LC
//
//  Created by Admin  on 3/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UndirectedGraphNode : NSObject

@property (assign)NSInteger label;
@property (strong, nonatomic)NSMutableArray *neighbors;
- (instancetype)initWith:(NSInteger)x;

@end
