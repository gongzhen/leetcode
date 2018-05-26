//
//  LC995.m
//  LC
//
//  Created by Zhen Gong on 5/26/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC995.h"

@interface GrindrNode: NSObject <NSCopying>

@property(assign)NSInteger value;
@property(copy, nonatomic) NSArray<GrindrNode *> *neighbors;

@end

@implementation GrindrNode

- (instancetype)initWithValue:(NSInteger)value
{
    self = [super init];
    if (self) {
        _value = value;
        _neighbors = [NSArray array];
    }
    return self;
}

-(instancetype)copyWithZone:(NSZone *)zone {
    GrindrNode *copy = [[[self class] allocWithZone:zone] initWithValue:_value];
    return copy;
}

@end

@interface GrindrGraph : NSObject

@property(copy, nonatomic) NSArray<GrindrNode *> *nodes;

@end

@implementation GrindrGraph

- (instancetype)initWithNodes:(NSArray<GrindrNode *> *)nodes
{
    self = [super init];
    if (self) {
        _nodes = [nodes copy];
    }
    return self;
}

@end


@implementation LC995

- (GrindrGraph *)cloneGraph:(GrindrGraph *)graph {
    if(graph == nil || graph.nodes.count == 0) {
        return nil;
    }
    
    NSMutableArray<GrindrNode *> *tempList = [NSMutableArray array];
    NSMutableDictionary *nodeMap = [NSMutableDictionary dictionary];
    for(GrindrNode *node in graph.nodes) {
        GrindrNode *cloneNode = [[GrindrNode alloc] initWithValue:node.value];
        [tempList addObject:cloneNode];
        [nodeMap setObject:cloneNode forKey:@(node.value)];
    }
//    NSArray<GrindrNode *> *cloneList = [[NSArray alloc] initWithArray:tempList copyItems:YES];
    NSArray<GrindrNode *> *cloneList = [tempList copy];
//    DLog(@"tempList:%p", tempList);
//    [tempList enumerateObjectsUsingBlock:^(GrindrNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"tempList:%p => value:%ld", obj, obj.value);
//    }];
//
//    [tempList removeAllObjects];
//    tempList = nil;
//
//    DLog(@"cloneList:%p", cloneList);
//    [cloneList enumerateObjectsUsingBlock:^(GrindrNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"cloneList:%p => value:%ld", obj, obj.value);
//    }];
    
    for(GrindrNode *node in graph.nodes) {
        GrindrNode *cloneNode = [nodeMap objectForKey:@(node.value)];
        if(cloneNode != nil) {
            DLog(@"cloneNode:%p => value:%ld", cloneNode, cloneNode.value);
            NSMutableArray* tempList = [NSMutableArray array];
            for(GrindrNode *neighbor in node.neighbors) {
                if([nodeMap objectForKey:@(neighbor.value)]) {
                    [tempList addObject:[nodeMap objectForKey:@(neighbor.value)]];
                }
            }
            cloneNode.neighbors = [tempList copy];
        }
    }
    
    GrindrGraph *cloneGraph = [[GrindrGraph alloc] initWithNodes:cloneList];
    return cloneGraph;
}

- (void)test {
    GrindrNode* n1 = [[GrindrNode alloc] initWithValue:1];
    GrindrNode* n2 = [[GrindrNode alloc] initWithValue:2];
    GrindrNode* n3 = [[GrindrNode alloc] initWithValue:3];
    GrindrNode* n4 = [[GrindrNode alloc] initWithValue:4];
    GrindrNode* n5 = [[GrindrNode alloc] initWithValue:5];
    GrindrNode* n6 = [[GrindrNode alloc] initWithValue:6];
    n1.neighbors = @[n2, n3, n4];
    n2.neighbors = @[n3, n4];
    n3.neighbors = @[n4];
    n4.neighbors = @[n1];
    n5.neighbors = @[n6];
    NSArray<GrindrNode *> *nodes = @[n1, n2, n3, n4, n5, n6];
    GrindrGraph *graph = [[GrindrGraph alloc] initWithNodes:nodes];
    GrindrGraph *cloneGraph = [self cloneGraph:graph];
    [cloneGraph.nodes enumerateObjectsUsingBlock:^(GrindrNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"obj:%p => value:%ld", obj, obj.value);
        [obj.neighbors enumerateObjectsUsingBlock:^(GrindrNode* _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DLog(@"neighbor:%p => value:%ld", obj, obj.value);
        }];
        DLog(@"---------------------------------------------------------------")
    }];
    
}

@end
