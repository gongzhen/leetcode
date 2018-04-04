//
//  LC105.m
//  LC
//
//  Created by Admin  on 3/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC105.h"
#import "LCTreeNode.h"

@interface LC105()

-(LCTreeNode *)buildTree:(NSArray *)preorder inorder:(NSArray *)inorder;

@end

@implementation LC105

-(LCTreeNode *)buildTree:(NSArray *)preorder inorder:(NSArray *)inorder {
    return [self dfs:preorder pstart:0 pend:(int)preorder.count - 1 inorder:inorder istart:0 iend:(int)inorder.count - 1];
}

- (LCTreeNode *)dfs:(NSArray *)preorder pstart:(int)pstart pend:(int)pend inorder:(NSArray *)inorder istart:(int)istart iend:(int)iend {
    if(pstart > pend || istart > iend) {
        return NULL;
    }
    
    LCTreeNode *root = [[LCTreeNode alloc] initWith:[preorder[pstart] intValue]];
    int rootIndex = 0;
    for(int i = istart; i <= iend; i++) {
        if(root.val == [inorder[i] intValue]) {
            rootIndex = i;
        }
    }
    DLog(@"rootIndex:%d", rootIndex);
    root.left = [self dfs:preorder pstart:pstart + 1 pend:pend inorder:inorder istart:istart iend:rootIndex - 1];
    root.right = [self dfs:preorder pstart:pstart + rootIndex - istart + 1 pend:pend inorder:inorder istart:rootIndex + 1 iend:iend];
    return root;
}

- (void)test {
    NSArray *preorder = @[@3, @9, @20, @15, @7];
    NSArray *inorder = @[@9, @3, @15, @20, @7];
    //          3
    //      9       20
    //             15  7
    LCTreeNode *res = [self buildTree:preorder inorder:inorder];
    LCTreeNode* ptr = res;
    NSMutableArray *stack = [NSMutableArray array];
    while(ptr != NULL || stack.count != 0) {
        while(ptr != NULL) {
            [stack addObject:ptr];
            ptr = ptr.left;
        }
        ptr = [stack lastObject];
        DLog(@"ptr:%ld", ptr.val);
        [stack removeLastObject];
        ptr = ptr.right;
    }
}
@end
