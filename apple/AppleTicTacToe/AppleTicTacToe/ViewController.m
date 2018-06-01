//
//  ViewController.m
//  AppleTicTacToe
//
//  Created by Zhen Gong on 5/30/18.
//  Copyright © 2018 Zhen Gong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(assign)NSInteger activePlayer;
@end

@implementation ViewController {
    NSMutableArray* _gameState;
    NSArray<NSArray *> *_winning;
}

- (IBAction)action:(UIButton *)sender {
    if([_gameState[sender.tag - 1] isEqualToNumber:@(0)]) {
        _gameState[sender.tag - 1] = @(_activePlayer);
        if(_activePlayer == 1) {
            [sender setTitle:@"X" forState:UIControlStateNormal];
            _activePlayer = 2;
        } else {
            [sender setTitle:@"O" forState:UIControlStateNormal];
            _activePlayer = 1;
        }
    }
    
    [_winning enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        int i = [[obj objectAtIndex:0] intValue];
        int j = [[obj objectAtIndex:1] intValue];
        int k = [[obj objectAtIndex:2] intValue];
        if([self->_gameState[i] isEqualToNumber:@(0)] == NO && [self->_gameState[i] isEqualToNumber:self->_gameState[j]] && [self->_gameState[j] isEqualToNumber:self->_gameState[k]]) {
            NSLog(@"O win");
        }
    }];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _activePlayer = 1;
    _gameState = [@[@(0), @(0), @(0), @(0), @(0), @(0), @(0), @(0), @(0)] mutableCopy];
    _winning = @[@[@0, @1, @2],@[@3, @4, @5],@[@6, @7, @8],
                 @[@0, @3, @6],@[@1, @4, @7],@[@2, @5, @8],
                 @[@0, @4, @8],@[@2, @4, @6]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
