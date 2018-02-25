//
//  TreeLinkNode.h
//  LC
//
//  Created by ULS on 2/24/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "TreeNode.h"

@interface TreeLinkNode : TreeNode

@property(nonatomic, strong) TreeLinkNode* left;
@property(nonatomic, strong) TreeLinkNode* right;
@property(nonatomic, strong) TreeLinkNode* next;

@end
