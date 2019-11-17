//
//  DropboxInterview.h
//  LC
//
//  Created by Zhen Gong on 11/12/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "LC.h"

NS_ASSUME_NONNULL_BEGIN

@interface DropboxInterview : LC

+ (NSArray<DBPoint *> *)layoutChildViewsWithParentViewSize:(DBSize *)parentViewSize childViewSizes:(NSArray<DBSize *> *)childViewSizes center:(BOOL)center;

@end

NS_ASSUME_NONNULL_END
