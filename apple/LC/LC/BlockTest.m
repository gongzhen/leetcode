//
//  BlockTest.m
//  LC
//
//  Created by ULS on 4/11/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "BlockTest.h"

@implementation BlockTest

- (void)test {
    [self test1];
    [self test2];
    [self test3];
}

- (void)test1 {
    int x = 123;
    
    void (^printXAndY)(int) = ^(int y) {
        
        printf("line 24 ===> x:%d y:%d\n", x, y);
    };
    
    printXAndY(456); // prints: 123 456
}

- (void)test2 {
    int x = 123;
    
    void (^printXAndY)(int) = ^(int y) {
        
        y = x + y; // error
        printf("line 36 ===> x:%d y:%d\n", x, y);
    };
    printXAndY(456);
}

- (void)test3 {
    __block int x = 123; //  x lives in block storage
    int y = 456;
    void (^printXAndY)(int) = ^(int y) {
        
        x = x + y; /// x value will change because x is __block
        printf("line 47 ===> x:%d y:%d\n", x, y);
        y = 0; /// will not change y value.
    };
    DLog(@"x:%d y:%d\n", x, y);
    printXAndY(y); // prints: 579 456
    DLog(@"x:%d y:%d\n", x, y);
}
@end
