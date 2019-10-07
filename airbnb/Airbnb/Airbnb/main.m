//
//  main.m
//  Airbnb
//
//  Created by Zhen Gong on 9/18/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Queue.h"
#import "Queue+Internal.h"
#import "MenuItemSolution.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        // [Queue test];
        MenuItemSolution *obj = [[MenuItemSolution alloc] init];
        NSString *res = [obj findMenuFor:3.0];
        NSLog(@"res:%@", res);
        
    }
    return 0;
}
