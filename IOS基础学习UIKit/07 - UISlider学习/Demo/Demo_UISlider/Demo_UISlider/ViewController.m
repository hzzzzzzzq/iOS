//
//  ViewController.m
//  Demo_UISlider
//
//  Created by 胡正清 on 2020/8/22.
//  Copyright © 2020 胡正清. All rights reserved.
//
/*
 ****
    简单使用滑动条
        要求：
            1、一个label 用于显示滑动条的值
            2、设置滑动条
                最小值 0 ，最大值 100，初始值 50
                滑块左侧颜色 蓝色
                滑块右侧颜色 灰色
                滑块颜色    白色
                滑块滚动时，文字内容就会发生变化
    
                
 ****
 */
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //用来显示滑动条的值
    self.label = [[UILabel alloc] init];
    self.label.font = [UIFont systemFontOfSize:25];
    self.label.textColor = [UIColor colorWithRed:243/255.0 green:114.0/255.0 blue:87.0/255.0 alpha:1.0];
    self.label.text = @"默认值";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.frame = CGRectMake(50, 100, self.view.bounds.size.width-100, 50);
    [self.view addSubview:self.label];
    
    //设置滑动条
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 200, self.view.bounds.size.width-100, self.view.bounds.size.height-400)];
    self.slider.minimumValue = 0; // 滑动条 最小的值
    self.slider.maximumValue = 100;// 滑动条 最大的值
    self.slider.value = 50; // 设置滑动条的初始值
    self.slider.minimumTrackTintColor = [UIColor blueColor];//滑块左侧的颜色
    self.slider.maximumTrackTintColor = [UIColor grayColor];//滑块右侧的颜色
    self.slider.thumbTintColor = [UIColor whiteColor];//滑块的颜色
    [self.slider addTarget:self action:@selector(handleWithSetLabelValue:) forControlEvents:UIControlEventValueChanged];// 设置 事件
    self.slider.continuous = YES;// YES 时 方法在滚动时一直调用 NO 时 方法只在滑块停止时调用
    [self.view addSubview:self.slider];
}
- (void)handleWithSetLabelValue:(UISlider *)sender{
    self.label.text = [NSString stringWithFormat:@"滑动条的值: %.2f",self.slider.value];
}

@end
