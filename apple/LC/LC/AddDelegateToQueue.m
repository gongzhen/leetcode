//
//  AddDelegateToQueue.m
//  LC
//
//  Created by Zhen Gong on 12/24/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "AddDelegateToQueue.h"

static const void * __GRMultipleDelegateKey = &__GRMultipleDelegateKey;
static const char * __GRMultipleDelegateQueueIdentifier = "com.lc.grmultipleDelegateQueueIdentifier";

@interface GRMultipleDelegateNode: NSObject {
@private
    __weak id delegate;
}

- (instancetype)initWithDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;

@property (readwrite, weak) id delegate;
@property (nonatomic, readonly) dispatch_queue_t delegateQueue;

@end


@implementation GRMultipleDelegateNode

@synthesize delegate;
@synthesize delegateQueue;

- (instancetype)initWithDelegate:(id)inDelegate delegateQueue:(dispatch_queue_t)delegateQueue {
    self = [super init];
    if (self) {
        delegate = inDelegate;
        delegateQueue = delegateQueue;
    }
    return self;
}
@end

@interface GRMultipleDelegate: NSObject {
    NSMutableArray *delegateNodes;
}

- (void)addDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;

@end

@implementation GRMultipleDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        delegateNodes = [NSMutableArray new];
    }
    return self;
}

- (void)addDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue {
    if (delegate == nil) return;
    if (delegateQueue == nil) return;
    dispatch_queue_set_specific(delegateQueue, __GRMultipleDelegateKey, (void *)__GRMultipleDelegateQueueIdentifier, nil);
    GRMultipleDelegateNode *node = [[GRMultipleDelegateNode alloc] initWithDelegate:delegate delegateQueue:delegateQueue];
    [delegateNodes addObject:node];
}

@end

@interface AddDelegateToQueue()

@property (strong, nonatomic) GRMultipleDelegate<GRChatManagerDelegate> *delegates;
@property (strong, nonatomic) dispatch_queue_t delegateQueue;

@end

@implementation AddDelegateToQueue

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegateQueue = dispatch_get_main_queue();
        self.delegates = (GRMultipleDelegate<GRChatManagerDelegate> *)[[GRMultipleDelegate alloc] init];
    }
    return self;
}

- (void)addDelegate:(id<GRChatManagerDelegate>)delegate {
    [self.delegates addDelegate:delegate delegateQueue:self.delegateQueue];
}

@end
