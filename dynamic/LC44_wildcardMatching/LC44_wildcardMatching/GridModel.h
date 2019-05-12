//
//  GridModel.h
//  LC44_wildcardMatching
//
//  Created by Zhen Gong on 5/11/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GridModel : NSObject

@property (nonatomic, strong, nullable) NSString *stringInput;
@property (nonatomic, strong, nullable) NSString *pattern;

- (NSString *)gridCellInIndexPath:(NSIndexPath *)indexPath;
- (void)initMatrix;
- (void)freeDP;

@end

NS_ASSUME_NONNULL_END
