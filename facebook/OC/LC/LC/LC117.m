//
//  LC117.m
//  LC
//
//  Created by ULS on 2/24/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC117.h"
#import "TreeLinkNode.h"


@interface LC117()

- (void)connect:(TreeLinkNode *) root;

@end

@implementation LC117

- (void)connect:(TreeLinkNode *) root {
    TreeLinkNode *head = nil;
    TreeLinkNode *prev = nil;
    TreeLinkNode *current = root;
    
    while(current != nil) {
        while(current != nil) {
            DLog(@"current:%ld", current.val);
            if(current.left != nil) {
                if(prev == nil) {
                    head = current.left;
                    DLog(@"head:%ld = current.left:%ld", head.val, current.left.val);
                } else if(prev != nil) {
                    prev.next = current.left;
                    DLog(@"prev:%ld. prev.next:%ld = current.left:%ld", prev.val, prev.next.val, current.left.val);
                }
                DLog(@"prev:%@ == current.left:%ld", prev, current.left.val);
                prev = current.left;
            }
            DLog(@"-------------------------------------------------");
            if(current.right != nil) {
                if(prev == nil) {
                    head = current.right;
                    DLog(@"head:%ld = current.right:%ld", head.val, current.right.val);
                } else if (prev != nil) {
                    prev.next = current.right;
                    DLog(@"prev:%ld. prev.next:%ld = current.right:%ld", prev.val, prev.next.val, current.right.val);
                }
                DLog(@"prev:%@ == current.right:%ld", prev, current.right.val);
                prev = current.right;
            }
            DLog(@"current:%ld == current.next:%ld", current.val, current.next.val);
            current = current.next;
            DLog(@"-------------------------------------------------");
        }
        DLog(@"current:%ld = head:%ld", current.val, head.val);
        current = head;
        head = nil;
        prev = nil;
    }
}

- (void)test {
    TreeLinkNode *node1 = [[TreeLinkNode alloc] initWith:1];
    TreeLinkNode *node2 = [[TreeLinkNode alloc] initWith:2];
    TreeLinkNode *node3 = [[TreeLinkNode alloc] initWith:3];
    TreeLinkNode *node4 = [[TreeLinkNode alloc] initWith:4];
    TreeLinkNode *node5 = [[TreeLinkNode alloc] initWith:5];
    TreeLinkNode *node6 = [[TreeLinkNode alloc] initWith:6];
    node1.left = node2;
    node1.right = node3;
    node2.left = node4;
    node2.right = node5;
    node3.right = node6;
    [self connect:node1];
}
@end
