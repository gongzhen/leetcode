//
//  ForwardInvocationTest.h
//  LC
//
//  Created by Zhen Gong on 12/25/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC.h"

@interface Test1: NSObject

- (void)testMethod;

@end

@interface Test2: NSObject

- (void)testMethod;

@end

@interface ForwardInvocationTest : LC

@end
