//
//  GridModel.m
//  10_regularexpressionmatching
//
//  Created by Zhen Gong on 5/8/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//
/**
    for (int i = 1; i < row; i++) {
        for (int j = 1; j < col; j++) {
            if (pattern[j-1] == string[i-1] || pattern[j-1] == '.') {
                _dp[i][j] = _dp[i-1][j-1];
            } else if ([_pattern characterAtIndex:(j-1)] == '*'){
 explanation:if pattern(j-1) is *, dp[i][j] will check previous column dp[i][j-1].
 if previous column dp[i][j-1] is false and j >=2 then will check the previous column dp[i][j-2]
 if dp[i][j-2] is false, then we will check if pattern[j-2] and string[i-1].
 if pattern[j-2] == string[i-1], or pattern[j-2] is ?, then we will check dp[i-1][j]
 if dp[i-1][j] is true, it will prove dp[i][j] is true.
 example
 
    "" m i s * i s *
 ""  T
 m
 i                 F <= dp[i-1][j]
 s                 F <= dp[i][j]
 
 we want to know dp[i][j], we will check dp[i][j-2] but it is false.
 now previous char of "*" is "s" which is equal to "s", then we will check "mi" and "mis*is*", dp[i-1][j]
                if (_dp[i][j-1] == false && j >= 2) {
                    _dp[i][j] = _dp[i][j-2] || ((pattern[j-2] == string[i-1] || pattern[j-2] == '.') && _dp[i-1][j] == true); // && _dp[i-1][j] == true);
                } else if (_dp[i][j-1] == true) {
                    _dp[i][j] = _dp[i-1][j] && (string[i-1] == pattern[j-2] || pattern[j-2] == '.');
                }
            }
        }
    }
 
 _dp[i][j] = _dp[i][j-2] || ((pattern[j-2] == string[i-1] || pattern[j-2] == '.') && _dp[i-1][j] == true); // && _dp[i-1][j] == true);
 
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
    for (int i = 2; i < col; i++) {
        if (pattern[i - 1] == '*') {
            _dp[0][i] = _dp[0][i-2];
        }
    }
    
    for (int i = 1; i < row; i++) {
        for (int j = 1; j < col; j++) {
            if (pattern[j-1] == string[i-1] || pattern[j-1] == '.') {
                _dp[i][j] = _dp[i-1][j-1];
            } else if (pattern[j-1] == '*'){
                if (_dp[i][j-1] == false && j >= 2) {
                    _dp[i][j] = _dp[i][j-2] || ((pattern[j-2] == string[i-1] || pattern[j-2] == '.') && _dp[i-1][j] == true); // && _dp[i-1][j] == true);
                } else if (_dp[i][j-1] == true) {
                    _dp[i][j] = _dp[i-1][j] && (string[i-1] == pattern[j-2] || pattern[j-2] == '.');
                }
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
