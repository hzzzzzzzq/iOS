//
//  ViewController.m
//  Demo_UITextView
//
//  Created by 胡正清 on 2020/8/21.
//  Copyright © 2020 胡正清. All rights reserved.
//

/*
 ****
    使用textView视图视图：本身没有placeholder
        要求：
            1、创建一个label用来接收textView输入的内容 居中 左右侧隔开50，高度100，居上100，字体14，颜色黑，居中对齐
            2、创建一个textView 居中 左右侧隔开50，高度200，居上200，背景rgb都为224；
            3、使用label的方式添加一个placeholder 即提示文本 灰色字体 大小15
            4、textView的字体也为15 黑色字体 左对齐 文字输入 居左20 居上20
            5、使用inputAccessoryView加入一个文本输入框 类似于聊天时的输入界面 (只是一个界面展示效果，不做其他输入类要求)
            6、使用协议改变label中的内容（编辑完成时改变或编辑中改变 选一即可，响应键盘return事件）
 ****
 */

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width-100, 100)];
    self.label.textColor = [UIColor blackColor];
    self.label.font = [UIFont systemFontOfSize:14];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(50, 200, self.view.bounds.size.width-100, 200)];
    self.textView.backgroundColor = [UIColor colorWithRed:224.0/255.0 green:224.0/255.0 blue:224.0/255.0 alpha:1.0];
    self.textView.font = [UIFont systemFontOfSize:15];
    self.textView.textColor = [UIColor blackColor];
    self.textView.textAlignment = NSTextAlignmentLeft;//对齐方式
    self.textView.editable = YES;//文本是否可以编辑
    self.textView.selectable = YES;// 文本是否可以选择
    self.textView.allowsEditingTextAttributes = NO;// 是否允许编辑文本属性
    self.textView.layer.cornerRadius = 15;
    self.textView.clipsToBounds = YES;
    self.textView.keyboardType = UIKeyboardTypeDefault;
    self.textView.keyboardAppearance = UIKeyboardAppearanceDark;
    self.textView.returnKeyType = UIReturnKeyDone;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake( 0, 0, self.view.bounds.size.width, 50)];
    view.backgroundColor = [UIColor whiteColor];
    //加入弹出时的文本视图
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 10, view.bounds.size.width-40, view.bounds.size.height-20)];
    textField.backgroundColor = [UIColor blackColor];
    textField.placeholder = @"输入框";
    textField.textColor = [UIColor whiteColor];
    textField.layer.cornerRadius = 15;
    textField.clipsToBounds = YES;
    textField.layer.borderColor = [UIColor grayColor].CGColor;
    textField.layer.borderWidth = 1;
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, textField.bounds.size.height)];
    [view addSubview:textField];
    self.textView.inputAccessoryView = view;// 输入域切换视图 带键盘一起弹出
    self.textView.textContainerInset = UIEdgeInsetsMake(20, 20, 0, 0); //文本边距 离顶部左边的距离等
    self.textView.delegate = self;
    [self.view addSubview:self.textView];
        
}

//  文本已经结束编辑时触发的方法
- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.label.text = textView.text;
    NSLog(@"已经结束编辑");
}

//  文本内容将要发生改变时触发的方法
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"]){
        [self.textView endEditing:YES];
        return NO;
    }
    NSLog(@"文本内容将要发生改变");
    return YES;
}

//  文本内容已经发生改变时触发的方法
- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"文本内容已经发生改变");
}
@end
