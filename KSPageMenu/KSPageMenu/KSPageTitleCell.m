//
//  KSPageTitleCell.m
//  KSPageMenu
//
//  Created by aDu on 2020/9/15.
//  Copyright © 2020 aDu. All rights reserved.
//

#import "KSPageTitleCell.h"

@interface KSPageTitleLabel : UILabel

@property (nonatomic, assign) KSPageTextVerticalAlignment textVerticalAlignment;

@end

@implementation KSPageTitleLabel

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.textVerticalAlignment) {
        case KSPageTextVerticalAlignmentCenter:
            textRect.origin.y = (bounds.size.height - textRect.size.height)/2.0;
            break;
        case KSPageTextVerticalAlignmentTop: {
            CGFloat topY = self.font.pointSize > [UIFont labelFontSize] ? 0 : 2;
            textRect.origin.y = topY;
        }
            break;
        case KSPageTextVerticalAlignmentBottom:
            textRect.origin.y = bounds.size.height - textRect.size.height;
            break;
        default:
            break;
    }
    return textRect;
}

- (void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}

@end

@implementation KSPageTitleCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.textLabel = [[KSPageTitleLabel alloc] init];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.textLabel];
        self.config = [KSPageMenuConfig defaultConfig];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.textLabel.frame = self.bounds;
}

- (void)configCellOfSelected:(BOOL)selected {
    self.textLabel.textColor = selected ? self.config.titleSelectedColor : self.config.titleNormalColor;
    self.textLabel.font = selected ? self.config.titleSelectedFont : self.config.titleNormalFont;
    KSPageTitleLabel *label = (KSPageTitleLabel *)self.textLabel;
    label.textVerticalAlignment = self.config.textVerticalAlignment;
}

- (void)showAnimationOfProgress:(CGFloat)progress type:(KSPageTitleCellAnimationType)type {
    if (type == KSPageTitleCellAnimationTypeSelected) {
        self.textLabel.textColor = [KSPageMenuUtil colorTransformFrom:self.config.titleSelectedColor to:self.config.titleNormalColor progress:progress];
    } else if (type == KSPageTitleCellAnimationTypeWillSelected){
        self.textLabel.textColor = [KSPageMenuUtil colorTransformFrom:self.config.titleNormalColor to:self.config.titleSelectedColor progress:progress];
    }
}

@end
