//
//  TreeLinkNode.h
//  LC
//
//  Created by ULS on 2/24/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LCTreeNode.h"

@interface TreeLinkNode : LCTreeNode

@property(nonatomic, strong) TreeLinkNode* left;
@property(nonatomic, strong) TreeLinkNode* right;
@property(nonatomic, strong) TreeLinkNode* next;

@end
