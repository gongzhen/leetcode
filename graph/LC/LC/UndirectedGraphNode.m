//
//  UndirectedGraphNode.m
//  LC
//
//  Created by Admin  on 3/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "UndirectedGraphNode.h"

@interface UndirectedGraphNode()

@end

@implementation UndirectedGraphNode

- (instancetype)initWith:(NSInteger)x {
    if(self = [super init]) {
        _label = x;
        _neighbors = [NSMutableArray array];
    }
    return self;
}
@end
