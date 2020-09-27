//
//  KSHomeController.m
//  KSPageMenu
//
//  Created by aDu on 2020/9/14.
//  Copyright © 2020 aDu. All rights reserved.
//

#import "KSHomeController.h"
#import "KSPageViewController.h"
#import "KSPageViewController.h"

@interface KSHomeController ()<KSPageViewControllerDelegate, KSPageViewControllerDataSrouce>

@property (nonatomic, strong) KSPageViewController *pageViewController;

//配置信息
@property (nonatomic, strong) KSPageMenuConfig *config;

@end

@implementation KSHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initPageView];
}

- (void)initPageView {
    self.config = [KSPageMenuConfig defaultConfig];
    //标题间距
    self.config.titleSpace = 20;
    //标题选中颜色
    _config.titleSelectedColor = [UIColor orangeColor];
    //标题选中字体
    _config.titleSelectedFont = [UIFont systemFontOfSize:16];
    //标题正常颜色
    _config.titleNormalColor = [UIColor lightGrayColor];
    //标题正常字体
    _config.titleNormalFont = [UIFont systemFontOfSize:16];
    //底部线条颜色
    _config.shadowLineColor = [UIColor orangeColor];
    _config.shadowLineHeight = 2.0;
    
    self.pageViewController = [[KSPageViewController alloc] initWithConfig:self.config];
    self.pageViewController.view.frame = self.view.bounds;
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
}

#pragma mark ====== XLPageViewControllerDelegate ======
- (void)pageViewController:(KSPageViewController *)pageViewController didSelectedAtIndex:(NSInteger)index {
    
}

- (UIViewController *)pageViewController:(KSPageViewController *)pageViewController viewControllerForIndex:(NSInteger)index {
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    return vc;
}

- (NSString *)pageViewController:(KSPageViewController *)pageViewController titleForIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"标题%@", @(index)];
}

- (NSInteger)pageViewControllerNumberOfPage {
    return 8;
}

@end
