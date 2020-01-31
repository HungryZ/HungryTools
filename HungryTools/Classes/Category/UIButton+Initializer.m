//
//  UIButton+Initializer.m
//  HungryTools
//
//  Created by 张海川 on 2019/1/14.
//

#ifndef ThemeColor
    #define ThemeColor [UIColor colorWithRed:255/255.f green:80/255.f blue:74/255.f alpha:1]
#endif

#ifndef DisableColor
    #define DisableColor [UIColor colorWithRed:255/255.f green:173/255.f blue:173/255.f alpha:1]
#endif

#import "UIButton+Initializer.h"
#import "UIImage+Color.h"

@implementation UIButton (Initializer)

+ (instancetype)buttonWithThemeTitle:(NSString *)title target:(id)target action:(SEL)action {
    
    UIButton * button = [self buttonWithTitle:title titleColor:[UIColor whiteColor] fontSize:16.f cornerRadius:4.f backgroundColor:nil target:target action:action];
    
    [button setBackgroundImage:[UIImage imageWithColor:DisableColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:ThemeColor] forState:UIControlStateSelected];
    button.clipsToBounds = YES;
    
    return button;
}

+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(float)fontSize cornerRadius:(float)cornerRadius {
    
    return [self buttonWithTitle:title titleColor:titleColor fontSize:fontSize cornerRadius:cornerRadius backgroundColor:nil target:nil action:nil];
}

+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(float)fontSize target:(id)target action:(SEL)action {
    
    return [self buttonWithTitle:title titleColor:titleColor fontSize:fontSize cornerRadius:0 backgroundColor:nil target:target action:action];
}

+ (instancetype)buttonWithImageName:(NSString *)imageName target:(id)target action:(SEL)action {
    
    UIButton * button = [self new];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}

+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(float)fontSize cornerRadius:(float)cornerRadius backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)action {
    
    UIButton * button = [self buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setAdjustsImageWhenHighlighted:NO];
    [button setAdjustsImageWhenDisabled:NO];
    
    if (cornerRadius) {
        button.layer.cornerRadius = cornerRadius;
    }
    
    if (backgroundColor) {
        button.backgroundColor = backgroundColor;
    }
    
    if (target && action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    return button;
}

/// 在设置selected状态下点击时会先变成normal状态下的颜色，松开时再变化为selected状态下的颜色。
/// 此时重写Highlighted的set方法即可（空方法，什么都不需要写）
- (void)setHighlighted:(BOOL)highlighted {
    
}

@end
