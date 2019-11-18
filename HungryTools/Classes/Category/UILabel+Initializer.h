//
//  UILabel+Initializer.h
//  HungryTools
//
//  Created by 张海川 on 2019/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Initializer)

+ (instancetype)labelWithFontSize:(float)size textColor:(nullable UIColor *)color text:(nullable NSString *)text;
+ (instancetype)labelWithFontSize:(float)size textColor:(nullable UIColor *)color;
+ (instancetype)labelWithFontSize:(float)size text:(nullable NSString *)text;
+ (instancetype)labelWithFontSize:(float)size;

/// 等宽数字字体
+ (instancetype)labelWithMonospacedFontSize:(float)size;

@end

NS_ASSUME_NONNULL_END
