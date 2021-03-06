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
#import "RuntimeTest.h"
#import "DispatchSemaphoreTest.h"
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
#import "MobileFormingQ1UnitTest.h"
#import "MobileFormingQ4Test.h"
#import "DispatchAfterCounterTest.h"
#import "RespondsToSelectorTest.h"
#import "DispatchQueueAttrMakeWithQosClassTest.h"
#import "MAXConcurrentDictionaryTest.h"
#import "ForwardInvocationTest.h"
#import "PropertySynthesizeDynamicTest.h"
#import "TouchesBeganWithSharedThreads.h"
#import "GZBlockOperationTest.h"
#import "MultithreadSaveMoney.h"
#import "UnfairLock.h"
#import "PthreadMutexLocl.h"
#import "ConditionLock.h"
#import "DispatchSemaphoreLock.h"
#import "DispatchbarrierasyncLock.h"
#import "ConsumerProducer.h"

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
//        DispatchSemaphoreTest *semaphoreTest = [[DispatchSemaphoreTest alloc] init];
//        [semaphoreTest test];
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
        DispatchQueueConcurrentTest *obj = [DispatchQueueConcurrentTest new];
        [obj test];
//        PerformSelectorTest *obj = [PerformSelectorTest new];
//        [obj test];
//        DispatchSyncDeadLockTest *obj = [[DispatchSyncDeadLockTest alloc] init];
//        [obj test];
//        DipatchQueueAttrMakeWithQosClassTest *obj = [[DipatchQueueAttrMakeWithQosClassTest alloc] init];
//        [obj test];
//        DispatchAyncSyncTest *obj = [DispatchAyncSyncTest new];
//        [obj test];
//        ThreadSafeNSMutableArrayTest *obj = [ThreadSafeNSMutableArrayTest new];
//        [obj test];
//        [obj testBarrier];
//        MobileFormingQ1UnitTest *obj = [MobileFormingQ1UnitTest new];
//        [obj test];
//        MobileFormingQ4Test* obj = [MobileFormingQ4Test new];
//        [obj test];
//        DispatchAfterCounterTest *obj = [DispatchAfterCounterTest new];
//        [obj test];
//        RespondsToSelectorTest *obj = [RespondsToSelectorTest new];
//        [obj test];
//        DispatchQueueAttrMakeWithQosClassTest *obj = [DispatchQueueAttrMakeWithQosClassTest new];
//        [obj test];
//        MAXConcurrentDictionaryTest *obj = [[MAXConcurrentDictionaryTest alloc] init];
//        [obj test];
//        sleep(5);
//        ForwardInvocationTest *forward = [[ForwardInvocationTest alloc] init];
        // [forward testMethod];
//        [forward performSelector:@selector(testMethod:)];
//        PropertySynthesizeDynamicTest *obj = [[PropertySynthesizeDynamicTest alloc] init];
//        TouchesBeganWithSharedThreads *obj = [[TouchesBeganWithSharedThreads alloc] init];
//        [obj test];
//        RuntimeTest *obj = [[RuntimeTest alloc] init];
//        [obj test];
//        GZBlockOperationTest *obj = [[GZBlockOperationTest alloc] init];
//        [obj test];
//        MultithreadSaveMoney *multiSaveMoney = [[MultithreadSaveMoney alloc] init];
//        [multiSaveMoney test];
//        UnfairLock *unfairLock = [[UnfairLock alloc] init];
//        [unfairLock test];
//        PthreadMutexLocl *pthead = [[PthreadMutexLocl alloc] init];
//        [pthead test];
//        ConditionLock *conditionLock = [[ConditionLock alloc] init];
//        [conditionLock test];
//        DispatchSemaphoreLock *semaphoreLock = [[DispatchSemaphoreLock alloc] init];
//        [semaphoreLock test];
//        DispatchbarrierasyncLock *barrierLock = [[DispatchbarrierasyncLock alloc] init];
//        [barrierLock test];
//        ConsumerProducer *consumerProducer = [[ConsumerProducer alloc] init];
//        [consumerProducer test];
        sleep(20);
    }
    return 0;
}
