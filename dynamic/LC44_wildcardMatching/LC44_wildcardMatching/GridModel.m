//
//  GridModel.m
//  LC44_wildcardMatching
//
//  Created by Zhen Gong on 5/11/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//


/*
for (int i = 1; i < row; i++) {
    for (int j = 1; j < col; j++) {
        if (pattern[j-1] == '?' || pattern[j-1] == string[i-1]) {
            _dp[i][j] = _dp[i-1][j-1];
        } else if (pattern[j-1] == '*'){
            _dp[i][j] = _dp[i-1][j] || _dp[i][j-1];
        }
    }
}

 we just need to check  _dp[i][j] = _dp[i-1][j] || _dp[i][j-1];
 
*/

#import "GridModel.h"

@interface GridModel() {
    BOOL **_dp;
}

@end

@implementation GridModel

- (void)dealloc {
    [self freeDP];
}

- (void)freeDP {
    int row = (int)(_stringInput.length);
    for (int i = 0; i < row; i++) {
        free(_dp[i]);
    }
    free(_dp);
}


- (void)initMatrix {
    if (!_stringInput || !_pattern) {
        return;
    }
    int row = (int)_stringInput.length + 1;
    int col = (int)_pattern.length + 1;
    _dp = (BOOL **)malloc(row * sizeof(BOOL *));
    const char *pattern = [_pattern UTF8String];
    const char *string = [_stringInput UTF8String];
    
    for (int i = 0; i < row; i++) {
        _dp[i] = (BOOL *)calloc(col, sizeof(BOOL));
    }
    _dp[0][0] = true;
    for (int i = 1; i < col; i++) {
        if (pattern[i - 1] == '*') {
            _dp[0][i] = _dp[0][i-1];
        }
    }
    
    for (int i = 1; i < row; i++) {
        for (int j = 1; j < col; j++) {
            if (pattern[j-1] == '?' || pattern[j-1] == string[i-1]) {
                _dp[i][j] = _dp[i-1][j-1];
            } else if (pattern[j-1] == '*'){
                _dp[i][j] = _dp[i-1][j] || _dp[i][j-1];
            }
        }
    }
}

- (NSString *)gridCellInIndexPath:(NSIndexPath *)indexPath {
    NSString *cellContent = @"";
    if (!indexPath) {
        return cellContent;
    }
    if (indexPath.section == 0 && indexPath.item == 0) {
        return cellContent;
    }
    if (indexPath.section == 0 && indexPath.item == 1) {
        return @"''";
    }
    if (indexPath.section == 1 && indexPath.item == 0) {
        return @"''";
    }
    if (indexPath.section == 0) {
        return [self _firstRowForPatternInSection:indexPath];
    }
    if (indexPath.item == 0) {
        return  [self _firstColumnForStringInSection:indexPath];
    }
    
    return [self _innerMatrix:indexPath];
}

- (NSString *)_innerMatrix:(NSIndexPath *)indexPath {
    int row = (int)(indexPath.section) - 1;
    int col = (int)(indexPath.item) - 1;
    return _dp[row][col] == true ? [NSString stringWithFormat:@"T(%i,%i)", row, col] : [NSString stringWithFormat:@"F(%i,%i)", row, col];
}

- (NSString *)_firstColumnForStringInSection:(NSIndexPath *)indexPath {
    if (indexPath.item != 0 || !_stringInput) {
        return @"";
    }
    NSInteger section = indexPath.section;
    if (section == 0  || section - 1 > [_stringInput length]) {
        return  @"";
    }
    NSInteger sectionIndex = section - 2;
    char c = [_stringInput characterAtIndex:sectionIndex];
    return [NSString stringWithFormat:@"%c", c];
}

- (NSString *)_firstRowForPatternInSection:(NSIndexPath *)indexPath {
    if (indexPath.section != 0 || !_pattern) {
        return @"";
    }
    
    NSInteger index = indexPath.item;
    if (index == 0 || index - 1 > [_pattern length]) {
        return @"";
    }
    
    NSInteger charIndex = index - 2;
    char c = [_pattern characterAtIndex:charIndex];
    return [NSString stringWithFormat:@"%c", c];
}

@end
