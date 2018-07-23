//
//  DispatchQueueAttrMakeWithQosClassTest.m
//  LC
//
//  Created by Zhen Gong on 7/23/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "DispatchQueueAttrMakeWithQosClassTest.h"

@interface DispatchQueueAttrMakeWithQosClassTest()

@property(strong, nonatomic) dispatch_queue_t queue;
@property(assign) NSInteger count;

@end

@implementation DispatchQueueAttrMakeWithQosClassTest

- (void)test {
    dispatch_queue_attr_t queueAttributes = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_BACKGROUND, 0);
    self.queue = dispatch_queue_create("com.gongzhen.myQueue", queueAttributes);
    self.count = 0;
    DLog(@"self.count:%ld", self.count);
    dispatch_async(self.queue, ^{
        DLog(@"self.count:%ld", self.count);
        for(int i = 0; i < 10000; i++) {
            self.count++;
        }
        DLog(@"self.count:%ld", self.count);
    });
    
    dispatch_barrier_async(self.queue, ^{
        DLog(@"self.count:%ld", self.count);
    });
    DLog(@"self.count:%ld", self.count);
}
@end
