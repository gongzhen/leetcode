//
//  YelpTrie.h
//  LC
//
//  Created by Zhen Gong on 10/7/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YelpTrie : NSObject

- (void)insert:(NSString *)word;
- (NSArray<NSString *> *)searchPrefix:(NSString *)word;
- (NSArray<NSString *> *)search:(NSString *)word;

@end

NS_ASSUME_NONNULL_END
