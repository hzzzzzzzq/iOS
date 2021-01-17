//
//  ViewController2.m
//  UINavigationController
//
//  Created by 胡正清 on 2020/8/12.
//  Copyright © 2020 胡正清. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationItem.leftItemsSupplementBackButton = YES;//表示可以在原来返回的按钮之外显示自己添加的左侧Item
    self.navigationItem.hidesBackButton = NO;//是否隐藏左侧原有的返回按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 100, 50);
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backViewController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.prompt = @"说明";//显示在导航栏上的说明性文本
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor cyanColor];
    label.frame = CGRectMake(0, 0, 50, 50);
    label.text = @"之外";
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:label];
    self.navigationController.toolbarHidden = NO;//导航栏自带的工具栏是否显示
    
    //当键盘出现时，导航控制器的导航栏工具栏将隐藏。当键盘关闭时，这些条线将保持隐藏状态，但在内容区域中点击一下将显示它们
    self.navigationController.hidesBarsWhenKeyboardAppears = YES;
    self.navigationController.navigationBarHidden = NO;//隐藏或显示导航栏
    NSLog(@"%@", self.navigationController.topViewController);//返回顶部视图控制器 即当前视图
    NSLog(@"%@",self.navigationController.viewControllers);//返回到该视图为止的所有控制器
    NSLog(@"%@",self.navigationController.visibleViewController);//返回模态视图控制器（如果存在）。否则顶视图控制器 ：正常情况为当前视图
}
- (void)backViewController{
    [self.navigationController popViewControllerAnimated:YES];//返回上一视图
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
