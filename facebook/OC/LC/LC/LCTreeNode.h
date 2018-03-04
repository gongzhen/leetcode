//
//  TreeNode.h
//  LC
//
//  Created by ULS on 2/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCTreeNode : NSObject

@property(assign)NSInteger val;
@property(nonatomic, strong) LCTreeNode* left;
@property(nonatomic, strong) LCTreeNode* right;

- (instancetype)initWith:(NSInteger)x;

@end
