//
//  ViewController.m
//  Demo_UISwitch
//
//  Created by 胡正清 on 2020/8/21.
//  Copyright © 2020 胡正清. All rights reserved.
//
/*
 ****
    一个开关和一个label
        要求：
            1、label用于显示开关状态，自定义
            2、开关状态首先开
            3、开关状态的风格颜色：RGB(243,114,87,1.0)
            4、开关小圆按钮的风格颜色：RGB(255,255,255,1.0)
            5、整体风格颜色 ：RGB(230,230,230,1.0)
            6、设置按钮事件 开关开时 label显示 开关打开了
                        开关关闭时 label显示 开关关闭了
            (非必须要求)7、使用开关控制别的控件，可自行定义
            
 ****
 */

#import "ViewController.h"

//定义一个rgb的简单化写法
#define RGB(r,g,b,a)   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]


@interface ViewController ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UISwitch *testSwitch;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width-100, 50)];
    self.label.text = @"这里有一个高50的label";
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    self.testSwitch = [[UISwitch alloc] init];
    self.testSwitch.frame = CGRectMake((self.view.bounds.size.width-self.testSwitch.bounds.size.width)/2, 200, 2, 0);
    [self.testSwitch setOn:YES animated:YES];
    //设置开启状态的风格颜色
    [self.testSwitch setOnTintColor:RGB(243, 114, 87, 1.0)];
    //设置开关小圆按钮的风格颜色
    [self.testSwitch setThumbTintColor:RGB(255, 255, 255, 1.0)];
    //设置整体风格颜色
    [self.testSwitch setTintColor:RGB(230, 230, 230, 1.0)];
    
    [self.testSwitch addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.testSwitch];
}

- (void)switchChange:(UISwitch *)sender{
    if (sender.on == YES) {
        self.label.text = @"开关被打开了，灯亮了";
    }else{
        self.label.text = @"开关被关闭了，灯灭了";
    }
}


@end
