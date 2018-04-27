//
//  QuickSort.m
//  LC
//
//  Created by ULS on 3/2/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "QuickSort.h"

@interface QuickSort()

+ (void)quickSort:(char *)array left:(int)left right:(int)right;

@end

@implementation QuickSort

+(void)quickSortInt:(int *)array size:(int)size {
    if(size == 0) {
        return;
    }
    
    int left = 0;
    int right = size - 1;
    
    [self quickSortInt:array left:left right:right];
}

+ (void)quickSortInt:(int *)array left:(int)left right:(int)right {
    if(left >=  right) {
        return;
    }
    
    int i = left;
    int j = right;
    int pivot = array[left];
    while(i <= j) {
        while (i <= j && array[i] < pivot) {
            i++;
        }
        while (i <= j && array[j] > pivot) {
            j--;
        }
        if(i <= j) {
            int temp = array[i];
            array[i] = array[j];
            array[j] = temp;
            i++;
            j--;
        }
    }
    
    if(left < j) {
        [self quickSortInt:array left:left right:j];
    }
    if(i < right) {
        [self quickSortInt:array left:i right:right];
    }
}

+(void)quickSort:(char *)array size:(int)size {
    if(size == 0) {
        return;
    }
    
    int left = 0;
    int right = size - 1;
    [self quickSort:array left:left right:right];
}

+ (void)quickSort:(char *)array left:(int)left right:(int)right {
    if(left > right) {
        return;
    }
//    DLog(@"%s", array);
    int i = left;
    int j = right;
    char pivot = array[left];
    while(i <= j) {
        while(i <= right && array[i] < pivot) {
            i++;
        }
        while(j >= left && array[j] > pivot) {
            j--;
        }
        if(i <= j) {
            char temp = array[i];
            array[i] = array[j];
            array[j] = temp;
            i++;
            j--;
        }
//        DLog(@"%s", array);
    }
//    DLog(@"%s", array);
    if(left < j) {
        [self quickSort:array left:left right:j];
    }
    
    if(i < right) {
        [self quickSort:array left:i right:right];
    }
    
}

+(void)printCharMatrix:(char **)matrix row:(int)row col:(int)col {
    for(int i = 0; i < row; i++) {
        [self printCharArray:matrix[i] size:col];
    }
}

+(void)printIntMatrix:(int **)matrix row:(int)row col:(int)col {
    for(int i = 0; i < row; i++) {
        [self printIntArray:matrix[i] size:col];
    }
}

+(void)printCharArray:(char *)array size:(int)size {
    for(int i = 0; i < size; i++) {
        printf("%c ", *(array + i));
    }
    printf("\n");
}


+(void)printIntArray:(int *)array size:(int)size {
    for(int i = 0; i < size; i++) {
        printf("%d ", *(array + i));
    }
    printf("\n");
}

@end
