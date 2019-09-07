//
//  NSArray+PrintUtility.h
//  LC
//
//  Created by Zhen Gong on 8/21/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (PrintUtility)

- (void)printArrayFromStartIndex:(int)startIndex endIndex:(int)endIndex;

@end

@interface NSMutableArray(SwapArray)

- (void)swapFromIndex:(int)startIndex toIndex:(int)endIndex;
- (void)reverseFromIndex:(int)startIndex toIndex:(int)endIndex;

@end

