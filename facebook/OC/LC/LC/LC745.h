//
//  LC745.h
//  LC
//
//  Created by Admin  on 4/16/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC.h"
#import "Trie.h"

@interface LC745 : LC

- (int)f:(NSString *)prefix suffix:(NSString *)suffix;
- (instancetype)initWithWords:(char **)words len:(int)len;

@end
