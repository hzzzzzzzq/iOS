//
//  ViewController.m
//  WKWebView
//
//  Created by 胡正清 on 2020/8/11.
//  Copyright © 2020 胡正清. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
@interface ViewController ()<WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *wkWebView;
@property (nonatomic, strong) WKWebViewConfiguration *config;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.config = [WKWebViewConfiguration new];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 200, self.view.bounds.size.width-100, 50);
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"123" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(handeToBaidu:) forControlEvents:UIControlEventTouchUpInside];
    
    
    WKWebViewConfiguration * config =[[WKWebViewConfiguration alloc] init];
    config.userContentController =[[WKUserContentController alloc] init];
    //初始化偏好设置属性
    config.preferences =[[WKPreferences alloc] init];
    // 是否支持JavaScript
    config.preferences.javaScriptEnabled =YES;
    //不通过交互是否打开窗口
    config.preferences.javaScriptCanOpenWindowsAutomatically =NO;

    
    self.wkWebView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds configuration:config];
    self.wkWebView.backgroundColor = [UIColor whiteColor];
    self.wkWebView.navigationDelegate = self;
    self.wkWebView.scrollView.bounces = NO;
    
    [self.view addSubview:btn];
    [self.view addSubview:self.wkWebView];
    self.wkWebView.hidden=YES;

}
- (void)handeToBaidu:(UIButton *)sender{
//        __weak weakSelf = self;
    self.wkWebView.hidden = NO;
    ///网页加载
    NSString *urlStr = @"https://www.baidu.com";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.wkWebView loadRequest:urlRequest];
    
//    ///html 加载
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"only button" ofType:@"html"];
    NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSError *error = nil;

    NSString *html = [[NSString alloc] initWithContentsOfFile:htmlPath encoding: NSUTF8StringEncoding error:&error];

    if (error == nil) {//数据加载没有错误情况下
        [self.wkWebView loadHTMLString:html baseURL:bundleUrl];
    }
}
//开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"页面开始加载！！！");
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"页面加载失败！！！！！！！！");
}
// 页面加载完毕时调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"页面加载完成！！！！");
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"内容开始返回！！！！");
}

// 当对象即将销毁的时候调用
- (void)dealloc {
    NSLog(@"webView释放");
    self.wkWebView.navigationDelegate = nil;
}
@end
