//
//  KSPageMenuUtil.h
//  KSPageMenu
//
//  Created by aDu on 2020/9/17.
//  Copyright © 2020 aDu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KSPageMenuConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSPageMenuUtil : NSObject

//文字宽度
+ (CGFloat)widthForText:(NSString *)text font:(UIFont *)font size:(CGSize)size;

//颜色过渡
+ (UIColor *)colorTransformFrom:(UIColor*)fromColor to:(UIColor *)toColor progress:(CGFloat)progress;

//执行阴影动画
+ (void)showAnimationToShadow:(UIView *)shadow shadowWidth:(CGFloat)shadowWidth fromItemRect:(CGRect)fromItemRect toItemRect:(CGRect)toItemRect type:(KSPageShadowLineAnimationType)type progress:(CGFloat)progress;

@end

/// 兼容子view滚动，添加"让我先滚"属性
@interface UIView (KSLetMeScroll)

/// 让我先滚 默认 NO
@property (nonatomic, assign) BOOL ks_letMeScrollFirst;

@end

/// 子视图控制器的缓存，添加扩展标题
@interface UIViewController (KSTitle)

/// 添加扩展标题
@property (nonatomic, copy) NSString *ks_title;

@end

typedef BOOL(^KSOtherGestureRecognizerBlock)(UIGestureRecognizer *otherGestureRecognizer);

@interface UIScrollView (KSGestureRecognizer)<UIGestureRecognizerDelegate>

@property (nonatomic, copy) KSOtherGestureRecognizerBlock ks_otherGestureRecognizerBlock;

@end

NS_ASSUME_NONNULL_END
