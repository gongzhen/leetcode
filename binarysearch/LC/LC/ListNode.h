//
//  ListNode.h
//  LC
//
//  Created by ULS on 2/14/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListNode : NSObject

@property(assign)char val;
@property(nonatomic, strong) ListNode* next;
@property(nonatomic, strong) ListNode* down;

- (instancetype)initWith:(char)x;

@end
