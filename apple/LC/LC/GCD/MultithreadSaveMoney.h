//
//  MultithreadSaveMoney.h
//  LC
//
//  Created by Zhen Gong on 10/8/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "LC.h"

NS_ASSUME_NONNULL_BEGIN

@interface MultithreadSaveMoney : LC

@property (strong, nonatomic) dispatch_queue_t queue;

- (void)saveMoney;
- (void)drawMoney;

@end

NS_ASSUME_NONNULL_END
