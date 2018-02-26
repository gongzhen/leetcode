//
//  LC445.m
//  LC
//
//  Created by ULS on 2/25/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC445.h"
#import "NSMutableArray+Stack.h"
#import "ListNode.h"

@interface LC445()

- (ListNode *)addTwoNumbers:(ListNode *)l1 l2:(ListNode *)l2;

@end

@implementation LC445

- (ListNode *)addTwoNumbers:(ListNode *)l1 l2:(ListNode *)l2 {
    NSMutableArray *stack1 = [NSMutableArray array];
    NSMutableArray *stack2 = [NSMutableArray array];
    
    while(l1 != nil) {
        [stack1 push:@(l1.val)];
        l1 = l1.next;
    }
    while(l2 != nil) {
        [stack2 push:@(l2.val)];
        l2 = l2.next;
    }
    /// 7 2 4 3
    /// 9 5 6 3
    /// _________
    /// 16->8->0->6
    ListNode *head = [[ListNode alloc] initWith:0];
    int sum = 0;
    while(stack1.count != 0 || stack2.count != 0) {
        int n1 = stack1.count == 0 ? 0 : [[stack1 pop] intValue];
        int n2 = stack2.count == 0 ? 0 : [[stack2 pop] intValue];
        sum = n1 + n2 + (int)head.val;
        head.val = sum % 10;
        DLog(@"n1:%d n2:%d head.va :%ld", n1, n2, head.val);
        ListNode *node = [[ListNode alloc] initWith:sum / 10];
        DLog(@"n1:%d n2:%d node.val :%ld", n1, n2, node.val);
        node.next = head;
        head = node;
    }
    
    return head.val == 0 ? head.next : head;
}
- (void)test {
    ListNode *node7 = [[ListNode alloc] initWith:7];
    ListNode *node2 = [[ListNode alloc] initWith:2];
    ListNode *node4 = [[ListNode alloc] initWith:4];
    ListNode *node3 = [[ListNode alloc] initWith:3];
    
//    ListNode *node9 = [[ListNode alloc] initWith:9];
    ListNode *node5 = [[ListNode alloc] initWith:5];
    ListNode *node6 = [[ListNode alloc] initWith:6];
    ListNode *node4_1 = [[ListNode alloc] initWith:4];
    node7.next = node2;
    node2.next = node4;
    node4.next = node3;
    /////////////////////
//    node9.next = node5;
    node5.next = node6;
    node6.next = node4_1;
    ListNode *ptr = [self addTwoNumbers:node7 l2:node5];
    NSMutableString *res = [NSMutableString string];
    while(ptr != nil) {
        [res appendString:[NSString stringWithFormat:@"%ld", ptr.val]];
        ptr = ptr.next;
    }
    DLog(@"res:%@", res);
}
@end
