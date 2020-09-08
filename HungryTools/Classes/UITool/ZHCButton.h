//
//  ZHCButton.h
//  HungryTools
//
//  Created by 张海川 on 2020/5/12.
//  实现图片和文字上下布局，左右布局可选，内边距

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZHCButtonAlignment) {
    ZHCButtonAlignmentHorizontal = 0,
    ZHCButtonAlignmentHorizontalReversal,    // 文字在左，图片在右
    ZHCButtonAlignmentVertical,
    ZHCButtonAlignmentVerticalReversal,      // 文字在上，图片在下
};

@interface ZHCButton : UIButton

/// 布局方向，默认 ZHCButtonAlignmentHorizontal
@property (nonatomic, assign) ZHCButtonAlignment    zhc_alignment;
/// 图片与标题之间的间隔，默认10
@property (nonatomic, assign) CGFloat               zhc_spacing;
/// 内边距
@property (nonatomic, assign) UIEdgeInsets          zhc_padding;

+ (instancetype)buttonwithAlignment:(ZHCButtonAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
