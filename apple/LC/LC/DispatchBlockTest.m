//
//  DispatchBlockTest.m
//  LC
//
//  Created by Zhen Gong on 5/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "DispatchBlockTest.h"

@implementation DispatchBlockTest

- (void)test {
    //normal way
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.starming.gcddemo.concurrentqueue",DISPATCH_QUEUE_CONCURRENT);
    dispatch_block_t block = dispatch_block_create(0, ^{
        NSLog(@"run block");
    });
    dispatch_async(concurrentQueue, block);
    
    //QOS way
    dispatch_block_t qosBlock = dispatch_block_create_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1, ^{
        NSLog(@"run qos block");
    });
    dispatch_async(concurrentQueue, qosBlock);
}
@end
