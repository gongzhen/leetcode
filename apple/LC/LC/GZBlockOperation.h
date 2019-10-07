//
//  GZBlockOperation.h
//  LC
//
//  Created by Zhen Gong on 9/30/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GZBlockOperation : NSObject

+ (instancetype)blockOperationWithBlock:(void (^)(void))block;
- (void)addDependency:(GZBlockOperation *)dependency;
- (void)start;

@end

NS_ASSUME_NONNULL_END
