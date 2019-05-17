//
//  ZHCTextField.m
//  FCHCL
//
//  Created by 张海川 on 2019/4/25.
//

#import "ZHCTextField.h"
#import "Masonry.h"
#import "UtilsMacro.h"
#import "UILabel+Initializer.h"
#import "UIButton+Initializer.h"

@interface ZHCTextField() <UITextFieldDelegate>

@property (nonatomic, strong) UIView *      bottomLineView;
@property (nonatomic, strong) UIButton *    secureButton;

@end

@implementation ZHCTextField

- (instancetype)init {
    self = [super init];
    if (self) {
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.delegate = self;
        _bottomLineColor = [UIColor orangeColor];
        [self addBottomLine];
    }
    return self;
}
// 无效
//- (CGRect)clearButtonRectForBounds:(CGRect)bounds {
//    //        bounds.origin.x -= ViewWidth(self.rightView);
//    CGRect frame = [super clearButtonRectForBounds:bounds];
//    if (self.rightView) {
//        frame.origin.x -= ViewWidth(self.rightView) + 10;
//    }
//    return frame;
//}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // 删除
    if ([string isEqualToString:@""]) {
        return YES;
    }
    
    switch (_fieldType) {
        case ZHCFieldTypeDefault: {
            return YES;
            break;
        }
        case ZHCFieldTypePhoneNumber: {
            if (textField.text.length >= 11) {
                return NO;
            }
            return [@"0123456789" containsString:string];
            break;
        }
        case ZHCFieldTypePassword: {
            return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[A-Za-z0-9_]"] evaluateWithObject:string];
            break;
        }
        case ZHCFieldTypeMoney: {
            return [@"0123456789." containsString:string];
            break;
        }
    }
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.bottomLineView.backgroundColor = _bottomLineColor;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.bottomLineView.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark - Action

- (void)secureBtnClicked {
    self.secureTextEntry ^= 1;
    self.secureButton.selected = self.isSecureTextEntry;
}

#pragma mark - Private Method

- (void)addBottomLine {
    
    [self addSubview:self.bottomLineView];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}

#pragma mark - Public Method

#pragma mark - Setter

- (void)setFieldType:(ZHCFieldType)fieldType {
    
    _fieldType = fieldType;
    
    if (_fieldType == ZHCFieldTypePassword) {
        self.secureTextEntry = YES;
        self.rightView = self.secureButton;
        self.rightViewMode = UITextFieldViewModeAlways;
    }
}

- (void)setLeftText:(NSString *)leftText {
    
    UIView * leftView = [UIView new];
    UILabel * subView = [UILabel labelWithFontSize:14.f text:leftText];
    [leftView addSubview:subView];
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    // 给leftView一个宽度
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(subView).offset(20);
    }];
    
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setLeftImageString:(NSString *)leftImageString {
    
    UIView * leftView = [UIView new];
    UIImageView * subView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:leftImageString]];
    [leftView addSubview:subView];
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    // 给leftView一个宽度
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(subView).offset(20);
    }];
    
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setIsShowBottomLine:(BOOL)isShowBottomLine {
    
    _isShowBottomLine = isShowBottomLine;
    self.bottomLineView.hidden = !_isShowBottomLine;
}

#pragma mark - Getter

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [UIView new];
        _bottomLineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _bottomLineView;
}

- (UIButton *)secureButton {
    if (!_secureButton) {
        _secureButton = [UIButton buttonWithImageName:@"eye_close" target:self action:@selector(secureBtnClicked)];
        [_secureButton setImage:[UIImage imageNamed:@"eye_open"] forState:UIControlStateSelected];
        _secureButton.frame = CGRectMake(0, 0, 23, 20);
        _secureButton.selected = YES;
    }
    return _secureButton;
}

@end
