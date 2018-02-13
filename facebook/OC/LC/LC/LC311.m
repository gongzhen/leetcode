//
//  LC311.m
//  LC
//
//  Created by ULS on 2/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC311.h"

@interface LC311()

- (NSArray *) multiply:(NSArray *)A B:(NSArray *)B;

@end

@implementation LC311

- (NSArray *) multiply:(NSArray *)A B:(NSArray *)B {
    
    NSMutableArray* C = [NSMutableArray array]; /// C is A ROWS X B COLUMS
    NSInteger lenA = A.count; /// GET A ROWS
    NSInteger lenA1 = [[A objectAtIndex:0] count]; /// GET A COLUMNS
    /******************************************************************/
    NSInteger lenB = [[B objectAtIndex:0] count]; /// GET B COLUMNS
    /******************************************************************/
    
    /// Initialize C with A ROWS AND B COLUMNS.
    for(NSInteger i = 0; i < lenA; i++) {
        NSMutableArray *C1 = [NSMutableArray array];
        for(NSInteger j = 0; j < lenB; j++) {
            [C1 addObject:@0]; ///[0, 0, 0, 0] for lenB times.
        }
        [C addObject:C1]; /// C add C1, C1, C1 for lenA1 times.
    }
    /******************************************************************/
    
    for(NSInteger i = 0; i < lenA; i++) { /// A ROWS
        for(NSInteger j = 0; j < lenA1; j++) { /// A COLUMNS ========> C ROWS
            if([[[A objectAtIndex:i] objectAtIndex:j] integerValue] != 0) { /// A[i][j] != 0
                NSMutableArray* C1 = [C objectAtIndex:i];
                for(NSInteger k = 0; k < lenB; k++) { /// B COLUMNS ===========> C COLUMNS.
                    if([[[B objectAtIndex:j] objectAtIndex:k] integerValue] != 0) { /// B[j][k] != 0
                        NSInteger a = [[[A objectAtIndex:i] objectAtIndex:j] integerValue];
                        NSInteger b = [[[B objectAtIndex:j] objectAtIndex:k] integerValue];
                        NSInteger c = a * b;
                        [C1 replaceObjectAtIndex:k withObject:@(c)];
                    }
                }
            }
        }
    }
    return C;
}

- (void)test {
    NSArray *A1 = @[@1, @0, @0];
    NSArray *A2 = @[@(-1), @0, @3];
    NSArray *A = @[A1, A2];
    
    NSArray *B1 = @[@7, @0, @0];
    NSArray *B2 = @[@0, @0, @0];
    NSArray *B3 = @[@0, @0, @1];
    NSArray *B = @[B1, B2, B3];
    
    NSArray *res = [self multiply:A B:B];
    for(NSArray *c1 in res) {
        for(NSNumber* n in c1) {
            DLog(@"%ld", [n integerValue]);
        }
        DLog(@"----------------------------------");
    }
}

@end
