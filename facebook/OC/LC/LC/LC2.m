//
//  LC2.m
//  LC
//
//  Created by ULS on 2/26/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC2.h"
#import "ListNode.h"

@interface LC2()

- (ListNode *)addTwoNumbers:(ListNode *)l1 l2:(ListNode *)l2;

@end

@implementation LC2

- (ListNode *)addTwoNumbers:(ListNode *)l1 l2:(ListNode *)l2 {
    if(l1 == nil) {
        return l2;
    }
    if(l2 == nil) {
        return l1;
    }
    int len1 = [self getLength:l1];
    int len2 = [self getLength:l2];
    if(len1 < len2) {
        return [self addTwoNumbers:l2 len1:len2 l2:l1 len2:len1];
    }
    return [self addTwoNumbers:l1 len1:len1 l2:l2 len2:len2];
}

- (ListNode *)addTwoNumbers:(ListNode *)l1 len1:(int)len1 l2:(ListNode *)l2 len2:(int)len2 {
    /// len1 >= len2
    long carry = 0;
    long sum = 0;
    ListNode *head = [[ListNode alloc] initWith:0];
    head.next = l1;
    while(l2 != nil) {
        sum = l1.val + l2.val + carry;
        l1.val = sum % 10;
        carry = sum / 10;
        l1 = l1.next;
        l2 = l2.next;
    }
    
    if(len1 == len2 && carry > 0) {
        ListNode *ptr = head.next;
        while(ptr != nil && ptr.next != nil) {
            ptr = ptr.next;
        }
        ptr.next = [[ListNode alloc] initWith:carry];
        return head.next;
    } else if (carry > 0) {
        while(l1 != nil) {
            sum = l1.val + carry;
            l1.val = sum % 10;
            carry = sum / 10;
            if(l1.next == nil && carry > 0) {
                l1.next = [[ListNode alloc] initWith:carry];
                carry = 0;
            }
            l1 = l1.next;
        }
    }
    return head.next;
}
- (int)getLength:(ListNode *)node {
    if(node == nil) {
        return 0;
    }
    
    int i = 0;
    while(node != nil) {
        i++;
        node = node.next;
    }
    return i;
}

- (void)test {
    /// 243
    
    ListNode *node2 = [[ListNode alloc] initWith:2];
    ListNode *node4 = [[ListNode alloc] initWith:4];
    ListNode *node3 = [[ListNode alloc] initWith:3];
    
    /// 564
    //    ListNode *node9 = [[ListNode alloc] initWith:9];
    ListNode *node5 = [[ListNode alloc] initWith:5];
    ListNode *node6 = [[ListNode alloc] initWith:6];
    ListNode *node4_1 = [[ListNode alloc] initWith:4];
    node2.next = node4;
    node4.next = node3;
    
    node5.next = node6;
    node6.next = node4_1;
    
    ListNode *ptr = [self addTwoNumbers:node2 l2:node5];
    NSMutableString *res = [NSMutableString string];
    while(ptr != nil) {
        [res appendString:[NSString stringWithFormat:@"%ld", ptr.val]];
        ptr = ptr.next;
    }
    DLog(@"res:%@", res);
    
}
@end
