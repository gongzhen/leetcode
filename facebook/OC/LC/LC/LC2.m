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

- (NSString *)addTwoDoubles:(NSString *)d1 d2:(NSString *)d2;

@end

@implementation LC2

- (NSString *)addTwoDoubles:(NSString *)d1 d2:(NSString *)d2 {
    if(d1.length == 0) {
        return d2;
    }
    if(d2.length == 0) {
        return d1;
    }
    
    NSRange d1IndexRange = [d1 rangeOfString:@"."];
    NSString *d1IntPart = @"";
    NSString *d1DoublePart = @"";
    if(d1IndexRange.location == NSNotFound) {
        d1IntPart = d1;
    } else {
        d1IntPart = [d1 substringToIndex:d1IndexRange.location];
        d1DoublePart = [d1 substringFromIndex:d1IndexRange.location + 1];
    }
    
    NSRange d2IndexRange = [d2 rangeOfString:@"."];
    NSString *d2IntPart = @"";
    NSString *d2DoublePart = @"";
    if(d2IndexRange.location == NSNotFound) {
        d2IntPart = d2;
    } else {
        d2IntPart = [d2 substringToIndex:d2IndexRange.location];
        d2DoublePart = [d2 substringFromIndex:d2IndexRange.location + 1];
    }
    
    /// 1.13 + 0.9 = 2.03
    /// 0.945
    /// add double part

    int diff = abs((int)(d1DoublePart.length) - (int)(d2DoublePart.length));
    if(d1DoublePart.length > d2DoublePart.length) {
        NSMutableString *zero = [NSMutableString string];
        for(int i = 0; i < diff; i++) {
            [zero appendString:@"0"];
        }
        d2DoublePart = [NSString stringWithFormat:@"%@%@", d2DoublePart, zero];
    } else {
        NSMutableString *zero = [NSMutableString string];
        for(int i = 0; i < diff; i++) {
            [zero appendString:@"0"];
        }
        d1DoublePart = [NSString stringWithFormat:@"%@%@", d1DoublePart, zero];
    }
    DLog(@"int1:%@", d1IntPart);
    DLog(@"int2:%@", d2IntPart);
    DLog(@"double1:%@", d1DoublePart);
    DLog(@"double2:%@", d2DoublePart);
    
    NSInteger i = d1DoublePart.length - 1;
    NSInteger j = d2DoublePart.length - 1;
    
    
    int carry = 0;
    NSMutableString *doublePart = [ NSMutableString string];
    while(i >= 0 && j >= 0) {
        int digit1 = [d1DoublePart characterAtIndex:i--] - '0';
        int digit2 = [d2DoublePart characterAtIndex:j--] - '0';
        int sum = (digit1 + digit2 + carry) % 10;
        carry = (digit1 + digit2 + carry) / 10;
        [doublePart insertString:[NSString stringWithFormat:@"%d", sum] atIndex:0];
    }
    DLog(@"doublePart:%@", doublePart);
    
    NSMutableString *intPart = [NSMutableString string];
    i = d1IntPart.length - 1;
    j = d2IntPart.length - 1;
    
    while(i >= 0 && j >= 0) {
        int digi1 = [d1IntPart characterAtIndex:i--] - '0';
        int digi2 = [d2IntPart characterAtIndex:j--] - '0';
        int sum = (digi1 + digi2 + carry) % 10;
        carry = (digi1 + digi2 + carry) / 10;
        [intPart insertString:[NSString stringWithFormat:@"%d", sum] atIndex:0];
    }
    while(i >= 0) {
        int digit1 = [d1IntPart characterAtIndex:i--] - '0';
        int sum = (digit1 + carry) % 10;
        carry = (digit1 + carry) / 10;
        [intPart insertString:[NSString stringWithFormat:@"%d", sum] atIndex:0];
    }
    while(j >= 0) {
        int digit2 = [d2IntPart characterAtIndex:j--] - '0';
        int sum = (digit2 + carry) % 10;
        carry = (digit2 + carry) / 10;
        [intPart insertString:[NSString stringWithFormat:@"%d", sum] atIndex:0];
    }
    if(carry == 1) {
        [intPart insertString:[NSString stringWithFormat:@"%d", carry] atIndex:0];
    }
    DLog(@"intPart:%@", intPart);
    NSString *res = [NSString stringWithFormat:@"%@.%@", intPart, doublePart];
    DLog(@"res:%@", res);
    return res;
}

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
//    
//    ListNode *node2 = [[ListNode alloc] initWith:2];
//    ListNode *node4 = [[ListNode alloc] initWith:4];
//    ListNode *node3 = [[ListNode alloc] initWith:3];
//    
//    /// 564
//    //    ListNode *node9 = [[ListNode alloc] initWith:9];
//    ListNode *node5 = [[ListNode alloc] initWith:5];
//    ListNode *node6 = [[ListNode alloc] initWith:6];
//    ListNode *node4_1 = [[ListNode alloc] initWith:4];
//    node2.next = node4;
//    node4.next = node3;
//    
//    node5.next = node6;
//    node6.next = node4_1;
//    
//    ListNode *ptr = [self addTwoNumbers:node2 l2:node5];
//    NSMutableString *res = [NSMutableString string];
//    while(ptr != nil) {
//        [res appendString:[NSString stringWithFormat:@"%ld", ptr.val]];
//        ptr = ptr.next;
//    }
//    DLog(@"res:%@", res);
    
    /// add two double
    NSString *d1 = @"1.13";
    NSString *d2 = @"2.00";
    [self addTwoDoubles:d1 d2:d2];

    [self addTwoDoubles:d2 d2:d1];
}
@end
