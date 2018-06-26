//
//  MobileFormingQ4Test.h
//  LC
//
//  Created by Zhen Gong on 6/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC.h"

@protocol MoFoEmployee <NSObject>

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *middleName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSDate *startDate;

@end

@interface MobileFormingQ4Test : LC

@end
