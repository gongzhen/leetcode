//
//  ConditionLock.m
//  LC
//
//  Created by Zhen Gong on 10/8/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "ConditionLock.h"

@interface ConditionLock()

@property (strong, nonatomic) NSCondition *condition;

@end

@implementation ConditionLock

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.condition = [[NSCondition alloc] init];
    }
    return self;
}

- (void)test {
    NSThread *saveThread = [[NSThread alloc] initWithTarget:self selector:@selector(save) object:nil];
    NSThread *dropThread = [[NSThread alloc] initWithTarget:self selector:@selector(draw) object:nil];
    
    [saveThread start];
    [dropThread start];
}

- (void)save {
    [self.condition lock];
    for (int i = 0; i < 5; i++) {
        [super saveMoney];
    }
    [self.condition unlock];
}

- (void)draw {
    [self.condition lock];
    for (int i = 0; i < 5; i++) {
        [super drawMoney];
    }
    [self.condition unlock];
}
@end
