//
//  KSPageMenuConfig.m
//  KSPageMenu
//
//  Created by aDu on 2020/9/14.
//  Copyright © 2020 aDu. All rights reserved.
//

#import "KSPageMenuConfig.h"

@implementation KSPageMenuConfig

+ (KSPageMenuConfig *)defaultConfig {
    KSPageMenuConfig *config = [[KSPageMenuConfig alloc] init];
    
    //标题-----------------------------------
    //默认未选中标题颜色 灰色
    config.titleNormalColor = [UIColor grayColor];
    //默认选中标题颜色 黑色
    config.titleSelectedColor = [UIColor blackColor];
    //默认未选中标题字体 16号系统字体
    config.titleNormalFont = [UIFont systemFontOfSize:16];
    //默认选中标题字体 16号粗体系统字体
    config.titleSelectedFont = [UIFont boldSystemFontOfSize:16];
    //默认标题间距 10
    config.titleSpace = 10;
    //默认过渡动画 打开
    config.titleColorTransition = true;
    
    //标题栏------------------------------------
    //默认标题栏缩进 左右各缩进10
    config.titleViewInset = UIEdgeInsetsMake(0, 10, 0, 10);
    //默认标题栏高度 40
    config.titleViewHeight = 40.0f;
    //默认标题栏背景颜色 透明
    config.titleViewBackgroundColor = [UIColor clearColor];
    //默认标题栏对齐方式 局左
    config.titleViewAlignment = KSPageTitleViewAlignmentLeft;
    
    //阴影--------------------------------------
    //默认显示阴影
    config.shadowLineHidden = false;
    //默认阴影宽度 30
    config.shadowLineWidth = 30.0f;
    //默认阴影高度 2
    config.shadowLineHeight = 2.0f;
    //默认阴影颜色 黑色
    config.shadowLineColor = [UIColor blackColor];
    //默认阴影动画 平移
    config.shadowLineAnimationType = KSPageShadowLineAnimationTypePan;
    
    //底部分割线-----------------------------------
    //默认显示分割线
    config.separatorLineHidden = false;
    //默认分割线颜色 浅灰色
    config.separatorLineColor = [UIColor lightGrayColor];
    //默认分割线高度 0.5
    config.separatorLineHeight = 0.5f;
    
    //分段式标题颜色------------------------------
    //默认分段式选择器颜色 黑色
    config.segmentedTintColor = [UIColor blackColor];
    
    return config;
}

@end
