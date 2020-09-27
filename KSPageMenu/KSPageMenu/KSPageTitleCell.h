//
//  KSPageTitleCell.h
//  KSPageMenu
//
//  Created by aDu on 2020/9/15.
//  Copyright © 2020 aDu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSPageMenuUtil.h"
#import "KSPageMenuConfig.h"

//动画类行，已选cell/将要成为已选的cell
typedef NS_ENUM (NSInteger ,KSPageTitleCellAnimationType) {
    KSPageTitleCellAnimationTypeSelected = 0,
    KSPageTitleCellAnimationTypeWillSelected = 1,
};
NS_ASSUME_NONNULL_BEGIN

@interface KSPageTitleCell : UICollectionViewCell

//配置信息 默认样式时用到
@property (nonatomic, strong) KSPageMenuConfig *config;

//标题label
@property (nonatomic, strong) UILabel *textLabel;

//配置cell
/**
 配置cell选中/未选中UI
 @param selected 已选中/未选中
 */
- (void)configCellOfSelected:(BOOL)selected;

/**
 执行动画方法，默认样式中有标题颜色过渡的方法，用户如需添加其他动画，可在此方法中添加
 @param progress 动画进度 0~1
 @param type cell类行，已选中cell/将要选中cell
 */
- (void)showAnimationOfProgress:(CGFloat)progress type:(KSPageTitleCellAnimationType)type;

@end

NS_ASSUME_NONNULL_END
