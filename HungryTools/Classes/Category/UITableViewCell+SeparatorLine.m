//
//  UITableViewCell+SeparatorLine.m
//  StrategyPlus
//
//  Created by 张海川 on 2019/5/29.
//  Copyright © 2019 张海川. All rights reserved.
//

#import "UITableViewCell+SeparatorLine.h"
#import <objc/runtime.h>

@implementation UITableViewCell (SeparatorLine)

- (BOOL)showSeparatorLine {
    return [objc_getAssociatedObject(self, "showSeparatorLine") boolValue];
}

- (void)setShowSeparatorLine:(BOOL)showSeparatorLine {
    
    objc_setAssociatedObject(self, "showSeparatorLine", @(showSeparatorLine), OBJC_ASSOCIATION_ASSIGN );
    
    if (showSeparatorLine) {
        if (![self viewWithTag:10086]) {
            UIView * separatorLine = [UIView viewWithBackgroundColor:HexColor(0xE6E6E6)];
            separatorLine.tag = 10086;
            [self addSubview:separatorLine];
            [separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.mas_equalTo(0);
                make.height.mas_equalTo(0.5);
            }];
        }
    } else {
        if ([self viewWithTag:10086]) {
            [[self viewWithTag:10086] removeFromSuperview];
        }
    }
}

@end
