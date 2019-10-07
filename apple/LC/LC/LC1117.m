//
//  LC1117.m
//  LC
//
//  Created by Zhen Gong on 9/23/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "LC1117.h"

@interface LC1117()
{
    
}

@property(strong, nonatomic)dispatch_queue_t serialQueue;

@end

@implementation LC1117

- (instancetype)init
{
    self = [super init];
    if (self) {
        _serialQueue = dispatch_queue_create("dispatch_serial_queue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)hydrogen {
    // dispatch_barrier_syn
    dispatch_barrier_sync(self.serialQueue, ^{
        
    });
}

- (void)oxygen {
    // dispatch_barrier_syn
    dispatch_barrier_sync(self.serialQueue, ^{
        
    });
}

- (void)test:(NSString *)input {
    
}

@end
