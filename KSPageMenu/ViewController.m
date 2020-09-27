//
//  ViewController.m
//  KSPageMenu
//
//  Created by aDu on 2020/9/14.
//  Copyright © 2020 aDu. All rights reserved.
//

#import "ViewController.h"
#import "KSHomeController.h"
#import "KSPageMenu/KSPageBasicTitleView.h"
#import "KSPageMenu/KSPageMenuConfig.h"

@interface ViewController ()<KSPageTitleViewDelegate, KSPageTitleViewDataSrouce>

@property (nonatomic, strong) KSPageBasicTitleView *titleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createTitleView];
}

#pragma mark ====== 创建标题 ======
- (void)createTitleView {
    KSPageMenuConfig *config = [KSPageMenuConfig defaultConfig];
    
    //创建标题
    self.titleView = [[KSPageBasicTitleView alloc] initWithConfig:config];
    self.titleView.frame = CGRectMake(0, 0, self.view.frame.size.width, config.titleViewHeight);
    [self.titleView registerClass:[KSPageTitleCell class] forTitleViewCellWithReuseIdentifier:@"KSPageTitleCell1"];
    self.titleView.delegate = self;
    self.titleView.dataSource = self;
    [self.view addSubview:self.titleView];
}

#pragma mark ====== KSPageTitleViewDelegate ======
- (BOOL)pageTitleViewDidSelectedAtIndex:(NSInteger)index {
    return YES;
}

#pragma mark ====== KSPageTitleViewDataSrouce ======
- (NSString *)pageTitleViewTitleForIndex:(NSInteger)index {
    return [self titlesAry][index];
}

- (NSInteger)pageTitleViewNumberOfTitle {
    return [self titlesAry].count;
}

/// 自定义cell方法
- (__kindof KSPageTitleCell *)pageTitleViewCellForItemAtIndex:(NSInteger)index {
    KSPageTitleCell *cell = [self.titleView dequeueReusableCellWithIdentifier:@"KSPageTitleCell1" forIndex:index];
//    cell.title = [self titles][index];
    return cell;
}

#pragma mark ====== 系统方法 ======
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    KSHomeController *homeVC = [KSHomeController new];
    [self.navigationController pushViewController:homeVC animated:YES];
}

#pragma mark ====== init ======
- (NSArray *)titlesAry {
    return @[@"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", @"星期日"];
}

@end
