//
//  ZHCButton.h
//  HungryTools
//
//  Created by 张海川 on 2020/7/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZHCButtonAlignment) {
    ZHCButtonAlignmentHorizontal,
    ZHCButtonAlignmentVertical
};

@interface ZHCButton : UIButton

/// 布局方向，默认水平
@property (nonatomic, assign) ZHCButtonAlignment    zhc_alignment;
/// 图片与标题之间的间隔，默认0
@property (nonatomic, assign) CGFloat               zhc_spacing;
/// 内边距
@property (nonatomic, assign) UIEdgeInsets          zhc_padding;

+ (instancetype)buttonwithAlignment:(ZHCButtonAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
