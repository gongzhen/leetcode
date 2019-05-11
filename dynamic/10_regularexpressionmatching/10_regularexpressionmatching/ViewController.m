//
//  ViewController.m
//  10_regularexpressionmatching
//
//  Created by Zhen Gong on 4/23/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

#import "ViewController.h"
#import "GridView.h"
#import "GridModel.h"

@interface ViewController () <UITextFieldDelegate, GridViewDataSource>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *inputView;
@property (strong, nonatomic) UITextField *stringInput;
@property (strong, nonatomic) UITextField *patternInput;
@property (strong, nonatomic) UIButton *submitButton;
@property (strong, nonatomic) UIButton *resetButton;
@property (strong, nonatomic) UIView *gridContainerView;
@property (strong, nonatomic) GridView *gridView;
@property (strong, nonatomic) GridModel *gridModel;

@end

@implementation ViewController
{
    NSUInteger _stringLength;
    NSUInteger _patternLength;
}

#pragma mark - Property

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
    }
    return _scrollView;
}

#pragma mark - Carousel Collection View Properties

- (GridView *)gridView {
    if (!_gridView) {
        self.gridModel = [[GridModel alloc] init];
        _gridView = [[GridView alloc] initWithModel:self.gridModel];
        _gridView.dataSource = self;
    }
    return _gridView;
}

- (UIView *)inputView {
    if (_inputView == nil) {
        _inputView = [[UIView alloc] init];
    }
    return _inputView;
}

- (UITextField *)stringInput {
    if (_stringInput == nil) {
        _stringInput = [[UITextField alloc] init];
        _stringInput.placeholder = @"string...";
        _stringInput.delegate = self;
        _stringInput.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _stringInput.autocorrectionType = UITextAutocorrectionTypeNo;
    }
    return _stringInput;
}

- (UITextField *)patternInput {
    if (_patternInput == nil) {
        _patternInput = [[UITextField alloc] init];
        _patternInput.placeholder = @"pattern...";
        _patternInput.delegate = self;
        _patternInput.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _patternInput.autocorrectionType = UITextAutocorrectionTypeNo;
    }
    return _patternInput;
}

- (UIView *)gridContainerView {
    if (_gridContainerView == nil) {
        _gridContainerView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _gridContainerView;
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitButton setTitle:NSLocalizedString(@"Submit", nil) forState:UIControlStateNormal];
        [_submitButton setBackgroundColor:[UIColor blackColor]];
        [_submitButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _submitButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
        _submitButton.layer.cornerRadius = 2.0f;
        _submitButton.contentEdgeInsets = UIEdgeInsetsMake(15, 16, 15, 16);
        _submitButton.titleLabel.minimumScaleFactor = 14/ 18;
        _submitButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        [_submitButton addTarget:self action:@selector(isMatchAction:) forControlEvents:UIControlEventTouchUpInside];
        [_submitButton sizeToFit];
    }
    return _submitButton;
}


- (UIButton *)resetButton {
    if (!_resetButton) {
        _resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_resetButton setTitle:NSLocalizedString(@"Reset", nil) forState:UIControlStateNormal];
        [_resetButton setBackgroundColor:[UIColor blackColor]];
        [_resetButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _resetButton.titleLabel.font = [UIFont systemFontOfSize:18.f];
        _resetButton.layer.cornerRadius = 2.0f;
        _resetButton.contentEdgeInsets = UIEdgeInsetsMake(15, 16, 15, 16);
        _resetButton.titleLabel.minimumScaleFactor = 14/ 18;
        _resetButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        [_resetButton addTarget:self action:@selector(resetAction:) forControlEvents:UIControlEventTouchUpInside];
        [_resetButton sizeToFit];
    }
    return _resetButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _inputViewConstraint];
}

- (void)_inputViewConstraint {
    [self.view addSubview:self.scrollView];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
    self.inputView.translatesAutoresizingMaskIntoConstraints = false;
    self.stringInput.translatesAutoresizingMaskIntoConstraints = false;
    self.gridContainerView.translatesAutoresizingMaskIntoConstraints = false;
    self.patternInput.translatesAutoresizingMaskIntoConstraints = false;
    self.submitButton.translatesAutoresizingMaskIntoConstraints = false;
    self.resetButton.translatesAutoresizingMaskIntoConstraints = false;
    self.gridView.translatesAutoresizingMaskIntoConstraints = false;
    //  stack view
    if (@available(iOS 11.0, *)) {
        [self.scrollView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
    } else {
        [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    }
    [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.scrollView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;

    [self.scrollView addSubview:self.inputView];
    [self.inputView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor constant:12.f].active = YES;
    [self.inputView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:0.f].active = YES;
    [self.inputView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor constant:-0.f].active = YES;
    [self.inputView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor constant:0.f].active = YES;
//    [self.inputView.heightAnchor constraintGreaterThanOrEqualToConstant:460.f].active = YES;
    [self.inputView setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    
    [self.inputView addSubview:self.stringInput];
    [self.stringInput.topAnchor constraintEqualToAnchor:self.inputView.topAnchor constant:16.f].active = YES;
    [self.stringInput.leadingAnchor constraintEqualToAnchor:self.inputView.leadingAnchor constant:16.f].active = YES;
    [self.stringInput.trailingAnchor constraintEqualToAnchor:self.inputView.trailingAnchor constant:-16.f].active = YES;
    [self.stringInput.heightAnchor constraintGreaterThanOrEqualToConstant:100.f].active = YES;
    self.stringInput.backgroundColor = UIColor.greenColor;
    
    [self.inputView addSubview:self.patternInput];
    [self.patternInput.topAnchor constraintEqualToAnchor:self.stringInput.bottomAnchor constant:12.f].active = YES;
    [self.patternInput.leadingAnchor constraintEqualToAnchor:self.inputView.leadingAnchor constant:16.f].active = YES;
    [self.patternInput.trailingAnchor constraintEqualToAnchor:self.inputView.trailingAnchor constant:-16.f].active = YES;
    [self.patternInput.heightAnchor constraintEqualToAnchor:self.stringInput.heightAnchor].active = YES;
    self.patternInput.backgroundColor = UIColor.greenColor;

    [self.inputView addSubview:self.resetButton];
    [self.resetButton.topAnchor constraintEqualToAnchor:self.patternInput.bottomAnchor constant:16.f].active = YES;
    [self.resetButton.leadingAnchor constraintEqualToAnchor:self.inputView.leadingAnchor constant:- -16.f].active = YES;
    [self.resetButton.trailingAnchor constraintEqualToAnchor:self.inputView.trailingAnchor constant:-16.f].active = YES;
    
    [self.inputView addSubview:self.submitButton];
    [self.submitButton.topAnchor constraintEqualToAnchor:self.resetButton.bottomAnchor constant:16.f].active = YES;
    [self.submitButton.leadingAnchor constraintEqualToAnchor:self.inputView.leadingAnchor constant:16.f].active = YES;
    [self.submitButton.trailingAnchor constraintEqualToAnchor:self.inputView.trailingAnchor constant:-16.f].active = YES;
    [self.submitButton.heightAnchor constraintGreaterThanOrEqualToConstant:40.f].active = YES;
    [self.submitButton.bottomAnchor constraintEqualToAnchor:self.inputView.bottomAnchor constant:-32.f].active = YES;

    [self.scrollView addSubview:self.gridContainerView];
    [self.gridContainerView.topAnchor constraintEqualToAnchor:self.inputView.bottomAnchor constant:16.f].active = YES;
    [self.gridContainerView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
    [self.gridContainerView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
    [self.gridContainerView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.gridContainerView.widthAnchor constraintEqualToAnchor:self.inputView.widthAnchor].active = YES;
    [self.gridContainerView.heightAnchor constraintGreaterThanOrEqualToAnchor:self.gridContainerView.widthAnchor].active = YES;
    self.gridContainerView.backgroundColor = UIColor.clearColor;
    
    [self.gridContainerView addSubview:self.gridView];
    [self.gridView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.gridView setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
    [self.gridView.topAnchor constraintEqualToAnchor:self.gridContainerView.topAnchor].active = YES;
    [self.gridView.leadingAnchor constraintEqualToAnchor:self.gridContainerView.leadingAnchor].active = YES;
    [self.gridView.trailingAnchor constraintEqualToAnchor:self.gridContainerView.trailingAnchor].active = YES;
    [self.gridView.heightAnchor constraintEqualToAnchor:self.gridContainerView.widthAnchor].active = YES;
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    textField.backgroundColor = [UIColor whiteColor];
    return YES;
}

-  (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField  == self.stringInput) {
        _stringLength = _stringInput.text.length;
        return YES;
    } else if (textField == self.patternInput) {
        _patternLength = _patternInput.text.length;
        return YES;
    }
    return NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField  == self.stringInput) {
        return YES;
    } else if (textField == self.patternInput) {
        return YES;
    }
    return NO;
}

#pragma mark - Action

- (void)isMatchAction:(UIButton *)sender {
    _stringLength = _stringInput.text ? _stringInput.text.length : 0;
    _patternLength = _patternInput.text ? _patternInput.text.length : 0;
    if (self.gridView) {
        self.gridModel.stringInput = _stringInput.text;
        self.gridModel.pattern =  _patternInput.text;
        [self.gridModel initMatrix];
        [self.gridView reloadData];
    }
}

- (void)resetAction:(UIButton *)sender {
    _stringLength = 0;
    _patternLength = 0;
    _stringInput.text = @"";
    _patternInput.text = @"";
    if (self.gridView) {
        [self.gridModel freeDP];
        [self.gridView reloadData];
    }
}

#pragma mark - GridViewDataSource

- (NSInteger)numberOfRowsInGridView:(GridView *)gridView {
     return _stringLength == 0 ? _stringLength : _stringLength + 2;
}

- (NSInteger)numberOfColumnsInGridView:(GridView *)gridView {
    return _patternLength == 0 ? _patternLength : _patternLength + 2;
}

@end
