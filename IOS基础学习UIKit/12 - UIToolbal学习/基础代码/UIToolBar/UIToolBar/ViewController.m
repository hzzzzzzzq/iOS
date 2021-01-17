//
//  ViewController.m
//  UIToolBar
//
//  Created by 胡正清 on 2020/8/12.
//  Copyright © 2020 胡正清. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIToolbar *toolBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screen = [UIScreen mainScreen].bounds;
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, screen.size.height-44, screen.size.width, 44)];
    self.toolBar.translucent = NO;//工具栏是否透明
    self.toolBar.barStyle = UIBarStyleDefault;//工具栏风格
    self.toolBar.barTintColor = [UIColor cyanColor];//设置工具栏的颜色
    self.toolBar.tintColor = [UIColor redColor];//设置按钮风格颜色
    
    
    //添加四个按钮
    //第一个 title型按钮  参数一：按钮显示的title 参数二：按钮类型 参数三：添加事件的目标 参数四：响应事件方法
    UIBarButtonItem *btn01 = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:nil action:nil];
    //第二个 系统自带型按钮 以‘相机’图片为例  参数一：选择系统自带的某个类型 参数二：添加事件的目标 参数三：响应事件方法
    UIBarButtonItem *btn02 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    
    //第三个按钮 自定义型按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"icon-voice"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 10, 10);
    UIBarButtonItem *btn03 = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //第四个按钮 自适应空隙程度 显示美观
    UIBarButtonItem *btnFlu = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //加入数组
//    self.toolBar.items = @[btn01,btnFlu,btn02,btnFlu,btn03];
    [self.toolBar setItems:@[btn01,btnFlu,btn02,btnFlu,btn03] animated:YES];
    
    [self.view addSubview:self.toolBar];
}


@end
