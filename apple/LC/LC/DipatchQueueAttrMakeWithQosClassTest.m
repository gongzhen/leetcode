//
//  DipatchQueueAttrMakeWithQosClassTest.m
//  LC
//
//  Created by Zhen Gong on 6/12/18.
//  Copyright © 2018 ULS. All rights reserved.
// http://www.cocoachina.com/ios/20160225/15422.html

#import "DipatchQueueAttrMakeWithQosClassTest.h"

@implementation DipatchQueueAttrMakeWithQosClassTest

- (void)test {
    //dipatch_queue_attr_make_with_qos_class
    dispatch_queue_attr_t attr = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_UTILITY, -1);
    dispatch_queue_t queue = dispatch_queue_create("com.starming.gcddemo.qosqueue", attr);
    [self test3];
}

- (void)test1 {
    //dispatch_set_target_queue
    dispatch_queue_t queue = dispatch_queue_create("com.starming.gcddemo.settargetqueue",NULL); //需要设置优先级的queue
    dispatch_queue_t referQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0); //参考优先级
    dispatch_set_target_queue(queue, referQueue); //设置queue和referQueue的优先级一样
}

- (void)test2 {
    dispatch_queue_t queue1 = dispatch_queue_create("com.company.queue1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("com.company.queue2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue1, ^{    // block1
        for (int i = 0; i < 5; i ++) {
            NSLog(@"+++++");
        }
    });
    dispatch_async(queue1, ^{ // block2
        for (int i = 0; i < 5; i ++) {
            NSLog(@"=====");
        }
    });
    dispatch_async(queue2, ^{    // block3
        for (int i = 0; i < 5; i ++) {
            NSLog(@"----");
        }
    });
}

- (void)test3 {
    dispatch_queue_t queue1 = dispatch_queue_create("com.company.queue1", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("com.company.queue2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_set_target_queue(queue1, queue2);
    
    dispatch_async(queue1, ^{
        for (int i = 0; i < 5; i ++) {
            NSLog(@"+++++");
        }
    });
    dispatch_async(queue1, ^{
        for (int i = 0; i < 5; i ++) {
            NSLog(@"=====");
        }
    });
    dispatch_async(queue2, ^{
        for (int i = 0; i < 5; i ++) {
            NSLog(@"----");
        }
    });
}

@end
