//
//  LC256.m
//  LC
//
//  Created by Zhen Gong on 4/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC256.h"

@implementation LC256

- (int)minCost:(int **)costs row:(int)row col:(int)col {
    if(row == 0 || col == 0) {
        return 0;
    }
    
    int red = 0, blue = 0, green = 0;
    for (int i = 0; i < row; i++) {
        int prevRed = red, prevBlue = blue, prevGreen = green;
        red = costs[i][0] + MIN(prevBlue, prevGreen);
        blue = costs[i][1] + MIN(prevRed, prevGreen);
        green = costs[i][2] + MIN(prevRed, prevBlue);
    }
    return MIN(red, MIN(green, blue));
}

- (void)test {
    int cost[3][3] = {{14,2,11},{11,14,5},{14,3,10}};
    int** ptr = (int **)malloc(sizeof(int *) * 3);
    for(int i = 0; i < 3; i++) {
        ptr[i] = cost[i];
    }
    int res = [self minCost:ptr row:3 col:3];
    DLog(@"res:%d", res);
    [self free_DoubleArray:ptr row:3 col:3];
}
@end
