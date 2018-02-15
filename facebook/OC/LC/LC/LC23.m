//
//  LC23.m
//  LC
//
//  Created by ULS on 2/14/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC23.h"
#import "ListNode.h"

@interface LC23()

- (ListNode *)mergeKLists:(NSMutableArray *)lists size:(NSInteger)size;

@end

@implementation LC23

- (ListNode *)mergeKLists:(NSMutableArray *)lists size:(NSInteger)size {
    if(size == 0){
        return NULL;
    }
    
    /// divide and conquer
    return [self divide:lists start:0 last:size - 1];
}

- (ListNode *)divide:(NSMutableArray *)lists start:(NSInteger)start last:(NSInteger)last {
    if(start > last) {
        return NULL;
    }
    
    if(start == last) {
        return lists[start];
    }
    
    NSInteger mid = start + (last - start) / 2;
    ListNode *left = [self divide:lists start:start last:mid];
    ListNode *right = [self divide:lists start:mid + 1 last:last];
    return [self merge:left right:right];
}

- (ListNode *)merge:(ListNode *)left right:(ListNode *)right {
    if(left == NULL && right == NULL) {
        return NULL;
    }
    
    ListNode *prev = [[ListNode alloc] initWith:-1];
    prev.next = left;
    ListNode *result = prev;
    ///(result)prev-> 1(left)  -> 3-> 5
    ///               2(right) -> 4-> 6
    while(left != NULL && right != NULL) {
        if(left.val < right.val) {
            left = left.next;
        } else {
            ListNode *rightList = right.next; /// (rightList)4-> 6
            prev.next = right; /// result -> 1(prev) -> 2(right)
            right.next = left; /// result -> 1(prev) -> 2(right) -> 3(left) -> 5
            right = rightList; /// result -> 1(prev) -> 2 -> 3(left) -> 5
                               /// (right)4-> 6
                               /// result -> 1 -> 2(prev) -> 3(left) -> 5
                               /// (right)4-> 6
        }
        prev = prev.next;
        ///result-> 1(prev)  -> 3(left)-> 5
        ///         2(right) -> 4-> 6
    }
    
    if (right != NULL) {
        prev.next = right;
    }
    return result.next;
}

- (void)test {
    ListNode *node1 = [[ListNode alloc] initWith:1];
    ListNode *node2 = [[ListNode alloc] initWith:2];
    ListNode *node3 = [[ListNode alloc] initWith:3];
    ListNode *node4 = [[ListNode alloc] initWith:4];
    ListNode *node5 = [[ListNode alloc] initWith:5];
    ListNode *node6 = [[ListNode alloc] initWith:6];
    ListNode *node7 = [[ListNode alloc] initWith:7];
    node1.next = node3;
    node2.next = node4;
    node5.next = node6; node6.next = node7;
    NSMutableArray *lists = [[NSMutableArray alloc] initWithCapacity:3];
    [lists addObject:node1];
    [lists addObject:node2];
    [lists addObject:node5];
    ListNode* ret = [self mergeKLists:lists size:3];
    while(ret != NULL) {
        DLog(@"ret:%ld", ret.val);
        ret = ret.next;
    }
}

@end
