////
////  ZHCNavigationController.h
////  HungryTools
////
////  Created by 张海川 on 2020/8/31.
////
//
//#import <UIKit/UIKit.h>
//
//NS_ASSUME_NONNULL_BEGIN
//
//typedef void(^NaviBarConfigBlock)(UINavigationBar *naviBar);
//
//@protocol ZHCNavigationControllerDelegate <NSObject>
//
//@required
///// 定制返回按钮内容，可以是NSString（图片名），UIImage，UIButton，UIView
//- (id)zhc_navigationControllerBackItemContent;
//
//@optional
///// 能否返回，同时对点击和手势生效
//- (BOOL)zhc_navigationControllerCanPopBack;
///// 能否通过点击返回，优先级大于 zhc_navigationControllerCanPopBack
//- (BOOL)zhc_navigationControllerCanPopBackByClick;
///// 能否通过手势返回，优先级大于 zhc_navigationControllerCanPopBack
//- (BOOL)zhc_navigationControllerCanPopBackByGesture;
//
///// 返回按钮的颜色，仅当 zhc_navigationControllerBackItemContent 为NSString，UIImage时生效
//- (UIColor *)zhc_navigationControllerBackItemTintColor;
//
//- (NaviBarConfigBlock)zhc_navigationControllerAppearenceConfig;
//
//@end
//
//
//@interface ZHCNavigationController : UINavigationController
//
//@end
//
//NS_ASSUME_NONNULL_END
