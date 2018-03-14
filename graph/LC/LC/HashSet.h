//
//  HashSet.h
//  LC
//
//  Created by ULS on 3/13/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashSet : NSObject

- (BOOL)add:(id)e;
- (void)clear;
//- (id)clone;
- (BOOL)contains:(id)e;
- (BOOL)isEmpty;
- (BOOL)remove:(id)e;
- (NSInteger)size;
- (NSArray *)arrayList;
-(instancetype)init;
@end
