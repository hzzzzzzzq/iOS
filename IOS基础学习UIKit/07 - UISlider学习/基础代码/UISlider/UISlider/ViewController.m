//
//  ViewController.m
//  UISlider
//
//  Created by 胡正清 on 2020/8/10.
//  Copyright © 2020 胡正清. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 200, self.view.bounds.size.width-100, self.view.bounds.size.height-400)];
    self.slider.minimumValue = 0; // 滑动条 最小的值
    self.slider.maximumValue = 100;// 滑动条 最大的值
    self.slider.value = 50; // 设置滑动条的初始值
//    self.slider.minimumValueImage = [UIImage imageNamed:@"exam_renew"];//滑块左侧最小值处的图片
//    self.slider.maximumValueImage = [UIImage imageNamed:@"exam_renew"];//滑块右侧最大值处的图片
//    [self.slider setMaximumTrackImage:[UIImage imageNamed:@"Image01"] forState:UIControlStateNormal];//右侧普通状态下的图片
//    [self.slider setMinimumTrackImage:[UIImage imageNamed:@"Image"] forState:UIControlStateNormal];//左侧普通状态下的图片
    [self.slider setThumbImage:[UIImage imageNamed:@"exam_renew"] forState:UIControlStateNormal];
//    self.slider.minimumTrackTintColor = [UIColor greenColor];//滑块左侧的颜色
//    self.slider.maximumTrackTintColor = [UIColor redColor];//滑块右侧的颜色
//    self.slider.thumbTintColor = [UIColor blackColor];//滑块的颜色
    [self.slider addTarget:self action:@selector(changeValue) forControlEvents:UIControlEventValueChanged];// 设置 事件
    self.slider.continuous = NO;// YES 时 方法在滚动时一直调用 NO 时 方法只在滑块停止时调用
    [self.view addSubview:self.slider];
}
- (void)changeValue{
    NSLog(@"%d",self.slider.value);
}

@end
