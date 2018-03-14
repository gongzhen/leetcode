//
//  UndirectedGraphNode.m
//  LC
//
//  Created by Admin  on 3/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "UndirectedGraphNode.h"

@interface UndirectedGraphNode() <NSCopying>

@end

@implementation UndirectedGraphNode

- (instancetype)initWith:(NSInteger)x {
    if(self = [super init]) {
        _label = x;
        _neighbors = [NSMutableArray array];
    }
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    UndirectedGraphNode *copy = [UndirectedGraphNode allocWithZone:zone];
    copy.label = _label;
    copy.neighbors = [_neighbors mutableCopy];
    return copy;
}
@end
