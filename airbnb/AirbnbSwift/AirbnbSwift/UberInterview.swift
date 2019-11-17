//
//  UberInterview.swift
//  AirbnbSwift
//
//  Created by Zhen Gong on 11/15/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import Cocoa

 /*
    Imagine we have an image. We'll represent this image as a simple 2D array where every pixel is a 1 or a 0. The image you get is known to have a single rectangle of 0s on a background of 1s.

    Write a function that takes in the image and returns one of the following representations of the rectangle of 0's: top-left coordinate and bottom-right coordinate OR top-left coordinate, width, and height.

    image1 = [
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 0, 0, 0, 1],
      [1, 1, 1, 0, 0, 0, 1],
      [1, 1, 1, 1, 1, 1, 1],
    ]

    Sample output variations (only one is necessary):

    findRectangle(image1) =>
      a) x: 3, y: 2, width: 3, height: 2
      b) 2,3 3,5 -- row,column of the top-left and bottom-right corners

    Other test cases:

    image2 = [
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 0],
    ]

    findRectangle(image2) =>
      x: 6, y: 4, width: 1, height: 1
      4,6 4,6

    image3 = [
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 0, 0],
      [1, 1, 1, 1, 1, 0, 0],
    ]

    findRectangle(image3) =>
      x: 5, y: 3, width: 2, height: 2
      3,5 4,6
      
    image4 = [
      [0, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
      [1, 1, 1, 1, 1, 1, 1],
    ]

    findRectangle(image4) =>
      x: 0, y: 0, width: 1, height: 1
      0,0 0,0

    image5 = [
      [0],
    ]

    findRectangle(image5) =>
      x: 0, y: 0, width: 1, height: 1
      0,0 0,0

    n: number of rows in the input image
    m: number of columns in the input image
    
    // NSArray *image = @[
    //     @[ @1, @1, @1, @1, @1, @1, @1],
    //     @[ @1, @1, @1, @1, @1, @1, @1],
    //     @[ @1, @1, @1, @0, @0, @0, @1],
    //     @[ @1, @1, @1, @0, @0, @0, @1],
    //     @[ @1, @1, @1, @1, @1, @1, @1],
    // ];
    
    -(NSMutableDictionary<NSString *, NSNumber *> *)findZeroBlock:(NSArray<NSArray<NSNumber *> *> *)matrix row:(int)row col:(int)col {
        if( row == 0 || col == 0) {
            return nil;
        }
        int originX = -1;
        int originY = -1;
        int width = -1;
        int height = -1;
        NSMutableDictionary<NSString *, NSNUmber *> *result = [NSMutableDictioanry dictioanry];
        for(int i = 0; i < row; i++) {
            for(int j = 0; j < col; j++) {
                if (matrx[i][j] == 0) {
                    originX = i; // 0
                    originY = j; // 3
                    // right direction
                    int k = j;
                    for(k < col; k++) {
                        if (matrix[i][k] == 1) {
                            width = k -1 - originY;
                            break;
                        }  else {
                            // skip all 0 until reach the 1
                        }
                    }
                    if (width == -1) { // most of right side of matrix
                        width = col - originY - 1;
                    }
                    
                    k = i;
                    for(k < rol; k++) {
                        if (matrix[j][k] == 1) {
                            height = k - originX - 1;
                            break;
                        }
                    }
                    if (height == -1) { // most of right side of matrix
                        height = rol - originX - 1;
                    }
                    [result setObject:[NSNumber numberWithInt:originX] forKey:@"x"];
                    [result setObject:[NSNumber numberWithInt:originY] forKey:@"y"];
                    [result setObject:[NSNumber numberWithInt:width] forKey:@"width"];
                    [result setObject:[NSNumber numberWithInt:height] forKey:@"height"];
                    return result;
                }
        }
        return result;
    }

NSDicionary* result = [self findZeroBlock:image row: 5, col: 7];
*/

class UberInterview: NSObject {

}
