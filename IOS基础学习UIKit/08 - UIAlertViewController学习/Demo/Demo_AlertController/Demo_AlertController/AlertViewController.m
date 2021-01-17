//
//  AlertViewController.m
//  Demo_AlertController
//
//  Created by 胡正清 on 2020/8/11.
//  Copyright © 2020 胡正清. All rights reserved.
//
/***
 
            弹框Demo
    实现两种类型的弹框：
        要求：
             1、首先采用Alert的弹框方式弹出内容：
                 a)标题：Alert类型弹框
                 b)内容：我来使用中间弹框了！
                 c)添加两个按钮：一个名为cancel按钮 一个为sheet弹框的按钮
                 d)需要修改标题颜色为 redColor（系统自带）
                 e)内容颜色 中间弹框四个字颜色改为 cyanColor
                 f)sheet弹框  按钮 改为 magentaColor
             2、在sheet按钮中添加事件 加入第二类型的弹框
                 a)标题：Sheet类型弹框
                 b)内容：我来使用底部弹框了！
                 c)添加三个按钮：一个cancel，一个OK，一个红色的名为“不可点”按钮
                 d)修改标题的字体大小为28 内容大小为14
 
 ***/
#import "AlertViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    /// 设置一个按钮来点击 出现弹框
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 300, self.view.bounds.size.width-200, 50);
    [btn setTitle:@"点我出现弹框" forState:UIControlStateNormal];
    [btn setTitle:@"松手就有弹框了" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor purpleColor];
    btn.layer.cornerRadius = 15;
    btn.clipsToBounds = YES;
    [btn addTarget:self action:@selector(showAlertView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)showAlertView:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert类型弹框" message:@"我来使用中间弹框了！" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //添加事件
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"sheet弹框" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       //添加 sheet弹框
        UIAlertController *sheetController = [UIAlertController alertControllerWithTitle:@"Sheet类型弹框" message:@"我来使用底部弹框了!" preferredStyle:UIAlertControllerStyleActionSheet];
        [sheetController addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
            NSLog(@"取消");
        }]];
        [sheetController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"欢迎下次再次点击！");
        }]];
        [sheetController addAction:[UIAlertAction actionWithTitle:@"不可点" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            //红色按钮 不添加事件
            NSLog(@"您点击了不可点的按钮，需要接受惩罚！");
        }]];
        //修改标题字体大小28
        NSMutableAttributedString *strWithSheetTitle = [[NSMutableAttributedString alloc] initWithString:@"Sheet类型弹框"];
        [strWithSheetTitle addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:28]} range:NSMakeRange(0, 9)];
        [sheetController setValue:strWithSheetTitle forKey:@"attributedTitle"];
        //修改内容字体大小14
        NSMutableAttributedString *strWithSheetMessage = [[NSMutableAttributedString alloc] initWithString:@"我来使用底部弹框了!"];
        [strWithSheetMessage addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} range:NSMakeRange(0, 10)];
        [sheetController setValue:strWithSheetMessage forKey:@"attributedMessage"];
        
        [self presentViewController:sheetController animated:YES completion:nil];
    }]];
    //修改标题颜色
    NSMutableAttributedString *strWithAlertTitle = [[NSMutableAttributedString alloc] initWithString:@"Alert类型弹框"];
    [strWithAlertTitle addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} range:NSMakeRange(0, 9)];
    [alertController setValue:strWithAlertTitle forKey:@"attributedTitle"];
    //修改内容颜色
    NSMutableAttributedString *strWithAlertMessage = [[NSMutableAttributedString alloc] initWithString:@"我来使用中间弹框了！"];
    [strWithAlertMessage addAttributes:@{NSForegroundColorAttributeName:[UIColor cyanColor]} range:NSMakeRange(4, 4)];
    [alertController setValue:strWithAlertMessage forKey:@"attributedMessage"];
    //修改按钮颜色
    NSArray *array = [alertController actions];
    [array.lastObject setValue:[UIColor magentaColor] forKey:@"titleTextColor"];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
