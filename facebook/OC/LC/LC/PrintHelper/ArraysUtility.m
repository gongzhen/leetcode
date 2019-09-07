//
//  ArraysUtility.m
//  LC
//
//  Created by Zhen Gong on 8/21/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "ArraysUtility.h"

@interface ArraysUtility()

@end

@implementation ArraysUtility

+ (NSArray *)generateArray:(int *)array size:(int)size
{
    NSMutableArray * temp = [NSMutableArray new];
    for(int i = 0; i < size; i++) {
        [temp addObject:@(array[i])];
    }
    NSArray *result = [temp copy];
    return result;
}

+ (nullable NSArray *)generateCharMatrix:(char **_Nullable)array row:(int)row col:(int)col
{
    NSMutableArray *matrix = [NSMutableArray new];
    for(int i = 0; i < row; i++) {
        NSMutableArray *row = [NSMutableArray new];
        for (int j = 0; j < col; j++) {
            char c = array[i][j];
            [row addObject:[NSNumber numberWithChar:c]];
        }
        [matrix addObject:row];
    }
    return [matrix copy];
}

+ (int **)generateBoolMatrix:(int)row col:(int)col
{
    int **matrix = (int **)malloc(sizeof(int *) * row);
    for(int i = 0; i < row; i++) {
        matrix[i] = calloc(col, sizeof(int *));
    }
    return matrix;
}
@end
