//
//  QuickSort.h
//  LC
//
//  Created by ULS on 3/2/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC.h"

@interface QuickSort : LC

+(void)quickSort:(char *)array size:(int)size;
+(void)quickSortInt:(int *)array size:(int)size;
+(void)printIntArray:(int *)array size:(int)size;
+(void)printCharMatrix:(char **)matrix row:(int)row col:(int)col;
+(void)printIntMatrix:(int **)matrix row:(int)row col:(int)col;

@end
