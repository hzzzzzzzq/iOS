//
//  ViewController.m
//  UIAlertViewController
//
//  Created by 胡正清 on 2020/8/10.
//  Copyright © 2020 胡正清. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIAlertController *alertController;
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击弹框" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blackColor];
    btn.frame = CGRectMake(50, 200, self.view.bounds.size.width-100, self.view.bounds.size.height-400);
    [btn addTarget:self action:@selector(showAlert:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    
}

- (void)showAlert:(UIButton *)sender{
    ///  中间弹框
    self.alertController = [UIAlertController alertControllerWithTitle:@"我爱你" message:@"就像风走-了千万里，从不问归期" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"红色按钮，千万别点" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        ///按钮需要进行的事件
        ///  底部弹框
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"你看吧！" message:@"又又又弹出来一个" preferredStyle:UIAlertControllerStyleActionSheet];
        [alert addAction:[UIAlertAction actionWithTitle:@"这个可以点了，不逗你了" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"不想逗你了，香香～～～～～");
        }]];
        [alert addAction:[UIAlertAction actionWithTitle:@"这个是不是不想点" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"没错，它什么都没有");
        }]];
        
        ///修改底部弹框的标题文字大小，
        ///TODO颜色这样不能改
        NSMutableAttributedString *alertStrTitle = [[NSMutableAttributedString alloc] initWithString:@"你看吧！"];
        [alertStrTitle addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:29],/*NSForegroundColorAttributeName:[UIColor blackColor]*/} range:NSMakeRange(0, 4)];
        [alert setValue:alertStrTitle forKey:@"attributedTitle"];
        
        ///修改底部弹框的内容大小，颜色这样改不了
        ///TODO颜色这样不能改
        NSMutableAttributedString *alertStrMessage = [[NSMutableAttributedString alloc] initWithString:@"又又又弹出来一个"];
        [alertStrMessage addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8],/*NSForegroundColorAttributeName:[UIColor cyanColor]*/} range:NSMakeRange(0, 4)];
        [alert setValue:alertStrMessage forKey:@"attributedMessage"];

        /// 修改底部弹框的按钮颜色
        NSArray *arrayOfAction = [alert actions];
        [arrayOfAction.firstObject setValue:[UIColor purpleColor] forKey:@"titleTextColor"];
        [arrayOfAction.lastObject setValue:[UIColor cyanColor] forKey:@"titleTextColor"];
        
        
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //按钮事件
        NSLog(@"ok按钮被你点了");
    }];
    UIAlertAction *allAction = [UIAlertAction actionWithTitle:@"oh" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //按钮事件
        NSLog(@"oh按钮被你点击了！！！");
    }];
    [self.alertController addAction:cancleAction];
    [self.alertController addAction:okAction];
    [self.alertController addAction:allAction];
    [self.alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入内容";
    }];
    
    //修改题目颜色 key中内容必须使用  attributedTitle  来标记是修改标题
    NSMutableAttributedString *alertStr = [[NSMutableAttributedString alloc] initWithString:@"我爱你"];
    [alertStr addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, 3)];
    [self.alertController setValue:alertStr forKey:@"attributedTitle"];
    
    //修改内容字体大小颜色  key中内容 必须使用  attributedMessage 来标记是内容
    NSMutableAttributedString *alertMessage = [[NSMutableAttributedString alloc] initWithString:@"就像风走-了千万里，从不问归期"];
    [alertMessage addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, 10)];
    [self.alertController setValue:alertMessage forKey:@"attributedMessage"];
    
    //修改第一个按钮颜色 key中内容 必须使用 titleTextColor 来标记是按钮
    NSArray *actionArr = [_alertController actions]; // 获得添加过的按钮
    [actionArr.firstObject setValue:[UIColor orangeColor] forKey:@"titleTextColor"];//标记颜色
    [actionArr.lastObject setValue:[UIColor purpleColor] forKey:@"titleTextColor"];
    [actionArr[1] setValue:[UIColor cyanColor] forKey:@"titleTextColor"];
    
    //自定义的。。还没弄
//    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.alertController.view.bounds.size.width-20, 200)];
//    self.label.text = @"我像是一个你可有可无的影子\n冷冷的说着你悲伤的心事\n对爱无计可施\n是什么让你这样迷恋这样的\nhi啊身份卡萨拉萨发生发生";
//    self.label.textAlignment = NSTextAlignmentLeft;
//    self.label.numberOfLines = 0;
//    [self.alertController.view addSubview:self.label];
        [self presentViewController:self.alertController animated:YES completion:nil];
}
@end
