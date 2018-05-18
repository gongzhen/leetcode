//
//  DispatchBlockNotifyTest.m
//  LC
//
//  Created by Zhen Gong on 5/18/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "DispatchBlockNotifyTest.h"

@implementation DispatchBlockNotifyTest

- (void)test {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.starming.gcddemo.serialqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_block_t firstBlock = dispatch_block_create(0, ^{
        NSLog(@"first block start");
        [NSThread sleepForTimeInterval:2.f];
        NSLog(@"first block end");
    });
    dispatch_async(serialQueue, firstBlock);
    dispatch_block_t secondBlock = dispatch_block_create(0, ^{
        NSLog(@"second block run");
    });
    //first block执行完才在serial queue中执行second block
    dispatch_block_notify(firstBlock, serialQueue, secondBlock);
    NSLog(@"dispatch_block_notify");
}
@end
