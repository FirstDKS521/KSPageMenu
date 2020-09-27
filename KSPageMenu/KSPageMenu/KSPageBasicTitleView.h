//
//  KSPageBasicTitleView.h
//  KSPageMenu
//
//  Created by aDu on 2020/9/14.
//  Copyright © 2020 aDu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSPageMenuConfig.h"
#import "KSPageTitleCell.h"

NS_ASSUME_NONNULL_BEGIN

@protocol KSPageTitleViewDataSrouce <NSObject>

@required

/**
 根据index返回对应的标题
 @param index 当前位置
 @return 返回要展示的标题
 */
- (NSString *)pageTitleViewTitleForIndex:(NSInteger)index;

/**
 要展示分页数
 @return 返回分页数
 */
- (NSInteger)pageTitleViewNumberOfTitle;

/// 自定义cell方法
- (__kindof KSPageTitleCell *)pageTitleViewCellForItemAtIndex:(NSInteger)index;

@end

@protocol KSPageTitleViewDelegate <NSObject>

/**
 选中位置代理方法
 @param index 所选位置
 */
- (BOOL)pageTitleViewDidSelectedAtIndex:(NSInteger)index;

@end

@interface KSPageBasicTitleView : UIView

/// 数据源
@property (nonatomic, weak) id <KSPageTitleViewDataSrouce> dataSource;

/// 代理方法
@property (nonatomic, weak) id <KSPageTitleViewDelegate> delegate;

/// 选中位置
@property (nonatomic, assign) NSInteger selectedIndex;

/// 上一次选中的位置
@property (nonatomic, assign) NSInteger lastSelectedIndex;

/// 动画的进度
@property (nonatomic, assign) CGFloat animationProgress;

/// 停止动画，在手动设置位置时，不显示动画效果
@property (nonatomic, assign) BOOL stopAnimation;

/// 右侧按钮
@property (nonatomic, strong) UIButton *rightButton;

/**
 初始化方法
 @param config 配置信息
 @return TitleView 实例
 */
- (instancetype)initWithConfig:(KSPageMenuConfig *)config;

/// 刷新数据，当标题信息改变时调用
- (void)reloadData;

/// 自定义标题栏时用到
- (void)registerClass:(Class)cellClass forTitleViewCellWithReuseIdentifier:(NSString *)identifier;

/// cell 复用方法
- (__kindof KSPageTitleCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier forIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
