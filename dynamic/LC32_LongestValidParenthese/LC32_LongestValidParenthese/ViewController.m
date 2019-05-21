//
//  ViewController.m
//  LC32_LongestValidParenthese
//
//  Created by Zhen Gong on 5/12/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

/*
 How to scroll UIScrollView with autolayout programmatically.
 
 https://github.com/zaxonus/AutoLayScroll
 https://stackoverflow.com/questions/48216808/programmatic-uiscrollview-with-autolayout
 */

#import "ViewController.h"
#import "StackView.h"
#import "OpenParentheseImageView.h"

@interface ViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *inputView;
@property (strong, nonatomic) StackView *stackView;
@property (strong, nonatomic) UITextField *stringInput;
@property (strong, nonatomic) UITextField *patternInput;
@property (strong, nonatomic) UIButton *submitButton;
@property (strong, nonatomic) UIButton *resetButton;
@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) NSMutableArray<OpenParentheseImageView *> *parentheseArray;

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.parentheseArray = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _inputViewConstraint];
}

#pragma mark - Property

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.userInteractionEnabled = YES;
    }
    return _scrollView;
}

- (StackView *)stackView {
    if (!_stackView) {
        _stackView = [[StackView alloc] initWithFrame:CGRectZero];
        _stackView.backgroundColor = UIColor.clearColor;
    }
    return _stackView;
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

- (UIView *)containerView {
    if (_containerView == nil) {
        _containerView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _containerView;
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


#pragma mark - private methods

- (void)_inputViewConstraint {
    [self.view addSubview:self.scrollView];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false; /// 1st level
    self.containerView.translatesAutoresizingMaskIntoConstraints = false; /// 2nd level
    self.inputView.translatesAutoresizingMaskIntoConstraints = false; /// 3rd level
    self.stringInput.translatesAutoresizingMaskIntoConstraints = false; /// 4th level
    self.patternInput.translatesAutoresizingMaskIntoConstraints = false; /// 4th level
    self.submitButton.translatesAutoresizingMaskIntoConstraints = false; /// 4th level
    self.resetButton.translatesAutoresizingMaskIntoConstraints = false; /// 4th level
    self.stackView.translatesAutoresizingMaskIntoConstraints = false; /// 3rd level
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
    
    [self.scrollView addSubview:self.containerView];
    [self.containerView.centerXAnchor constraintEqualToAnchor:self.scrollView.centerXAnchor].active = YES;
    [self.containerView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
    [self.containerView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.containerView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    
    [self.containerView addSubview:self.inputView];
    [self.inputView.topAnchor constraintEqualToAnchor:self.containerView.topAnchor constant:12.f].active = YES;
    [self.inputView.leadingAnchor constraintEqualToAnchor:self.containerView.leadingAnchor constant:0.f].active = YES;
    [self.inputView.trailingAnchor constraintEqualToAnchor:self.containerView.trailingAnchor constant:-0.f].active = YES;
    [self.inputView.widthAnchor constraintEqualToAnchor:self.containerView.widthAnchor constant:0.f].active = YES;
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
    
    [self.containerView addSubview:self.stackView];
    [self.stackView.topAnchor constraintEqualToAnchor:self.inputView.bottomAnchor constant:16.f].active = YES;
    [self.stackView.leadingAnchor constraintEqualToAnchor:self.containerView.leadingAnchor].active = YES;
    [self.stackView.trailingAnchor constraintEqualToAnchor:self.containerView.trailingAnchor].active = YES;
    [self.stackView.bottomAnchor constraintEqualToAnchor:self.containerView.bottomAnchor].active = YES;
    [self.stackView.heightAnchor constraintEqualToConstant:800.f].active = YES;
    self.containerView.backgroundColor = UIColor.clearColor;
    self.stackView.backgroundColor = UIColor.grayColor;
}

#pragma mark - Action

- (void)isMatchAction:(UIButton *)sender {
    OpenParentheseImageView *open = [[OpenParentheseImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    open.translatesAutoresizingMaskIntoConstraints = NO;
    open.backgroundColor = UIColor.yellowColor;
    [self.containerView addSubview:open];
    open.center = self.stackView.center;
    [open.centerXAnchor constraintEqualToAnchor:self.containerView.centerXAnchor constant:0.f].active = YES;
    [open.centerYAnchor constraintEqualToAnchor:self.containerView.centerYAnchor constant:0.f].active = YES;
    [self.containerView layoutIfNeeded];
    [self.view setNeedsLayout];
    [open layoutIfNeeded];
    [open setNeedsLayout];
    [self.view layoutIfNeeded];
    [self.containerView setNeedsLayout];
    [self.containerView layoutIfNeeded];
    [self.stackView setNeedsLayout];
    [self.stackView layoutIfNeeded];
    [UIView animateWithDuration:5.0 animations:^{

    }];
    
//    [UIView animateWithDuration:5 delay:1 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
//        OpenParentheseImageView *open = [[OpenParentheseImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//        [self.parentheseArray addObject:open];
//        [self.containerView addSubview:open];
//        open.translatesAutoresizingMaskIntoConstraints = NO;
//        [open.centerXAnchor constraintEqualToAnchor:self.containerView.centerXAnchor].active = YES;
//        [open.centerYAnchor constraintEqualToAnchor:self.containerView.centerYAnchor].active = YES;
//        [open layoutIfNeeded];
//    } completion:^(BOOL finished) {
//
//    }];

}

- (void)resetAction:(UIButton *)sender {

}
@end
