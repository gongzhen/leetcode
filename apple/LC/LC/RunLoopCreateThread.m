//
//  RunLoopCreateThread.m
//  LC
//
//  Created by Zhen Gong on 9/10/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "RunLoopCreateThread.h"

@interface RunLoopCreateThread()

@property (strong, nonatomic, readonly) NSThread *databaseWriteThread;
@property (strong, nonatomic, readonly) NSThread *databaseReadThread;

@end

@implementation RunLoopCreateThread

+ (RunLoopCreateThread *)sharedInstance {
    static RunLoopCreateThread *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[RunLoopCreateThread alloc] init];
    });
    return instance;
}

- (void)__createDatabaseWriteThread {
    _databaseWriteThread = [[NSThread alloc] initWithTarget:self selector:@selector(__databaseWriteThreadWasActivated) object:nil];
    [_databaseReadThread setName:@"GRDATABASE_WRITE_THREAD"];
    [_databaseReadThread start];
}

- (void)__createDatabaseReadThread {
    _databaseReadThread = [[NSThread alloc] initWithTarget:self selector:@selector(__databaseReadThreadWasActivated) object:nil];
    [_databaseReadThread setName:@"GRDATABASE_READ_THREAD"];
    [_databaseWriteThread start];
}

- (void)__databaseWriteThreadWasActivated {
    @autoreleasepool {
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
        [runloop run];
    }
}

- (void)__databaseReadThreadWasActivated {
    @autoreleasepool {
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [runloop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
        [runloop run];
    }
}

@end
