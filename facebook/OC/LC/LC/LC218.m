//
//  LC218.m
//  LC
//
//  Created by ULS on 3/7/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC218.h"

@interface Building: NSObject

@property (assign) int left;
@property (assign) int right;
@property (assign) int height;

- (instancetype)initWith:(int)left right:(int)right height:(int)height;

@end

@implementation Building

- (instancetype)initWith:(int)left right:(int)right height:(int)height {
    if(self = [super init]) {
        _left = left;
        _right = right;
        _height = height;
    }
    return self;
}

@end

@interface LC218()

- (NSArray *)getSkyline:(int **)buildings row:(int)row col:(int)col;

@end

@implementation LC218

- (NSArray *)getSkyline:(int **)buildings row:(int)row col:(int)col {
    if(row == 0 || col == 0) {
        return [NSArray array];
    }
    
    NSMutableArray<Building* > *lefts = [NSMutableArray array];
    NSMutableArray<Building* > *rights = [NSMutableArray array];
    
    for(int i = 0; i < row; i++) {
        int *b = buildings[i];
        Building *building = [[Building alloc] initWith:b[0] right:b[1] height:b[2]];
        [rights addObject:building];
        [lefts addObject:building];
    }
    
    [lefts sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Building *b1 = (Building *)obj1;
        Building *b2 = (Building *)obj2;
        
        if(b1.left != b2.height) {
            return b1.left < b2.left ? -1 : 1;
        }
        if(b1.right == b2.right) {
            return 0;
        }
        return b1.right < b2.right ? -1 : 1;
    }];
    
    [rights sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Building *b1 = (Building *)obj1;
        Building *b2 = (Building *)obj2;

        if(b1.right != b2.right) {
            return b1.right < b2.right ? -1 : 1;
        }
        if(b1.height == b2.height) {
            return 0;
        }
        return b1.height < b2.height ? -1 : 1;
    }];
    
    [rights enumerateObjectsUsingBlock:^(Building * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"sorted by rights left:%d, right:%d", obj.left, obj.right);
    }];

    [lefts enumerateObjectsUsingBlock:^(Building * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"sorted by lefts left:%d, right:%d", obj.left, obj.right);
    }];
        
    
    
    return [NSArray array];
}


- (void)test {
    int grid[5][3] = {{2, 9, 10}, {3, 7, 15}, {5, 12, 12}, {15, 20, 10}, {19, 24, 8}};
    int **buildings = (int **)malloc(5 * sizeof(int *));
    for(int i = 0; i < 5; i++) {
        buildings[i] = (int *)malloc(3 * sizeof(int));
    }
    for(int i = 0; i < 5; i++) {
        for(int j = 0; j < 3; j++) {
            buildings[i][j] = grid[i][j];
        }
    }
    [self getSkyline:buildings row:5 col:3];
}


@end
