//
//  TrieNodeWithMap.h
//  LC
//
//  Created by Zhen Gong on 10/7/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TrieNodeWithMap : NSObject

@property (strong, nonatomic) NSMutableDictionary<NSString *, TrieNodeWithMap *> *children;
@property (assign) BOOL isWord;

@end

NS_ASSUME_NONNULL_END
