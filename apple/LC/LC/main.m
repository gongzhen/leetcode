//
//  main.m
//  LC
//
//  Created by ULS on 4/8/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LC42.h"
#import "LC48.h"
#import "LC179.h"
#import "BlockTest.h"
#import "RetainCount.h"
#import "GCDTest.h"
#import "NSBlockOperationTest.h"
#import "NSInvocationOperationTest.h"
#import "OSSpinLockTest.h"
#import "OsUnfairLockTest.h"
#import "RunloopTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        LC42 *lc42 = [[LC42 alloc] init];
//        [lc42 test];
//        LC48 *lc48 = [[LC48 alloc] init];
//        [lc48 test];
//        BlockTest *blockTest = [[BlockTest alloc] init];
//        [blockTest test];
//        RetainCount *retainCount = [[RetainCount alloc] init];
//        [retainCount test];
//        GCDTest *gcdTest = [[GCDTest alloc] init];
//        [gcdTest test];
//        NSBlockOperationTest *obj = [[NSBlockOperationTest alloc] init];
//        [obj test];
//        NSInvocationOperationTest *obj = [[NSInvocationOperationTest alloc] init];
//        [obj test];
//        OSSpinLockTest *obj = [[OSSpinLockTest alloc] init];
//        [obj test];
//        sleep(10);
//        OsUnfairLockTest *obj = [[OsUnfairLockTest alloc] init];
//        [obj test];
//        sleep(14);
//        RunloopTest *obj = [[RunloopTest alloc] init];
//        [obj test];
//        sleep(20);
        LC179 *lc179 = [[LC179 alloc] init];
        [lc179 test];
    }
    return 0;
}
