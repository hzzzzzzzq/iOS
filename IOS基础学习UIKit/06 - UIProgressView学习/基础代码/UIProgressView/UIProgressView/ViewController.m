//
//  ViewController.m
//  UIProgressView
//
//  Created by 胡正清 on 2020/8/9.
//  Copyright © 2020 胡正清. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.progressView = [[UIProgressView alloc] init];//初始化
    self.progressView.frame = CGRectMake(50, 200, self.view.bounds.size.width-100, self.view.bounds.size.height-700);// 设置位置 宽度可变 高度不可变
    self.progressView.progress = 0.5;///设置进度默认值，这个相当于百分比，范围在0~1之间，不可以设置最大最小值
    self.progressView.progressTintColor = [UIColor whiteColor];// 设置进度条上 ‘进度’ 的颜色
    self.progressView.trackTintColor = [UIColor blackColor];// 设置进度条上 ‘底部’ 的颜色
    self.progressView.progressViewStyle = UIProgressViewStyleDefault;// 进度条的风格 两种几乎无区别
    self.progressView.backgroundColor = [UIColor greenColor];//背景颜色 没多大用处
    //设置进度条上 ‘进度’ 的背景图片
    self.progressView.progressImage = [UIImage imageNamed:@"Image"];
    //设置进度条上 ‘底部’ 的背景图片
    self.progressView.trackImage = [UIImage imageNamed:@"Image"];
    [self.view addSubview:self.progressView];
}


@end
