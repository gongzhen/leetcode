//
//  MapTrie.h
//  LC
//
//  Created by Zhen Gong on 10/7/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapTrie : NSObject

- (void)insert:(NSString *)word;
- (BOOL)search:(NSString *)word;
- (BOOL)startWith:(NSString *)prefix;
- (NSArray *)listStartWith:(NSString *)prefix;

@end

NS_ASSUME_NONNULL_END
