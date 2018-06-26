//
//  SecondViewController.m
//  AppleTicTacToe
//
//  Created by Zhen Gong on 6/19/18.
//  Copyright © 2018 Zhen Gong. All rights reserved.
//

#import "SecondViewController.h"
#import "Masonry.h"

@interface SecondViewController ()

@property(strong, nonatomic) NSMutableArray <UIButton *> *buttons;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpGridView];
}

- (void)setUpGridView {
    UIView *gameView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.width)];
    gameView.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:gameView];
    UIView *bottom = [[UIView alloc] init];
    [self.view addSubview:bottom];
    bottom.backgroundColor = UIColor.yellowColor;
    [bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(gameView.mas_bottom).offset(10);
        make.left.equalTo(gameView.mas_left).offset(10);
        make.right.equalTo(gameView.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    
    CGFloat yOffset = self.view.frame.size.width / 3;
    UIView *h1 = [[UIView alloc] initWithFrame:CGRectMake(0, yOffset, self.view.frame.size.width, 2)];
    h1.backgroundColor = UIColor.blackColor;
    [gameView addSubview:h1];
    
    yOffset += self.view.frame.size.width / 3;
    UIView *h2 = [[UIView alloc] initWithFrame:CGRectMake(0, yOffset, self.view.frame.size.width, 2)];
    h2.backgroundColor = UIColor.blackColor;
    [gameView addSubview:h2];
    CGFloat xOffset = self.view.frame.size.width / 3;
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(xOffset, 0, 2, self.view.frame.size.width)];
    v1.backgroundColor = UIColor.blackColor;
    [gameView addSubview:v1];
    
    xOffset += self.view.frame.size.width / 3;
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(xOffset, 0, 2, self.view.frame.size.width)];
    v2.backgroundColor = UIColor.blackColor;
    [gameView addSubview:v2];
    
    self.buttons = [NSMutableArray array];
    for(NSInteger i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        btn.backgroundColor = UIColor.redColor;
        [btn setTitle:@"X" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [gameView addSubview:btn];
        [self.buttons addObject:btn];
    }
    
    /// 0 1 2
    /// 3 4 5
    /// 7 8 9
    __block CGFloat xPadding = 0;
    __block CGFloat yPadding = 0;
    [self.buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull btn, NSUInteger idx, BOOL * _Nonnull stop) {

        CGFloat width = self.view.frame.size.width / 3;
        CGFloat height = width;
        if(btn.tag / 3 == 0) {
            btn.frame = CGRectMake(xPadding + 5, yPadding + 5, width - 10, height - 10);
            xPadding += width;
            yPadding = 0;
            if(btn.tag == 2) {
                xPadding = 0;
                yPadding += height;
            }
        } else if(btn.tag / 3 == 1) {
            btn.frame = CGRectMake(xPadding + 5, yPadding + 5, width - 10, height - 10);
            xPadding += width;
            if(btn.tag == 5) {
                xPadding = 0;
                yPadding += height;
            }
        } else if(btn.tag / 3 == 2) {
            btn.frame = CGRectMake(xPadding + 5, yPadding + 5, width - 10, height - 10);
            xPadding += width;
        }
    }];
}

- (void)btnPressed:(UIButton *)sender {
    [sender setTitle:[NSString stringWithFormat:@"%ld", sender.tag] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
