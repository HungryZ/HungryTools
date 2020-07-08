//
//  UITableViewCell+SeparatorLine.m
//  HungryTools
//
//  Created by 张海川 on 2019/5/29.
//  Copyright © 2019 张海川. All rights reserved.
//

#ifndef SeparatorLineColor
    #define SeparatorLineColor  [UIColor colorWithRed:230/255.f green:230/255.f blue:230/255.f alpha:1.f]
#endif

#import "UITableViewCell+SeparatorLine.h"
#import <objc/runtime.h>
#import "Masonry.h"

@implementation UITableViewCell (SeparatorLine)

- (BOOL)zhc_showTopSeparatorLine {
    return [objc_getAssociatedObject(self, "zhc_showTopSeparatorLine") boolValue];
}

- (void)setZhc_showTopSeparatorLine:(BOOL)zhc_showTopSeparatorLine {
    
    objc_setAssociatedObject(self, "zhc_showTopSeparatorLine", @(zhc_showTopSeparatorLine), OBJC_ASSOCIATION_ASSIGN);
    
    if (zhc_showTopSeparatorLine) {
        if (![self viewWithTag:10086]) {
            UIView * separatorLine = [UIView new];
            separatorLine.backgroundColor = SeparatorLineColor;
            separatorLine.tag = 10086;
            [self addSubview:separatorLine];
            
            [separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.mas_equalTo(self.zhc_separatorLineInset);
                make.height.mas_equalTo(self.zhc_separatorLineHeight);
            }];
        }
    } else {
        if ([self viewWithTag:10086]) {
            [[self viewWithTag:10086] removeFromSuperview];
        }
    }
}

- (UIEdgeInsets)zhc_separatorLineInset {
    NSValue *value = objc_getAssociatedObject(self, "zhc_separatorLineInset");
    return [value UIEdgeInsetsValue];
}

- (void)setZhc_separatorLineInset:(UIEdgeInsets)zhc_separatorLineInset {
    NSValue *value = [NSValue valueWithUIEdgeInsets:zhc_separatorLineInset];
    objc_setAssociatedObject(self, "zhc_separatorLineInset", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)zhc_separatorLineHeight {
    return [objc_getAssociatedObject(self, "zhc_separatorLineHeight") floatValue] ?: 0.5;
}

- (void)setZhc_separatorLineHeight:(CGFloat)zhc_separatorLineHeight {
    objc_setAssociatedObject(self, "zhc_separatorLineHeight", @(zhc_separatorLineHeight), OBJC_ASSOCIATION_ASSIGN);
}

@end
