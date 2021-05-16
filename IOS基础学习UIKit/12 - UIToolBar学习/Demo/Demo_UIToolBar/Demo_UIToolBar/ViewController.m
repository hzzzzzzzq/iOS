//
//  ViewController.m
//  Demo_UIToolBar
//
//  Created by 胡正清 on 2020/8/22.
//  Copyright © 2020 胡正清. All rights reserved.
//
/*
 ****
        简单使用UIToolBar工具栏
            要求
                1、使用label显示按钮点击事件
                2、创建一个工具栏 不透明，默认风格，工具栏颜色白色，不设置按钮风格颜色
                3、创建四个按钮
                    文字型按钮 设置点击事件，改变label文字和颜色
                    系统图标型按钮 设置点击事件 改变label文字和颜色
                    自定义的按钮 加一张大小合适的图片 点击改变label文字和颜色
                    空按钮 用于布局 隔开三个按钮
 ****
 */
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *label;//用来显示当前点击的
@property (nonatomic, strong) UIToolbar *toolBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [[UILabel alloc] init];
    self.label.frame = CGRectMake(50, 100, self.view.bounds.size.width-100, 100);
    self.label.text = @"默认无";
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.numberOfLines = 0;
    [self.view addSubview:self.label];
    
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-44, self.view.bounds.size.width, 44)];
    self.toolBar.translucent = NO;//工具栏是否透明
    self.toolBar.barStyle = UIBarStyleDefault;//工具栏风格
    self.toolBar.barTintColor = [UIColor whiteColor];//设置工具栏的颜色
    self.toolBar.tintColor = nil;//设置按钮风格颜色

    UIBarButtonItem *titleBtn = [[UIBarButtonItem alloc] initWithTitle:@"titleBtn" style:UIBarButtonItemStyleDone target:self action:@selector(handleWithTitleAction:)];
    
    UIBarButtonItem *systemBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(handleWithSystemAction:)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(self.view.bounds.size.width-50, 0, 50, 50);
    [btn setImage:[UIImage imageNamed:@"unselected"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(handleWithCustomAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    UIBarButtonItem *squaceBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    [self.toolBar setItems:@[titleBtn,squaceBtn,systemBtn,squaceBtn,customBtn]];
    
    [self.view addSubview:self.toolBar];
}
- (void)handleWithTitleAction:(UIBarButtonItem *)sender{
    self.label.text = @"你点击了titleBtn按钮";
    self.label.textColor = [UIColor cyanColor];
}
- (void)handleWithSystemAction:(UIBarButtonItem *)sender{
    self.label.text = @"你点击了系统自带的相机的按钮";
    self.label.textColor = [UIColor redColor];
}
- (void)handleWithCustomAction:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected == 1) {
        self.label.textColor = [UIColor colorWithRed:243.0/255.0 green:114.0/255.0 blue:87.0/255.0 alpha:1.0];
    }else{
        self.label.textColor = [UIColor grayColor];
    }
    self.label.text = [NSString stringWithFormat:@"你点击了自定义按钮,选中状态:%d(0为未选择,1为选择)",sender.selected];
}

@end
