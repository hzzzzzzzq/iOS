//
//  ViewController.m
//  Demo_UITextField
//
//  Created by 胡正清 on 2020/8/17.
//  Copyright © 2020 胡正清. All rights reserved.
//
/*
画一个登录界面
    要求：
        1、两个label 一个账号，一个密码，两个UITextField，一个登录按钮
        2、第一个不采用密码输入，提示语：“请输入账号”,前面加入一张手机的小图片，不超过11位
        3、第二个采用密码输入方式，提示语：“请输入密码”，前面加入一张锁的小图片，不少于6，不大于16
        4、两个字体都采用黑色字体，大小15
        5、使用不同的键盘类型
        6、label和按钮 按照自己喜好来自定义

*/

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.frame = CGRectMake(50, 100, 50, 50);
    self.nameLabel.text = @"账号";
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.nameLabel];
    
    
    self.passwordLabel = [[UILabel alloc] init];
    self.passwordLabel.text = @"密码";
    self.passwordLabel.textColor = [UIColor blackColor];
    self.passwordLabel.textAlignment = NSTextAlignmentLeft;
    self.passwordLabel.font = [UIFont systemFontOfSize:15];
    self.passwordLabel.frame = CGRectMake(50, 200, 50, 50);
    [self.view addSubview:self.passwordLabel];
    
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    self.nameTextField.placeholder = @"请输入账号";
    self.nameTextField.textColor = [UIColor blackColor];
    self.nameTextField.font = [UIFont systemFontOfSize:15];
    self.nameTextField.delegate = self;
    self.nameTextField.keyboardType = UIKeyboardTypePhonePad;//设置键盘类型
    self.nameTextField.returnKeyType = UIReturnKeySearch;//设置键盘上返回键的类型
    self.nameTextField.keyboardAppearance = UIKeyboardAppearanceLight;//设置键盘的视觉样式
    
    self.nameTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *nameLeftImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    nameLeftImage.image = [UIImage imageNamed:@"icon-phone"];
    self.nameTextField.leftView = nameLeftImage;
    
    [self.view addSubview:self.nameTextField];
    
    self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    self.passwordTextField.placeholder = @"请输入密码";
    self.passwordTextField.textColor = [UIColor blackColor];
    self.passwordTextField.font = [UIFont systemFontOfSize:15];
    self.passwordTextField.delegate = self;
    self.passwordTextField.keyboardType = UIKeyboardTypeNamePhonePad;//设置键盘类型
    self.passwordTextField.returnKeyType = UIReturnKeySearch;//设置键盘上返回键的类型
    self.passwordTextField.keyboardAppearance = UIKeyboardAppearanceLight;//设置键盘的视觉样式
    
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *passwordLeftImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 20, 20)];
    passwordLeftImage.image = [UIImage imageNamed:@"icon-lock"];
    self.passwordTextField.leftView = passwordLeftImage;
    [self.view addSubview:self.passwordTextField];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(50, 300, self.view.bounds.size.width-100, 50);
    [self.btn setTitle:@"登录" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.btn.backgroundColor = [UIColor colorWithRed:243.0/255.0 green:114.0/255.0 blue:87.0/255.0 alpha:1.0];
    [self.btn setTitle:@"不可登录" forState:UIControlStateDisabled];
    [self.btn addTarget:self action:@selector(handleWithEntry:) forControlEvents:UIControlEventTouchUpInside];
    self.btn.layer.cornerRadius = 25;
    self.btn.clipsToBounds = YES;
    [self.view addSubview:self.btn];
    self.btn.enabled = NO;
    
    
    
}
#pragma mark - 按钮点击事件 -
- (void)handleWithEntry:(UIButton *)sender{
    if ([self.nameTextField.text isEqualToString:@"13513513513"] && [self.passwordTextField.text isEqualToString:@"wanan123"]) {
        NSLog(@"登录成功");
    }else{
        NSLog(@"账号或密码错误");
    }
}

#pragma mark - 协议 -
//输入框内容发生变化时就会触发 能及时获取输入框中最新的内容 会少一个字符 需要加入string这个最后字符
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if([textField isEqual:self.passwordTextField]){
        if (textField.text.length+1 >= 16) {
            //最多输入十六位
            self.passwordTextField.text = [textField.text substringToIndex:16];
            NSLog(@"超过上限了");
        }else if(textField.text.length+1 < 6){
            NSLog(@"字符少于6个");
        }
    }else if ([textField isEqual:self.nameTextField]){
        if (textField.text.length >= 10) {
            //最多输入11位
            self.nameTextField.text = [textField.text substringToIndex:10];
            NSLog(@"超过上限了");
        }else{
        }
    }
    if (self.nameTextField.text.length == 11 && self.passwordTextField.text.length >= 6 && self.passwordTextField.text.length <= 16) {
        self.btn.enabled = YES;
    }else{
        self.btn.enabled = NO;
    }
    return YES;
}
@end
