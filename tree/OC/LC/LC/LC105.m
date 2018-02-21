//
//  LC105.m
//  LC
//
//  Created by ULS on 2/21/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC105.h"
#import "TreeNode.h"

@interface LC105()

- (TreeNode *)buildTree:(int *)preorder preorderSize:(int)preorderSize inorder:(int *)inorder inorderSize:(int)inorderSize;

@end

@implementation LC105

- (TreeNode *)buildTree:(int *)preorder preorderSize:(int)preorderSize inorder:(int *)inorder inorderSize:(int)inorderSize {
    return [self dfs:preorder pstart:0 pend:preorderSize - 1 inorder:inorder istart:0 iend:inorderSize - 1];
}

- (TreeNode *)dfs:(int *)preorder pstart:(int)pstart pend:(int)pend inorder:(int *)inorder istart:(int)istart iend:(int)iend{
    if(pstart > pend || istart > iend) {
        return NULL;
    }
    
    TreeNode *root = [[TreeNode alloc] initWith:preorder[pstart]];
    int rootIndex = -1;
    for(int i = 0; i <= iend; i++) {
        if(root.val == inorder[i]){
            rootIndex = i;
            break;
        }
    }
    
    if(rootIndex == -1) {
        return root;
    }
    int offSet = rootIndex - istart;
    root.left = [self dfs:preorder pstart:pstart + 1 pend:pstart + offSet inorder:inorder istart:istart iend:rootIndex - 1];
    root.right = [self dfs:preorder pstart:pstart + offSet + 1 pend:pend inorder:inorder istart:rootIndex + 1 iend:iend];
    return root;
}

- (void)test {
    
}
@end
