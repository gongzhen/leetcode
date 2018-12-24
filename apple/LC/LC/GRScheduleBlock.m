//
//  GRScheduleBlock.m
//  LC
//
//  Created by Zhen Gong on 12/22/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "GRScheduleBlock.h"

dispatch_queue_attr_t GRGCDQueueDefaultAttribute(void){
    return dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_DEFAULT, 0);
}

@implementation GRScheduleBlock


static void schedule(dispatch_block_t block) {
    static NSRunLoop *runLoop = nil;
    static dispatch_queue_t queue = nil;
    static dispatch_once_t onceToken;
    static dispatch_group_t group = nil;
    
    dispatch_once(&onceToken, ^{
        group = dispatch_group_create();
        queue = dispatch_queue_create("com.db.schedule.queue", GRGCDQueueDefaultAttribute());
        dispatch_group_enter(group);
        NSThread *thread = [[NSThread alloc] initWithBlock:^{
            runLoop = [NSRunLoop currentRunLoop];
            CFRunLoopSourceContext ctx = {0};
            ctx.version = 0;
            // ctx.perform = _schedule_source_perform(&onceToken);
            ctx.info = nil;
            CFRunLoopSourceRef rlx = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &ctx);
            CFRunLoopAddSource(CFRunLoopGetCurrent(), rlx, kCFRunLoopCommonModes);
            CFRelease(rlx);
            dispatch_group_leave(group);
            [runLoop run];
        }];
        thread.name = @"db listener";
        [thread start];
    });
    
    dispatch_async(queue, ^{
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        [runLoop performBlock:block];
    });
}

@end
