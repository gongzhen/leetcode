//
//  BinarySearchTree.m
//  LC
//
//  Created by Admin  on 3/4/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "BinarySearchTree.h"
#import "TreeNode.h"
#import "Queue.h"

@interface BinarySearchTree()

@property (nonatomic, strong) TreeNode *root;

@end

@implementation BinarySearchTree

- (instancetype)init {
    if(self = [super init]) {
        
    }
    return self;
}

- (void)add:(id)e {
    if(_root == NULL) {
        _root = [[TreeNode alloc] initWith:e];
    } else {
        TreeNode *parent = NULL;
        TreeNode *ptr = _root;
        TreeNode *newNode = [[TreeNode alloc] initWith:e];
        while(ptr != NULL) {
            parent = ptr;
            NSComparisonResult result = [self compareObject:ptr.val toObject:e];
            if(result == -2) {
                return;
            }
            if(result == NSOrderedSame) {
                return;
            } else if(result == NSOrderedAscending) {
                ptr = ptr.right;
            } else if (result == NSOrderedDescending) {
                ptr = ptr.left;
            }
        }
        
        NSComparisonResult result = [self compareObject:parent.val toObject:e];
        if(result == NSOrderedSame) {
            return;
        } else if (result == NSOrderedAscending) {
            parent.right = newNode;
        } else if (result == NSOrderedDescending) {
            parent.left = newNode;
        }
    }
}

- (void)inorder {
    NSMutableArray *list = [NSMutableArray array];
    [self inorderDFS:_root list:list];
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"\t\t%d", [obj intValue]);
    }];
}

- (void)inorderDFS:(TreeNode *)node list:(NSMutableArray *)list {
    if(node == NULL) {
        return;
    }
    [self inorderDFS:node.left list:list];
    [list addObject:node.val];
    [self inorderDFS:node.right list:list];
}

- (void)printTreeBFS {
    if(_root == NULL) {
        return;
    }
    TreeNode *ptr = _root;
    Queue *queue = [Queue queue];
    [queue offer:ptr];
    while (![queue isEmpty]) {
        NSUInteger size = [queue size];
        for(int i = 0; i < size; i++) {
            TreeNode *top = (TreeNode *)[queue poll];
            DLog(@"val: %@", top.val);
            if(top.left != NULL) {
                [queue offer:top.left];
            }
            if(top.right != NULL) {
                [queue offer:top.right];
            }
        }
        DLog(@"_____________________________________");
    }
}

- (NSComparisonResult)compareObject:(id)e1 toObject:(nonnull id)e2 {
    if([e1 isKindOfClass:[NSNumber class]] && [e2 isKindOfClass:[NSNumber class]]) {
        return [self compareNSNumbers:e1 toObject:e2];
    } else if([e1 isKindOfClass:[NSString class]] && [e2 isKindOfClass:[NSString class]]) {
        return [self compareNSString:e1 toObject:e2];
    }
    return -2;
}

- (NSComparisonResult)compareNSNumbers:(NSNumber *)e1 toObject:(NSNumber *)e2 {
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [sort compareObject:e1 toObject:e2];
}


- (NSComparisonResult)compareNSString:(NSString *)e1 toObject:(NSString *)e2 {
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [sort compareObject:e1 toObject:e2];
}


- (void)test {
    [self add:@3];
    [self add:@2];
    [self add:@1];
    [self add:@5];
    [self add:@4];
    [self printTreeBFS];
    [self inorder];
}

@end
