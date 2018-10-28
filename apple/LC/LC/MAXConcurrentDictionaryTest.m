//
//  MAXConcurrentDictionaryTest.m
//  LC
//
//  Created by Zhen Gong on 8/26/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "MAXConcurrentDictionaryTest.h"
#import "MAXConcurrentDictionary.h"

@interface MAXConcurrentDictionaryTest()

@end

@implementation MAXConcurrentDictionaryTest

- (instancetype)init {
    self = [super init];
    if(self) {
        
    }
    return self;
}

- (void)test {
    [self testRead];
}

- (void)testRead {
    MAXConcurrentDictionary<NSString *, NSNumber *> *dict = [[MAXConcurrentDictionary alloc] init];
    dispatch_queue_t queue1 = dispatch_queue_create("com.gongzhen.maxconcurrentdictionary_1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("com.gongzhen.maxconcurrentdictionary_2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue1, ^{
        DLog(@"queue:%@", queue1);
        for(NSInteger i = 0; i < 10; i++) {
            [dict setObject:@(i) forKey:[NSString stringWithFormat:@"%ld", i]];
            DLog(@"key: %@, value: %@", @(i), [NSString stringWithFormat:@"%ld", i]);
        }
    });
    dispatch_async(queue2, ^{
        DLog(@"queue:%@", queue2);
        for(NSInteger i = 0; i < 10; i++) {
            [dict setObject:@(-i) forKey:[NSString stringWithFormat:@"-%ld", i]];
            DLog(@"key: %@, value: %@", @(-i), [NSString stringWithFormat:@"-%ld", i]);
        }
    });
    /// async queue1 and queue2 both write dict concurrently.
    /// async queue1 and queue2 both read dict concurrently.
    dispatch_barrier_sync(queue1, ^{
        [dict enumerateKeysAndObjectsUsingBlock:^(NSString*  _Nonnull key, NSNumber*  _Nonnull obj, BOOL * _Nonnull stop) {
            DLog(@"queue:%@", queue1);
            DLog(@"key: %@, value: %@", key, obj);
        }];
    });
    /// sync queue1 and queue2 both write dict sequentially.
    /// sync queue1 and queue2 both read dict sequentially.
    dispatch_barrier_sync(queue2, ^{
        [dict enumerateKeysAndObjectsUsingBlock:^(NSString*  _Nonnull key, NSNumber*  _Nonnull obj, BOOL * _Nonnull stop) {
            DLog(@"queue:%@", queue2);
            DLog(@"key: %@, value: %@", key, obj);
        }];
    });
}

@end
