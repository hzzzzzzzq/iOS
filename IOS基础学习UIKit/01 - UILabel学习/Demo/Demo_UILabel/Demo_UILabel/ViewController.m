//
//  ViewController.m
//  Demo_UILabel
//
//  Created by 胡正清 on 2020/8/14.
//  Copyright © 2020 胡正清. All rights reserved.
//

/*
 ****
 实现Label的一些基本属性和富文本的使用：
 要求：
     1、首先要有三段文字（每段文字50个字，三段文字适当隔开一些距离）
     2、第一段文字要求
         a)要求文字左对齐
         b)要求文字颜色为白色
         c)字体大小为14
         d)字体行数为2行（省略模式为中间省略例如ab...yz）
         e)背景颜色为黑色，图层圆角为15，边框宽度为2 颜色白色
         
     3、第二段文字要求
         a)要求文字居中
         b)要求文字颜色为黑色，字体大小为20
         c)字体行数为0行
         d)前十个字添加下划线，10-20添加删除线，后面三十个字体颜色变为红色，大小改为14
     4、第三段文字要求
         a)要求文字右对齐
         b)颜色为黑色
         c)字体大小为28
         d)行数0
         e)设置所有文字为空心字
 ****
 */

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *firstLabel;///第一个标签
@property (nonatomic, strong) UILabel *secondLabel;///第二个标签
@property (nonatomic, strong) UILabel *thirdLabel;///第三个标签
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ///第一个标签
    self.firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, self.view.bounds.size.width-100, 40)];
    self.firstLabel.text = @"1234567890前面有十个字了，现在开始第二十个字了，随便打一些字就可以，不用那么仔细的数多少个";
    self.firstLabel.textColor = [UIColor whiteColor];///字体白色
    self.firstLabel.textAlignment = NSTextAlignmentLeft;///左对齐
    self.firstLabel.font = [UIFont systemFontOfSize:14];///字体大小14
    self.firstLabel.numberOfLines = 2;///2行
    self.firstLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;///中间省略号
    self.firstLabel.backgroundColor = [UIColor blackColor];///背景黑色
    self.firstLabel.clipsToBounds = YES;
    self.firstLabel.layer.cornerRadius = 15;///圆角15
    self.firstLabel.layer.borderWidth = 2;///边框2
    self.firstLabel.layer.borderColor = [UIColor whiteColor].CGColor;///边框颜色
    [self.view addSubview:self.firstLabel];
        
    ///第二个标签
    self.secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width-100, 100)];
    self.secondLabel.text = @"1234567890前面有十个字了，现在开始第二十个字了，随便打一些字就可以，不用那么仔细的数多少个";
    self.secondLabel.textColor = [UIColor blackColor];///字体白色
    self.secondLabel.textAlignment = NSTextAlignmentCenter;///居中
    self.secondLabel.font = [UIFont systemFontOfSize:20];///字体大小20
    self.secondLabel.numberOfLines = 0;///0行
    self.secondLabel.backgroundColor = [UIColor whiteColor];///背景白色
    NSMutableAttributedString *secString = [[NSMutableAttributedString alloc] initWithString:self.secondLabel.text];
    [secString addAttributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleDouble]} range:NSMakeRange(0, 10)];///添加下划线
    [secString addAttributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlinePatternSolid|NSUnderlineStyleSingle)} range:NSMakeRange(10, 10)];///添加删除线
    [secString addAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} range:NSMakeRange(20, 30)];///颜色 ：红     字体 ：14
    self.secondLabel.attributedText = secString;
    
    [self.view addSubview:self.secondLabel];
        
    ///第三个标签
    self.thirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, self.view.bounds.size.width-100, 400)];
    self.thirdLabel.text = @"1234567890前面有十个字了，现在开始第二十个字了，随便打一些字就可以，不用那么仔细的数多少个";
    self.thirdLabel.textColor = [UIColor blackColor];///字体白色
    self.thirdLabel.textAlignment = NSTextAlignmentRight;///居中
    self.thirdLabel.font = [UIFont systemFontOfSize:28];///字体大小20
    self.thirdLabel.numberOfLines = 0;///0行
    
    ///设置空心字
    NSMutableAttributedString *thiString = [[NSMutableAttributedString alloc] initWithString:self.thirdLabel.text];
    [thiString addAttributes:@{NSStrokeWidthAttributeName:@2,NSStrokeColorAttributeName:[UIColor grayColor]} range:NSMakeRange(0, thiString.length)];
    self.thirdLabel.attributedText = thiString;
    [self.view addSubview:self.thirdLabel];
}


@end
