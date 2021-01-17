//
//  ViewController.m
//  Demo_UIScrollView
//
//  Created by 胡正清 on 2020/8/22.
//  Copyright © 2020 胡正清. All rights reserved.
//

/*
 ****
/// 找图片真难，都是为了养眼
        实现纵向和横向图片布局：
        要求：
            要有两个ScrollView 一个纵向，一个横向
            需要有五张图片（图片大小自定）
            纵向scrollview可以上下滑动 不按整页滑动
            横向可以左右滑动 按整页滑动
 ****
 */
#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView1;
@property (nonatomic, strong) UIScrollView *scrollView2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView1 = [[UIScrollView alloc] init];
    self.scrollView1.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width);
    self.scrollView1.pagingEnabled = YES;
    self.scrollView1.scrollEnabled = YES;
    //设置画布大小，画布显示在滚动视图内部，一般大于frame的大小
    self.scrollView1.contentSize = CGSizeMake(self.view.bounds.size.width*7, self.view.bounds.size.width);//*7表示画布的宽度 ///因为我打算放七张图片
    self.scrollView1.bounces = NO;
    self.scrollView1.alwaysBounceHorizontal = YES;
    self.scrollView1.showsHorizontalScrollIndicator = YES;
    
    self.scrollView1.contentOffset = CGPointMake(0, 0);
    self.scrollView1.delegate = self;
    self.scrollView1.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    //缩小的最小比例 默认为1
    self.scrollView1.minimumZoomScale = 0.8;
    //放大的最大比例 默认为1
    self.scrollView1.maximumZoomScale = 1;
    for(int i = 0; i < 7; i++){
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"scrollView1_%d",i+1]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, self.view.bounds.size.width);
        [self.scrollView1 addSubview:imageView];
    }
    [self.view addSubview:self.scrollView1];
    
    
    self.scrollView2 = [[UIScrollView alloc] init];
    self.scrollView2.frame = CGRectMake(0, self.view.bounds.size.width, self.view.bounds.size.width, self.view.bounds.size.height-self.view.bounds.size.width);
    self.scrollView2.pagingEnabled = NO;
    self.scrollView2.delegate = self;
    self.scrollView2.alwaysBounceVertical = YES;
    self.scrollView2.showsVerticalScrollIndicator = YES;
    self.scrollView2.contentOffset = CGPointMake(0, 0);
    self.scrollView2.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    self.scrollView2.contentSize = CGSizeMake(self.view.bounds.size.width, (self.view.bounds.size.height+150)*7);
    for(int i = 0; i < 7; i++){
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"scrollView2_%d",i+1]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(0, (self.view.bounds.size.height+150)*i, self.view.bounds.size.width, self.view.bounds.size.height+150);
        [self.scrollView2 addSubview:imageView];
    }
    [self.view addSubview:self.scrollView2];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.scrollView1]) {
        NSLog(@"视图1 : x = %.2f",scrollView.contentOffset.x);
    }else{
        NSLog(@"视图2 : y = %.2f",scrollView.contentOffset.y);
    }
    
}
//当滚动视图结束拖动时调用此函数
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if ([scrollView isEqual:self.scrollView1]) {
        NSLog(@"滚动视图--1--结束拖动");
    }else{
        NSLog(@"滚动视图--2--结束拖动");
    }
    
}
//当滚动视图开始拖动时调用此函数
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.scrollView1]) {
           NSLog(@"滚动视图--1--开始拖动");
       }else{
           NSLog(@"滚动视图--2--开始拖动");
       }
    
}
    //视图即将结束拖动时调用
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if ([scrollView isEqual:self.scrollView1]) {
        NSLog(@"视图--1--即将结束拖动");
    }else{
        NSLog(@"视图--2--即将结束拖动");
    }
    
}
//视图即将减速时调用
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.scrollView1]) {
        NSLog(@"视图--1--即将减速");
    }else{
        NSLog(@"视图--2--即将减速");
    }
    
}
//视图已经结束减速时调用，视图停止的瞬间调用
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.scrollView1]) {
        NSLog(@"视图-1-停止移动");
    }else{
        NSLog(@"视图-2-停止移动");
    }
    
}


@end
