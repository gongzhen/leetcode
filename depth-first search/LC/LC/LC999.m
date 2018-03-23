//
//  LC999.m
//  LC
//
//  Created by ULS on 3/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC999.h"
#import "ListNode.h"

@interface LC999()

- (ListNode *)flattenLinkedList:(ListNode *)root;

@end

@implementation LC999

- (ListNode *)flattenLinkedList:(ListNode *)root {
    [self dfs:root];
    return root;
    
//    if(root == NULL) {
//        return NULL;
//    }
//    if(root.next == NULL && root.down == NULL) {
//        return root;
//    }
//
//    ListNode *headNext = root.next;
//    // ListNode *ptr = node;
//    if(root.down != NULL) {
//        root.next = root.down;
//        root = [self dfs:root.down];
//        root.down = NULL;
//    }
//
//    root.next = headNext;
//    return headNext == NULL ? root : [self dfs:root.next];
}

- (ListNode *)dfs:(ListNode *)node {
    if(node == NULL) {
        return NULL;
    }
    DLog(@"node: %c", node.val);
    if(node.next == NULL && node.down == NULL) {
        return node;
    }
    
    ListNode *headNext = node.next;
    // ListNode *ptr = node;
    if(node.down != NULL) {
        DLog(@"node.down: %c", node.down.val);
        node.next = node.down;
        node = [self dfs:node.down];
        DLog(@"node: %c", node.val);
        node.down = NULL;
    }
    
    node.next = headNext;
    DLog(@"node: %c", node.val);
    DLog(@"headNext: %c", headNext == NULL ? '#' : headNext.val);
    return headNext == NULL ? node : [self dfs:node.next];
}

- (void)printList:(ListNode *)node {
    while(node != NULL) {
        DLog(@"%c", node.val);
        node = node.next;
    }
}

- (void)test {
    ListNode *A = [[ListNode alloc] initWith:'A'];
    ListNode *B = [[ListNode alloc] initWith:'B'];
    ListNode *C = [[ListNode alloc] initWith:'C'];
    ListNode *D = [[ListNode alloc] initWith:'D'];
    ListNode *E = [[ListNode alloc] initWith:'E'];
    ListNode *F = [[ListNode alloc] initWith:'F'];
    ListNode *G = [[ListNode alloc] initWith:'G'];
    ListNode *H = [[ListNode alloc] initWith:'H'];
    ListNode *I = [[ListNode alloc] initWith:'I'];
    ListNode *J = [[ListNode alloc] initWith:'J'];
    ListNode *K = [[ListNode alloc] initWith:'K'];
    ListNode *L = [[ListNode alloc] initWith:'L'];
    A.next = B; B.next = C; C.next = D; D.next = E; E.next = F;
                            G.next = H; H.next = I; I.next = J;
                                        K.next = L;
    
    C.down = G;
    H.down = K;
    ListNode *res = [self flattenLinkedList:A];
    /// A-B-C-G-H-K-L-I-J-D-E-F-NULL
    [self printList:res];
}

@end
