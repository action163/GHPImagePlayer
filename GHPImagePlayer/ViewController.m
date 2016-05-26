//
//  ViewController.m
//  GHPImagePlayer
//
//  Created by jzl on 16/5/24.
//  Copyright © 2016年 jiaozhenlong. All rights reserved.
//

#import "ViewController.h"
#import <SDCycleScrollView.h>

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<SDCycleScrollViewDelegate>
{
    float _height;
}
@property(nonatomic,strong)SDCycleScrollView* netImagePlayer;
@property(nonatomic,strong)SDCycleScrollView* localImagePlayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _height = kScreenWidth/1.4;
    self.automaticallyAdjustsScrollViewInsets = NO; //若位置不准确请设置此项
    [self loadLocalImagePlayer];
    [self loadNetImagePlayer];
}
-(void)loadNetImagePlayer{
    //推荐使用,含代理方法和占位图片
    self.netImagePlayer =[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(10, 40, kScreenWidth-20, _height) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    /*这种初始化方法则相对比较单一
     self.netImagePlayer＝[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(10, 40, kScreenWidth-20, _height)imageURLStringsGroup:@[@"这个数组填写图片的url地址"]];*/
    
    //设置圆角
    self.netImagePlayer.layer.masksToBounds = YES;
    self.netImagePlayer.layer.cornerRadius = 10;
    
    //设置pageControl风格：动画显示
    self.netImagePlayer.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [self.view addSubview:self.netImagePlayer];
    
    //设置图片数组
    self.netImagePlayer.imageURLStringsGroup = @[@"http://pic2.ooopic.com/12/84/85/18b1OOOPIC73.jpg",
                                                 @"http://pic.yesky.com/imagelist/10/17/11579812_113.jpg",
                                                 @"http://image.tianjimedia.com/uploadImages/2012/233/31/5L6MD62UCC0B.jpg",
                                                 @"http://pic2.ooopic.com/12/55/96/44bOOOPIC1e_1024.jpg"];
    //设置图片标题
    self.netImagePlayer.titlesGroup = @[@"夏.游记",@"千般蹉跎",@"万般嗟叹",@"勇敢坚强"];
    //设置标题字体大小
    self.netImagePlayer.titleLabelTextFont = [UIFont systemFontOfSize:17];
    //设置标题Label高度
    self.netImagePlayer.titleLabelHeight = 40;
}

-(void)loadLocalImagePlayer{

      self.localImagePlayer =[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(10, _height+100, kScreenWidth-20, _height) imageNamesGroup:@[@"h1.jpg",@"h2.jpg",@"h3.jpg",@"h4.jpg"]];
    
     /*  shouldInfiniteLoop是否无限循环
      self.localImagePlayer =[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(10, _height+100, kScreenWidth-20, _height) shouldInfiniteLoop:YES imageNamesGroup:@[@"h1.jpg",@"h2.jpg",@"h3.jpg",@"h4.jpg"]];*/
    
     //设置pageControl风格：动画显示
      self.localImagePlayer.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    
    //设置pageControl位置
      self.localImagePlayer.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
      [self.view addSubview:self.localImagePlayer];
    
}

// SDCycleScrollViewDelegate
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"点击图片时的代理方法");
}
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    NSLog(@"滑动时的代理方法");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
