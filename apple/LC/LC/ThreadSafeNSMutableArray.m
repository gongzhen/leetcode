//
//  ThreadSafeNSMutableArray.m
//  LC
//
//  Created by Zhen Gong on 6/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//  https://blog.csdn.net/kongdeqin/article/details/53171189
//  https://developer.apple.com/videos/play/wwdc2011/210/
//  https://stackoverflow.com/questions/28784507/adding-items-to-swift-array-across-multiple-threads-causing-issues-because-arra/28784770#28784770
//

#import "ThreadSafeNSMutableArray.h"

@interface ThreadSafeNSMutableArray() {
    CFMutableArrayRef _array;
    CGFloat _capacity;
}

@property (nonatomic, strong) dispatch_queue_t syncQueue;

@end

@implementation ThreadSafeNSMutableArray

/*
 数组线程安全的思考
 NSMutableArray是线程不安全的，当有多个线程同时对数组进行操作的时候可能导致崩溃或数据错误，下面是我对线程安全的几个思路，希望由此能给你带来一些思路，如果有错误的地方还希望大家能够指出
 1.对数组的读写都加锁，虽然数组是线程安全了，但失去了多线程的优势
 
 2.然后又想可以只对写操作加锁然后定义一个全局变量来表示现在有没有写操作，如果有写操作就等写完了在读，那么问题来了如果一个线程先读取数据紧接着一个线程对数组写的操作，
 读的时候还没有加锁同样会导致崩溃或数据错误，这个方案pass掉
 
 3.第三种方案说之前先介绍一下dispatch_barrier_async，dispatch_barrier_async 追加到 queue 中后，会等待 queue 中的任务都结束后，
 再执行 dispatch_barrier_async 的任务，等 dispatch_barrier_async 的任务结束后，才恢复任务执行， 用dispatch_async和dispatch_barrier_async结合保证NSMutableArray的线程安全，
 用dispatch_async读和dispatch_barrier_async写（add,remove,replace），当有任务在读的时候写操作会等到所有的读操作都结束了才会写，同样当有写任务时，读任务会等写操作完了才会读，
 既保证了线程安全又发挥了多线程的优势，但还是有个不足，当我们重写读的方法时dispatch_async是另开辟线程去执行的而且是立马返回的，所以我们不能拿到执行结果，需要去另写一个方法来返回读的结果，
 但是我们又不想改变调用者的习惯于是又想到了一下方案
 
 4.用dispatch_sync和dispatch_barrier_async结合保证NSMutableArray的线程安全，dispatch_sync是在当前线程上执行不会另开辟新的线程，当线程返回的时候就可以拿到读取的结果，
 我认为这个方案是最完美的选择，既保证的线程安全有发挥了多线程的优势还不用另写方法返回结果，完美~
 
 */
- (instancetype)init
{
    if(self = [super init]) {
        _capacity = 10;
        _array = CFArrayCreateMutable(kCFAllocatorDefault, 10,  &kCFTypeArrayCallBacks);
    }
    return self;
}

- (instancetype)initWithCapacity:(NSUInteger)numItems
{
    self = [super init];
    if (self)
    {
        _capacity = numItems;
        _array = CFArrayCreateMutable(kCFAllocatorDefault, numItems,  &kCFTypeArrayCallBacks);
    }
    return self;
}

//- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    if(self = [super initWithCoder:aDecoder]) {
//        
//    }
//    return self;
//}

// read
- (NSUInteger)count {
    __block NSUInteger result;
    dispatch_sync(self.syncQueue, ^{
        result = CFArrayGetCount(self->_array);
    });
    return result;
}

// read
- (_Nonnull id)objectAtIndex:(NSUInteger)index {
    __block id result;
    dispatch_sync(self.syncQueue, ^{
        NSUInteger count = CFArrayGetCount(self->_array);
        result = index<count ? CFArrayGetValueAtIndex(self->_array, index) : nil;
    });
    return result;
}

// write
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    __block NSUInteger blockindex = index;
    dispatch_barrier_async(self.syncQueue, ^{
        if (!anObject) {
            return;
        }
        NSUInteger count = CFArrayGetCount(self->_array);
        if (blockindex > count) {
            blockindex = count;
        }
        CFArrayInsertValueAtIndex(self->_array, index, (__bridge const void *)anObject);
    });
}

// write
- (void)removeObjectAtIndex:(NSUInteger)index
{
    dispatch_barrier_async(self.syncQueue, ^{
        NSUInteger count = CFArrayGetCount(self->_array);
        NSLog(@"count:%lu,index:%lu",(unsigned long)count,(unsigned long)index);
        if (index < count) {
            CFArrayRemoveValueAtIndex(self->_array, index);
        }
    });
}

// write
- (void)addObject:(id)anObject
{
    if (!anObject)
        return;
    dispatch_barrier_async(self.syncQueue, ^{
        CFArrayAppendValue(self->_array, (__bridge const void *)anObject);
    });
}

// write
- (void)removeLastObject
{
    dispatch_barrier_async(self.syncQueue, ^{
        NSUInteger count = CFArrayGetCount(self->_array);
        if (count > 0) {
            CFArrayRemoveValueAtIndex(self->_array, count-1);
        }
    });
}

// write
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (!anObject)
        return;
    dispatch_barrier_async(self.syncQueue, ^{
        NSUInteger count = CFArrayGetCount(self->_array);
        if(index >= count) {
            return;
        }
        CFArraySetValueAtIndex(self->_array, index, (__bridge const void*)anObject);
    });
}

// write
- (void)removeAllObjects
{
    dispatch_barrier_async(self.syncQueue, ^{
        CFArrayRemoveAllValues(self->_array);
    });
}

// read.
- (NSUInteger)indexOfObject:(id)anObject{
    
    if (!anObject)
        return NSNotFound;
    __block NSUInteger result;
    dispatch_sync(self.syncQueue, ^{
        NSUInteger count = CFArrayGetCount(self->_array);
        result = CFArrayGetFirstIndexOfValue(self->_array, CFRangeMake(0, count), (__bridge const void *)(anObject));
    });
    return result;
}

// read
- (void)iterateArray {
    dispatch_sync(self.syncQueue, ^{
        NSUInteger count = CFArrayGetCount(self->_array);
        for(int i = 0; i < count; i++) {
            id result = CFArrayGetValueAtIndex(self->_array, i);
            DLog(@"iterateArray: [%d]%@", i, result);
        }
    });
}

#pragma mark - Private
- (dispatch_queue_t)syncQueue {
    static dispatch_queue_t queue = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = dispatch_queue_create("com.gongzhen.ThreadSafeNSMutableArray", DISPATCH_QUEUE_CONCURRENT);
    });
    return queue;
}

@end

