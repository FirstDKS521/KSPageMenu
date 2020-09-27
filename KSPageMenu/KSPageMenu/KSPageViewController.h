//
//  KSPageViewController.h
//  KSPageMenu
//
//  Created by aDu on 2020/9/21.
//  Copyright © 2020 aDu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSPageTitleCell.h"

@class KSPageViewController;
NS_ASSUME_NONNULL_BEGIN

@protocol KSPageViewControllerDelegate <NSObject>

/**
 当页面切换完成时回调该方法，返回切换到的位置
 @param pageViewController 实例
 @param index 切换的位置
 */
- (void)pageViewController:(KSPageViewController *)pageViewController didSelectedAtIndex:(NSInteger)index;

@end

@protocol KSPageViewControllerDataSrouce <NSObject>

@required

/**
 根据index返回对应的ViewController
 @param pageViewController KSPageViewController实例
 @param index 当前位置
 @return 返回要展示的ViewController
 */
- (UIViewController *)pageViewController:(KSPageViewController *)pageViewController viewControllerForIndex:(NSInteger)index;

/**
 根据index返回对应的标题
 @param pageViewController XLPageViewController实例
 @param index 当前位置
 @return 返回要展示的标题
 */
- (NSString *)pageViewController:(KSPageViewController *)pageViewController titleForIndex:(NSInteger)index;

/**
 要展示分页数
 @return 返回分页数
 */
- (NSInteger)pageViewControllerNumberOfPage;

@optional

/// 自定义cell方法
- (__kindof KSPageTitleCell *)pageViewController:(KSPageViewController *)pageViewController titleViewCellForItemAtIndex:(NSInteger)index;

@end

@interface KSPageViewController : UIViewController

/// 代理
@property (nonatomic, weak) id <KSPageViewControllerDelegate> delegate;

/// 数据源
@property (nonatomic, weak) id <KSPageViewControllerDataSrouce> dataSource;

/// 当前位置 默认是0
@property (nonatomic, assign) NSInteger selectedIndex;

/// 滚动开关 默认 开
@property (nonatomic, assign) BOOL scrollEnabled;

/// 滚动到边缘自动回弹 默认 开
@property (nonatomic, assign) BOOL bounces;

/// 添加识别其它手势的代理类
@property (nonatomic, strong) NSArray <NSString *>* respondOtherGestureDelegateClassList;

/// 标题栏右侧按钮
@property (nonatomic, strong) UIButton *rightButton;

/**
 初始化方法
 @param config 配置信息
 @return XLPageViewController 实例
 */
- (instancetype)initWithConfig:(KSPageMenuConfig *)config;

/// 刷新方法，当标题改变时，执行此方法
- (void)reloadData;

/// 自定义标题栏cell时用到
- (void)registerClass:(Class)cellClass forTitleViewCellWithReuseIdentifier:(NSString *)identifier;

/// 自定义标题栏cell时用到，返回复用的cell
- (__kindof KSPageTitleCell *)dequeueReusableTitleViewCellWithIdentifier:(NSString *)identifier forIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
