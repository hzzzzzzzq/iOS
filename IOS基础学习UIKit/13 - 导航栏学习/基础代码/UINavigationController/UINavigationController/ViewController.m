//
//  ViewController.m
//  UINavigationController
//
//  Created by 胡正清 on 2020/8/12.
//  Copyright © 2020 胡正清. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.font = [UIFont systemFontOfSize:27];
    titleLabel.text = @"标题";
    titleLabel.textColor = [UIColor cyanColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"1" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn addTarget:self action:@selector(pushToNewViewController:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"2" forState:UIControlStateNormal];
    btn1.frame = CGRectMake(0, 0, 40, 40);
//    NSArray *arrOfBtn = @[btn,btn1];
    self.navigationItem.titleView = btn1;//中间视图  可以加Button、label等各类控件
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn]; //添加左侧按钮
    
}
- (void)pushToNewViewController:(UIButton *)sender{
    ViewController2 *vc = [ViewController2 new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
