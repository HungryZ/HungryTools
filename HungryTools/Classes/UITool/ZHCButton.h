//
//  ZHCButton.h
//  HungryTools
//
//  Created by 张海川 on 2021/1/11.
//  为图片和标题之间添加间隔，实现图片和文字上下布局，左右布局可选
//  仅在 AutoLayout 下使用，使用 Frame 布局会发生错乱

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
/// 图片与标题之间的间隔，默认0
@property (nonatomic, assign) CGFloat               zhc_spacing;
/// 内边距，如果约束了按钮的大小，这个属性会失效
@property (nonatomic, assign) UIEdgeInsets          zhc_padding;

+ (instancetype)buttonwithAlignment:(ZHCButtonAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
