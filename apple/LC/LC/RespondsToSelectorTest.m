//
//  RespondsToSelectorTest.m
//  LC
//
//  Created by Zhen Gong on 7/17/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "RespondsToSelectorTest.h"

@implementation Tester

-(void) test:(NSString*) msg {
    NSLog(@"test method is called: %@", msg);
}

// -(void) notImp;

@end

@implementation RespondsToSelectorTest
- (void)test {
    Tester *obj = [Tester new];
    SEL s1 = @selector(test:);
    SEL s2 = @selector(notImp);
    
    if([obj respondsToSelector:s1])
    {
        [obj test:@"invoke test method"];
    }
    
    if([obj respondsToSelector:s2])
    {
        [obj notImp];
    }
}

@end
