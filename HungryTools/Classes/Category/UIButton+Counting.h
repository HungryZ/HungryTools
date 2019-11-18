////
////  UIButton+Counting.h
////  AINI_Library
////
////  Created by cy on 2019/11/1.
////
//
//#import <UIKit/UIKit.h>
//
//NS_ASSUME_NONNULL_BEGIN
//
//typedef NS_ENUM(NSUInteger, CountingButtonStatus) {
//    CountingButtonStatusNormal,         // 未触发倒计时状态
//    CountingButtonStatusCounting,       // 正在倒计时
//    CountingButtonStatusRecovered       // 倒计时结束
//};
//
//@interface UIButton (Counting)
//
//@property (nonatomic, assign) CountingButtonStatus      countingStatus;
//
///// 创建倒计时按钮，没有做防重置处理
///// @param normalTitle 未触发倒计时的标题
///// @param countingTitle 正在倒计时的标题，例如："%d秒后重新获取"
///// @param recoveredTitle 倒计时结束的标题，例如："重新获取"
///// @param countingSeconds 倒计时时间，单位秒
//+ (instancetype)buttonWithNormalTitle:(NSString *)normalTitle
//                        countingTitle:(NSString *)countingTitle
//                       recoveredTitle:(NSString *)recoveredTitle
//                     normalTitleColor:(UIColor *)normalTitleColor
//                   countingTitleColor:(UIColor *)countingTitleColor
//                normalBackgroundColor:(UIColor *)normalBackgroundColor
//              countingBackgroundColor:(UIColor *)countingBackgroundColor
//                             fontSize:(float)fontSize
//                      countingSeconds:(int)countingSeconds;
//
//- (void)startCounting;
//
//@end
//
//NS_ASSUME_NONNULL_END
