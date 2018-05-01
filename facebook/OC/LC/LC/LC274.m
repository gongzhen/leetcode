//
//  LC274.m
//  LC
//
//  Created by Admin  on 4/30/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC274.h"
#import "QuickSort.h"

@implementation LC274

-(int)hIndex:(int*)citations citationsSize:(int)citationsSize {
    [QuickSort quickSortInt:citations size:citationsSize];
    int hIndex = 0;
    for(int i = 0; i < citationsSize; i++) {
        int min = MIN(citations[i], citationsSize - i);
        DLog(@"min:%d = MIN(citations[%d]:%d, citationsSize:%d - i:%d = %d)", min, i, citations[i], citationsSize, i, citationsSize - i);
        if(min > hIndex) {
            hIndex = min;
            DLog(@"hIndex:%d = min:%d", hIndex, min);
        }
    }
    return hIndex;
}

- (void)test {
    int array[] = {3, 0, 6, 1, 5};
    int* citations = array;
    [self hIndex:citations citationsSize:5];
}
@end
