////
////  UIButton+Counting.m
////  AINI_Library
////
////  Created by cy on 2019/11/1.
////
//
//#import "UIButton+Counting.h"
//#import "UIImage+Color.h"
//#import <objc/runtime.h>
//
//@interface UIButton()
//
//@property (nonatomic, strong) NSTimer * timer;
//@property (nonatomic, assign) int       nowSeconds;
//
//@end
//
//@implementation UIButton (Counting)
//
//- (void)dealloc {
//    [self.timer invalidate];
//}
//
//#pragma mark - Setter
//
//- (void)setCountingStatus:(CountingButtonStatus)countingStatus {
//    objc_setAssociatedObject(self, "countingStatus", @(countingStatus), OBJC_ASSOCIATION_ASSIGN);
//}
//
//- (void)setTimer:(NSTimer *)timer {
//    objc_setAssociatedObject(self, "timer", timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (void)setNowSeconds:(int)nowSeconds {
//    objc_setAssociatedObject(self, "nowSeconds", @(nowSeconds), OBJC_ASSOCIATION_ASSIGN);
//}
//
//#pragma mark - Getter
//
//- (CountingButtonStatus)countingStatus {
//    return [objc_getAssociatedObject(self, "countingStatus") integerValue];
//}
//
//- (NSTimer *)timer {
//    return objc_getAssociatedObject(self, "timer");
//}
//
//- (int)nowSeconds {
//    return [objc_getAssociatedObject(self, "nowSeconds") intValue];
//}
//
//#pragma mark -
//
//+ (instancetype)buttonWithNormalTitle:(NSString *)normalTitle
//                        countingTitle:(NSString *)countingTitle
//                       recoveredTitle:(NSString *)recoveredTitle
//                      normalTitleColor:(UIColor *)normalTitleColor
//                    countingTitleColor:(UIColor *)countingTitleColor
//                normalBackgroundColor:(UIColor *)normalBackgroundColor
//              countingBackgroundColor:(UIColor *)countingBackgroundColor
//                             fontSize:(float)fontSize
//                      countingSeconds:(int)countingSeconds {
//    
//    UIButton * button = [self buttonWithType:UIButtonTypeCustom];
//    button.titleLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:fontSize];
//
//    [button setTitle:normalTitle forState:UIControlStateNormal];
//    
//    [button setTitleColor:normalTitleColor forState:UIControlStateNormal];
//    [button setTitleColor:countingTitleColor forState:UIControlStateDisabled];
//    
//    [button setBackgroundImage:[UIImage imageWithColor:normalBackgroundColor] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageWithColor:countingBackgroundColor] forState:UIControlStateDisabled];
//        
//    button.countingStatus = CountingButtonStatusNormal;
//    objc_setAssociatedObject(button, "countingTitle", countingTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
//    objc_setAssociatedObject(button, "recoveredTitle", recoveredTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
//    objc_setAssociatedObject(button, "countingSeconds", @(countingSeconds), OBJC_ASSOCIATION_ASSIGN);
//    button.nowSeconds = countingSeconds;
//    
//    button.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:button selector:@selector(countingEvent) userInfo:nil repeats:YES];
//    [button.timer setFireDate:[NSDate distantFuture]];
//    
//    return button;
//}
//
//- (void)startCounting {
//    [self.timer setFireDate:[NSDate date]];
//    
//    self.countingStatus = CountingButtonStatusCounting;
//    self.enabled = NO;
//}
//
//- (void)countingEvent {
//    
//    if (--self.nowSeconds == 0) {
//        // 计时结束，重置时间
//        self.nowSeconds = [objc_getAssociatedObject(self, "countingSeconds") intValue];
//        [self.timer setFireDate:[NSDate distantFuture]];
//
//        self.enabled = YES;
//        [self setTitle:objc_getAssociatedObject(self, "recoveredTitle") forState:UIControlStateNormal];
//        
//        return;
//    }
//    
//    NSString * countingTitle = objc_getAssociatedObject(self, "countingTitle");
//    countingTitle = [NSString stringWithFormat:countingTitle, self.nowSeconds];
//    [self setTitle:countingTitle forState:UIControlStateDisabled];
//}
//
//@end
