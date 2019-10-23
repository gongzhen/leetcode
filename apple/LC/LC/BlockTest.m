//
//  BlockTest.m
//  LC
//
//  Created by ULS on 4/11/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "BlockTest.h"
// https://blog.csdn.net/hherima/article/category/9263836

typedef void(^BlockTestForTestingBlock) (void);

@interface BlockTest()
{
    id _observer;
}

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, copy) BlockTestForTestingBlock testBlock;
@property (nonatomic, strong) NSMutableArray <BlockTestForTestingBlock> *completions;

@end

@implementation BlockTest

- (instancetype)init
{
    self = [super init];
    if (self) {
        __weak BlockTest *weakSelf = self;
        _completions = [NSMutableArray array];
        _testBlock = ^(){
            NSLog(@"weakSelf=>%@", weakSelf);
        };
    }
    return self;
}

- (void)test {
//    [self test1];
//    [self test2];
//    [self test3];
//    [self test4];
    [self test5];
    BlockTestForTestingBlock block = [self.completions firstObject];
    block();
//    sleep(10);
    NSLog(@"BlockTest done.self.x = %ld", self.x);
}

- (void)test1 {
    int x = 123;
    
    void (^printXAndY)(int) = ^(int y) {
        
        printf("line 24 ===> x:%d y:%d\n", x, y);
    };
    
    printXAndY(456); // prints: 123 456
}

- (void)test2 {
    int x = 123;
    
    void (^printXAndY)(int) = ^(int y) {
        
        y = x + y; // error
        printf("line 36 ===> x:%d y:%d\n", x, y);
    };
    printXAndY(456);
}

- (void)test3 {
    __block int x = 123; //  x lives in block storage
    int y = 456;
    void (^printXAndY)(int) = ^(int y) {
        
        x = x + y; /// x value will change because x is __block
        printf("line 47 ===> x:%d y:%d\n", x, y);
        y = 0; /// will not change y value.
    };
    DLog(@"x:%d y:%d\n", x, y);
    printXAndY(y); // prints: 579 456
    DLog(@"x:%d y:%d\n", x, y);
}

// https://blog.csdn.net/hherima/article/details/45313877
// https://www.jianshu.com/p/737999a30544?utm_campaign=maleskine&utm_content=note&utm_medium=writer_share&utm_source=weibo
- (void)test4 {
    _testBlock();
    __weak BlockTest *weakSelf = self;
    _observer = [[NSNotificationCenter defaultCenter] addObserverForName:@"TestNotificationBlock" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        BlockTest *strongSelf = weakSelf;
        if (strongSelf) {
            NSLog(@"self:%@", strongSelf);
        } else {
            NSLog(@"<self> dealloc before we could run this code.");
        }

    }];
}

- (void)test5 {
    [self calledByTest5WithEscapingClosure:^{
        self.x = 100;
    }];
}

- (void)calledByTest5WithEscapingClosure:(BlockTestForTestingBlock)completionHandler {
    [_completions addObject:completionHandler];
}

- (void)dealloc
{
    NSLog(@"dealloc called");
    if (_observer) {
        [[NSNotificationCenter defaultCenter] removeObserver:_observer];
    }
}
@end
