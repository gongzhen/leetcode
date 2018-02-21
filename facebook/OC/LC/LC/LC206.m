//
//  LC206.m
//  LC
//
//  Created by ULS on 2/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC206.h"
#import "ListNode.h"

@interface LC206()

- (ListNode *)reverseList:(ListNode *)head;

@end

@implementation LC206

- (ListNode *)reverseList:(ListNode *)head {
    if(head == nil) {
        return nil;
    }
    
    ListNode *prev = nil;
    ListNode *current = head;
    while(current != nil) {
        ListNode* next = current.next;
        current.next = prev;
        prev = current;
        current = next;
    }
    return prev;
}

- (void)test {
    ListNode *node1 = [[ListNode alloc] initWith:1];
    ListNode *node2 = [[ListNode alloc] initWith:2];
    ListNode *node3 = [[ListNode alloc] initWith:3];
    ListNode *node4 = [[ListNode alloc] initWith:4];
    ListNode *node5 = [[ListNode alloc] initWith:5];
    ListNode *node6 = [[ListNode alloc] initWith:6];
    ListNode *node7 = [[ListNode alloc] initWith:7];
    node1.next = node2;
    node2.next = node3;
    node3.next = node4;
    node4.next = node5;
    node5.next = node6;
    node6.next = node7;
    ListNode *res = [self reverseList:node1];
    while(res != nil) {
        DLog(@"%ld", res.val);
        res = res.next;
    }
}

@end
