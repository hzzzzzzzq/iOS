//
//  ViewController.m
//  Demo_UIButton
//
//  Created by 胡正清 on 2020/8/14.
//  Copyright © 2020 胡正清. All rights reserved.
//
/*
****
   实现UIButton的一些属性 例如图片，背景，文字，文字偏移
   要求：
       1、首先要有两个按钮，一个label
       2、label要求：
           a)宽度放置位置 自己决定
           b)字体14，颜色黑色
           c)默认文字 你还没有点击
       3、第一个按钮的要求
           a)要求按钮背景为r：243 g：114 b：87
           b)要求按钮文字颜色为白色，字体大小为14
           c)圆角为12，边框宽度2，颜色白色
           d)设置高亮模式颜色（红色
           e)设置选中状态颜色（灰色
           f)添加按钮事件 （切换文字内容为你点击了第一个按钮，目前为选中状态）
           g)按钮宽度100 高度50
       3、第二个按钮
           a)要求添加按钮图片（随便加图片
           b)要求文字在下图片在上（用文字偏移完成，默认图片左，文字右）
           c)不可点击模式图片 （又是不一样的图片
           d)添加按钮事件 （切换文字内容为你点击了第二个按钮）
           e)宽度40 高度 200
****
*/
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *label;///标签显示
@property (nonatomic, strong) UIButton *firstBtn;///第一个按钮
@property (nonatomic, strong) UIButton *secondBtn;///第二个按钮
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width-100, 50)];
    self.label.text = @"你还没有点击";
    self.label.textColor = [UIColor blackColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.numberOfLines = 0;
    self.label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.label];

    ///第一个按钮
    self.firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.firstBtn setTitle:@"第一个按钮" forState:UIControlStateNormal];
    self.firstBtn.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:114.0/255.0 blue:87.0/255.0 alpha:1.0];
    [self.firstBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//普通状态
    self.firstBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    self.firstBtn.layer.cornerRadius = 12;
    self.firstBtn.layer.borderWidth = 2;
    self.firstBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.firstBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];//高亮状态
    [self.firstBtn setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];///选中状态
    [self.firstBtn addTarget:self action:@selector(changeToSelected:) forControlEvents:UIControlEventTouchUpInside];///添加事件
    self.firstBtn.frame = CGRectMake(self.view.center.x-50, 200, 100, 50);
    [self.view addSubview:self.firstBtn];
    
    ///第二个按钮
    self.secondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.secondBtn setTitle:@"第一个按钮" forState:UIControlStateNormal];
    self.secondBtn.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:114.0/255.0 blue:87.0/255.0 alpha:1.0];
    [self.secondBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];//普通状态的文字颜色
    [self.secondBtn setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];//不可点击状态的文字颜色
    self.secondBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.secondBtn setImage:[UIImage imageNamed:@"Image_normal"] forState:UIControlStateNormal];
    [self.secondBtn setImage:[UIImage imageNamed:@"Image_disabled"] forState:UIControlStateDisabled];//不可点击状态的图片
    [self.secondBtn addTarget:self action:@selector(changeToDisabled:) forControlEvents:UIControlEventTouchUpInside];///添加事件
    self.secondBtn.frame = CGRectMake(self.view.center.x-60, 300, 120, 350);
    [self.view addSubview:self.secondBtn];
}
///第一个按钮事件
- (void)changeToSelected:(UIButton *)sender{
    self.firstBtn.selected = !self.firstBtn.selected;///选中状态的切换
    if (self.firstBtn.selected == YES) { ///奇数次选中
        self.label.text = @"你点击了第一个按钮，目前为选中状态";///文字内容改变
    }else{///偶数次选中
        self.label.text = @"第一个按钮的普通状态，第二个按钮又可点击了";
        self.secondBtn.enabled = YES;//打开点击方式
    }
}
///第二个按钮事件
- (void)changeToDisabled:(UIButton *)sender{
    self.secondBtn.enabled = !self.secondBtn.enabled;
    self.label.text = @"第二个按钮不可点击了";
}
@end
