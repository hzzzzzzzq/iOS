//
//  ViewController.m
//  Demo_UIProgressView
//
//  Created by 胡正清 on 2020/8/22.
//  Copyright © 2020 胡正清. All rights reserved.
//
/*
 ****
        熟悉进度条控件的简单使用
            要求：
                1、有一个进度条
                    起始值为0.5
                    进度条覆盖颜色为蓝色
                    进度条底部颜色为灰色
                2、两个按钮，一个增加进度，一个减少进度
                    增加按钮可增加0.1的进度
                    减少按钮可减少0.2的进度
                
 ****
 */

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor whiteColor];
    self.progressView = [[UIProgressView alloc] init];
    self.progressView.frame = CGRectMake(50, 200, self.view.bounds.size.width-100, 0);
    self.progressView.progress = 0.5;
    self.progressView.progressTintColor = [UIColor blueColor];
    self.progressView.trackTintColor = [UIColor grayColor];
    ///图片比较不明显这里就不加了
    //设置进度条上 ‘进度’ 的背景图片
//    self.progressView.progressImage = [UIImage imageNamed:@"Image"];
    [self.view addSubview:self.progressView];
    
    UIButton *btnAdd = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btnAdd.frame = CGRectMake(100, 300, self.view.bounds.size.width-200, 50);
    [btnAdd addTarget:self action:@selector(handleWithAddProgressValue:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnAdd];
    
    UIButton *btnDecrese = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDecrese.frame = CGRectMake(100, 350, self.view.bounds.size.width-200, 50);
    [btnDecrese setTitle:@"减小" forState:UIControlStateNormal];
    [btnDecrese setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnDecrese addTarget:self action:@selector(handleWithDecresePro:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnDecrese];
}
- (void)handleWithAddProgressValue:(UIButton *)sender{
    self.progressView.progress += 0.1;
}
- (void)handleWithDecresePro:(UIButton *)sender{
    self.progressView.progress -= 0.2;
}


@end
