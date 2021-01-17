//
//  ViewController.m
//  UIScrollView
//
//  Created by 胡正清 on 2020/8/11.
//  Copyright © 2020 胡正清. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //定义并创建一个滚动视图
    //可以 对视图内容进行滚动屏查看功能
    self.scrollView = [[UIScrollView alloc] init];
    
    //设置滚动视图的位置和大小
    self.scrollView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    //是否按照整页来滚动视图
    self.scrollView.pagingEnabled = YES;
    //是否可以开启滚动效果
    self.scrollView.scrollEnabled = YES;
    //设置画布大小，画布显示在滚动视图内部，一般大于frame的大小
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*7, self.view.bounds.size.height);//*7表示画布的宽度 ///因为我打算放七张图片
    //是否可以边缘弹动效果
    self.scrollView.bounces = NO;
    //是否开启横向弹动效果 YES 开启 ，NO 不开启
    self.scrollView.alwaysBounceHorizontal = YES;
    //是否开启纵向弹动效果 YES 开启 ，NO 不开启
    self.scrollView.alwaysBounceVertical = YES;
    //是否显示横向滚动条 YES 显示 ， NO 不显示
    self.scrollView.showsHorizontalScrollIndicator = YES;
    //是否显示纵向滚动条 YES 显示 ， NO 不显示
    self.scrollView.showsVerticalScrollIndicator = YES;
    //设置背景颜色
    self.scrollView.backgroundColor = [UIColor cyanColor];
    //滚动视图画布的移动位置，偏移位置 功能：决定画布显示的最终图像结果
    self.scrollView.contentOffset = CGPointMake(0, 0);
    //设定协议
    self.scrollView.delegate = self;
    //是否允许通过点击屏幕让滚动视图响应事件
    //YES：滚动视图可以接受触碰事件 NO：不接受触屏事件
    self.scrollView.userInteractionEnabled = YES;
    //设定滚动条在scrollView的中心位置
    self.scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    //设定滚动条的样式
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    //改变scrollerView的减速点位置
    self.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
    //监控当前目标是否在被跟踪 YES 表示正在被跟踪 NO表示没有
    NSLog(@"%d",self.scrollView.tracking);
    //监控当前目标是否正在被拖拽 YES 表示正在被拖拽 NO表示没有
    NSLog(@"%d",self.scrollView.dragging);
    //监控当前目标是否正在减速
    NSLog(@"%d",self.scrollView.decelerating);
    //控制视图是否延时调用开始滚动的方法
    NSLog(@"%d",self.scrollView.delaysContentTouches);
    //控制控件是否接触取消touch的事件
    NSLog(@"%d",self.scrollView.canCancelContentTouches);
    //缩小的最小比例 默认为1
    self.scrollView.minimumZoomScale = 0.8;
    //放大的最大比例 默认为1
    self.scrollView.maximumZoomScale = 1.2;
    //设置变化比例 默认为1
    self.scrollView.zoomScale = 1.0;
    //控制缩放的时候是否会反弹
    self.scrollView.bouncesZoom = YES;
    //判断控件的大小是否正在改变
    NSLog(@"%d",self.scrollView.zooming);
    //判断是否正在进行缩放反弹
    NSLog(@"%d",self.scrollView.zoomBouncing);
    //控制控件滚动到顶部
    [self.scrollView scrollsToTop];
    
    //使用循环创建五张图片视图
    for(int i = 0; i < 7; i++){
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.scrollView addSubview:imageView];
    }
    [self.view addSubview:self.scrollView];
    
}
//当滚动视图移动时，只要offset坐标发生变化，都会调用此函数
//参数：调用此协议的滚动视图对象
//用此函数来监控滚动视图的位置
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"x = %f",scrollView.contentOffset.x);
}
//当滚动视图结束拖动时调用此函数
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"滚动视图结束拖动");
}
//当滚动视图开始拖动时调用此函数
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"滚动视图开始拖动");
}
//视图即将结束拖动时调用
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"视图即将结束拖动");
}
//视图即将减速时调用
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"视图即将减速");
}
//视图已经结束减速时调用，视图停止的瞬间调用
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"视图停止移动");
}
@end
