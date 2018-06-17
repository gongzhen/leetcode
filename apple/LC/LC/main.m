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
#import "DispatchQueueTTest.h"
#import "DispatchBarrierAsyncTest.h"
#import "DispatchApplyTest.h"
#import "DispatchGroupAsyncTest.h"
#import "DispatchBlockTest.h"
#import "DispatchBlockWaitTest.h"
#import "DispatchBlockNotifyTest.h"
#import "DispatchBlockCancel.h"
#import "DispatchAfterTest.h"
#import "DispatchQueueConcurrentTest.h"
#import "PerformSelectorTest.h"
#import "DipatchQueueAttrMakeWithQosClassTest.h"
#import "DispatchSyncDeadLockTest.h"
#import "DispatchAyncSyncTest.h"
#import "ThreadSafeNSMutableArrayTest.h"

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
//        LC179 *lc179 = [[LC179 alloc] init];
//        [lc179 test];
//        DispatchQueueTTest *obj = [[DispatchQueueTTest alloc] init];
//        [obj test];
//        DispatchBarrierAsyncTest *obj = [[DispatchBarrierAsyncTest alloc] init];
//        [obj test];
//        DispatchApplyTest *obj = [[DispatchApplyTest alloc] init];
//        [obj test];
//        DispatchGroupAsyncTest *obj = [[DispatchGroupAsyncTest alloc] init];
//        [obj test];
//        DispatchBlockTest *obj = [[DispatchBlockTest alloc] init];
//        [obj test];
//        DispatchBlockTest *obj = [[DispatchBlockTest alloc] init];
//        [obj test];
//        DispatchBlockWaitTest *obj = [[DispatchBlockWaitTest alloc] init];
//        [obj test];
//        DispatchBlockNotifyTest *obj = [[DispatchBlockNotifyTest alloc] init];
//        [obj test];
//        DispatchBlockCancel *obj = [[DispatchBlockCancel alloc] init];
//        [obj test];
//        DispatchAfterTest *obj = [DispatchAfterTest new];
//        [obj test];
//        DispatchQueueConcurrentTest *obj = [DispatchQueueConcurrentTest new];
//        [obj test];
//        PerformSelectorTest *obj = [PerformSelectorTest new];
//        [obj test];
//        DispatchSyncDeadLockTest *obj = [[DispatchSyncDeadLockTest alloc] init];
//        [obj test];
//        DipatchQueueAttrMakeWithQosClassTest *obj = [[DipatchQueueAttrMakeWithQosClassTest alloc] init];
//        [obj test];
//        DispatchAyncSyncTest *obj = [DispatchAyncSyncTest new];
//        [obj test];
        ThreadSafeNSMutableArrayTest *obj = [ThreadSafeNSMutableArrayTest new];
        [obj test];
//        [obj testBarrier];
        sleep(30);
    }
    return 0;
}
