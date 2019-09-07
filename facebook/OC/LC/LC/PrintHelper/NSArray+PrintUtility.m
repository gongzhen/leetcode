//
//  NSArray+PrintUtility.m
//  LC
//
//  Created by Zhen Gong on 8/21/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "NSArray+PrintUtility.h"

@implementation NSArray(PrintUtility)

- (void)printArrayFromStartIndex:(int)startIndex endIndex:(int)endIndex
{
    if ((endIndex - startIndex) < 0 || (endIndex - startIndex) >= self.count) {
        return;
    }
    if (self) {
        [[self subarrayWithRange:NSMakeRange(startIndex, (endIndex - startIndex + 1))] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DLog(@"%@", obj);
        }];
    }
}

@end

@implementation NSMutableArray(SwapArray)

- (void)swapFromIndex:(int)startIndex toIndex:(int)endIndex
{
    id tmp = [self objectAtIndex:startIndex];
    id rightObj = [self objectAtIndex:endIndex];
    [self replaceObjectAtIndex:startIndex withObject:rightObj];
    [self replaceObjectAtIndex:endIndex withObject:tmp];
}

- (void)reverseFromIndex:(int)startIndex toIndex:(int)endIndex
{
    int i = startIndex;
    int j = endIndex;
    while(i <= j) {
        [self swapFromIndex:i toIndex:j];
        i++;
        j--;
    }
}
@end
