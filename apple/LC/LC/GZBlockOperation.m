//
//  GZBlockOperation.m
//  LC
//
//  Created by Zhen Gong on 9/30/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "GZBlockOperation.h"

/**
-[ImageDownlader download] - Operation 1
-[DataDecrytor decryptWithData] - Operation 2
-[Cache setData:forKey:] - Operation 3
-[UIImage setImage:] - Operation 4

interface NSBlockOperation: NSObject

//(returnType (^nullability)(parameterTypes))blockName
+ (instancetype)blockOperationWithBlock:(void (^)())block;

- (void)addDependency:(NSBlockOperation *)dependency;
- (void)start;

@end

    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        [ImageDownloader downloadData];
    }];
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        [DataDecrytor decryptWithData];
    }];
    [operation2 addDependency:operation1];
    [operation1 start];

*/
typedef void(^GZBlockOperationBlock)(void);

@interface GZBlockOperation()
{
    NSMutableArray<GZBlockOperation *> *_executionBlocks;
    NSMutableArray<GZBlockOperation *> *_dependencies;
    GZBlockOperationBlock _block;
}

@property(assign, nonatomic) BOOL isStart;
@end

@implementation GZBlockOperation

+ (instancetype)blockOperationWithBlock:(void (^)(void))block
{
    GZBlockOperation *operation = [[self alloc] init];
    [operation addExecutionBlock:block];
    return operation;
}

- (instancetype)init
{
    if (self = [super init]) {
        _executionBlocks = [[NSMutableArray alloc] initWithCapacity:1];
        _isStart = false;
    }
    return self;
}

- (void)addExecutionBlock: (GZBlockOperationBlock)block
{
    // _executionBlocks should be here.
    _block = block;
}

// Makes the receiver dependent on the completion of the specified operation.
// The receiver is not considered ready to execute until all of its dependent operations have finished executing. 
- (void)addDependency:(GZBlockOperation *)dependency
{
    if (_dependencies == nil) {
        _dependencies = [[NSMutableArray alloc] initWithCapacity:5];
    }
    [_dependencies addObject:dependency];
}

- (void)start
{
    if (_block == nil) {
        return;
    }
    if (_dependencies == nil || _dependencies.count == 0) {
        _isStart = YES;
        _block();
        return;
    }
    __block BOOL isStart = YES;
    [_dependencies enumerateObjectsUsingBlock:^(GZBlockOperation * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // [obj start];
        if (obj.isStart == NO) {
            isStart = NO;
            *stop = YES;
        }
    }];
    
    if (isStart == NO) {
        NSLog(@"start not ready.");
        return;
    }
    NSLog(@"start is running.");
    _block();
}

@end
