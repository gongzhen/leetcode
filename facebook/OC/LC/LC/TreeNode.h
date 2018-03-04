//
//  TreeNode.h
//  LC
//
//  Created by Admin  on 3/4/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TreeNode<ObjectType> : NSObject

@property(nonatomic) id val;
@property(nonatomic, strong) TreeNode<ObjectType> *left;
@property(nonatomic, strong) TreeNode<ObjectType> *right;

- (instancetype)initWith:(id)e;

@end
