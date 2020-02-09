//
//  ZHCTextField.m
//  HungryTools
//
//  Created by 张海川 on 2019/4/25.
//

#ifndef ThemeColor
#define ThemeColor [UIColor colorWithRed:255/255.f green:80/255.f blue:74/255.f alpha:1]
#endif

#import "ZHCTextField.h"
#import "Masonry.h"

#pragma mark - NSString Category

@interface NSString (HGZCheck)

@end

@implementation NSString (HGZCheck)

- (BOOL)hgz_checkWithRegexString:(NSString *)regexString {
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexString] evaluateWithObject:self];
}

@end

#pragma mark - ZHCTextField

@interface ZHCTextField() <UITextFieldDelegate>

@property (nonatomic, strong) UIView *      bottomLineView;
@property (nonatomic, strong) UIView *      secureView;
@property (nonatomic, strong) UIButton *    secureButton;

@property (nonatomic, assign) BOOL          isContainLeftOrRightView;

@end

@implementation ZHCTextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfig];
    }
    return self;
}

- (void)initConfig {
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.delegate = self;
    self.font = [UIFont systemFontOfSize:14];
    
    _isContainLeftOrRightView = NO;
    _bottomLineHeight = 0.5;
    
    [self addBottomLine];
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
    
    NSInteger comingTextLength = textField.text.length + string.length - range.length;
    
    if (_maxLength) {
        if (comingTextLength > _maxLength) {
            return NO;
        }
    }
    
    switch (_fieldType) {
        case ZHCFieldTypeDefault: {
            return YES;
            break;
        }
        case ZHCFieldTypeNumber: {
            return [string hgz_checkWithRegexString:@"[0-9]+"];
            break;
        }
        case ZHCFieldTypePhoneNumber: {
            if (self.text.length == 3 || self.text.length == 8) {
                self.text = [self.text stringByAppendingString:@" "];
            }
            return [string hgz_checkWithRegexString:@"[0-9]+"];
            break;
        }
        case ZHCFieldTypePhoneNumberWithoutSpacing: {
            return [string hgz_checkWithRegexString:@"[0-9]+"];
            break;
        }
        case ZHCFieldTypePassword: {
            // 半角字符 包括字母，数字，标点符号
            return [string hgz_checkWithRegexString:@"[\\x00-\\xff]+"];
            break;
        }
        case ZHCFieldTypeMoney: {
            return [string hgz_checkWithRegexString:@"[0-9.]+"];
            break;
        }
        case ZHCFieldTypeIDCardNumber: {
            return [string hgz_checkWithRegexString:@"[0-9Xx]+"];
            break;
        }
        case ZHCFieldTypeChinese: {
            return [string hgz_checkWithRegexString:@"[a-z\\u4e00-\\u9fa5]+"];
            break;
        }
        case ZHCFieldTypeBankCardNumber: {
            return [string hgz_checkWithRegexString:@"[0-9]+"];
            break;
        }
    }
    return NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.25 animations:^{
        if (self.bottomLineActiveColor) {
            self.bottomLineView.backgroundColor = self.bottomLineActiveColor;
        } else {
            self.bottomLineView.backgroundColor = ThemeColor;
        }
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.25 animations:^{
        if (self.bottomLinePassiveColor) {
            self.bottomLineView.backgroundColor = self.bottomLinePassiveColor;
        } else {
            self.bottomLineView.backgroundColor = [UIColor lightGrayColor];
        }
    }];
}

#pragma mark - Action

- (void)secureBtnClicked {
    self.secureTextEntry ^= 1;
    self.secureButton.selected = !self.isSecureTextEntry;
}

#pragma mark - Private Method

- (void)addBottomLine {
    
    [self addSubview:self.bottomLineView];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(self.bottomLineHeight);
    }];
}

- (void)updateBottomLineConstraints {
    
    _isContainLeftOrRightView = YES;
    
    [self.bottomLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(UIEdgeInsetsMake(0, 10, 0, 10));
        make.height.mas_equalTo(self.bottomLineHeight);
    }];
}

- (void)setPlaceholderAttribute:(id)value {
    
    NSMutableAttributedString * attriString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedPlaceholder];
    
    NSAttributedStringKey name;
    if ([value isKindOfClass:UIFont.class]) {
        name = NSFontAttributeName;
    } else if ([value isKindOfClass:UIColor.class]) {
        name = NSForegroundColorAttributeName;
    }
    [attriString addAttribute:name value:value range:NSMakeRange(0, self.placeholder.length)];
    
    self.attributedPlaceholder = attriString;
}

#pragma mark - Public Method

#pragma mark - Setter

- (void)setFieldType:(ZHCFieldType)fieldType {
    
    _fieldType = fieldType;
    
    switch (_fieldType) {
        case ZHCFieldTypeDefault: {
            
            break;
        }
        case ZHCFieldTypeNumber: {
            self.keyboardType = UIKeyboardTypeNumberPad;
            break;
        }
        case ZHCFieldTypePhoneNumber: {
            self.keyboardType = UIKeyboardTypePhonePad;
            self.maxLength = 13;
            break;
        }
        case ZHCFieldTypePhoneNumberWithoutSpacing: {
            self.keyboardType = UIKeyboardTypePhonePad;
            self.maxLength = 11;
            break;
        }
        case ZHCFieldTypePassword:{
            self.secureTextEntry = YES;
            self.rightView = self.secureView;
            self.rightViewMode = UITextFieldViewModeAlways;
            self.keyboardType = UIKeyboardTypeAlphabet;
            self.maxLength = 18;
            break;
        }
        case ZHCFieldTypeMoney: {
            self.keyboardType = UIKeyboardTypeDecimalPad;
            self.maxLength = 8;
            break;
        }
        case ZHCFieldTypeIDCardNumber: {
            self.maxLength = 18;
            break;
        }
        case ZHCFieldTypeChinese: {
            
            break;
        }
        case ZHCFieldTypeBankCardNumber: {
            self.keyboardType = UIKeyboardTypeNumberPad;
            self.maxLength = 19;
            break;
        }
    }
}

- (void)setLeftView:(UIView *)leftView {
    [super setLeftView:leftView];
    [self updateBottomLineConstraints];
}

- (void)setRightView:(UIView *)rightView {
    [super setRightView:rightView];
    [self updateBottomLineConstraints];
}

- (void)setLeftText:(NSString *)leftText {
    
    UILabel * textLabel = [UILabel new];
    textLabel.font = [UIFont systemFontOfSize:14];
    textLabel.text = leftText;
    if (_leftTextColor) {
        textLabel.textColor = _leftTextColor;
    }
    if (_leftTextFontSize > 0) {
        textLabel.font = [UIFont systemFontOfSize:_leftTextFontSize];
    }
    
    CGFloat textWidth = [textLabel.text sizeWithAttributes:@{NSFontAttributeName : textLabel.font}].width;
    UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, textWidth + 21, self.bounds.size.height)];
    
    [leftView addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setLeftImageName:(NSString *)leftImageString {
    
    UIImage * image = [UIImage imageNamed:leftImageString];
    UIImageView * subView = [[UIImageView alloc] initWithImage:image];
    
    UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, image.size.width + 20, self.bounds.size.height)];
    
    [leftView addSubview:subView];
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setLeftImage:(UIImage *)leftImage {
    
    UIImageView * subView = [[UIImageView alloc] initWithImage:leftImage];
    
    UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, leftImage.size.width + 20, self.bounds.size.height)];
    
    [leftView addSubview:subView];
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setShowBottomLine:(BOOL)isShowBottomLine {
    
    _showBottomLine = isShowBottomLine;
    self.bottomLineView.hidden = !_showBottomLine;
}

- (void)setSecureButtonImages:(NSArray<UIImage *> *)secureButtonImages {
    if (secureButtonImages.count != 2) {
        return;
    }
    if ([secureButtonImages[0] isKindOfClass:[UIImage class]]) {
        [_secureButton setImage:secureButtonImages[0] forState:UIControlStateSelected];
    }
    if ([secureButtonImages[1] isKindOfClass:[UIImage class]]) {
        [_secureButton setImage:secureButtonImages[1] forState:UIControlStateNormal];
    }
}

- (void)setBottomLinePassiveColor:(UIColor *)bottomLinePassiveColor {
    _bottomLinePassiveColor = bottomLinePassiveColor;
    self.bottomLineView.backgroundColor = _bottomLinePassiveColor;
}

- (void)setBottomLineHeight:(float)bottomLineHeight {
    
    _bottomLineHeight = bottomLineHeight;
    
    [self.bottomLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        if (self.isContainLeftOrRightView) {
            make.left.bottom.right.mas_equalTo(UIEdgeInsetsMake(0, 10, 0, 10));
        } else {
            make.left.bottom.right.mas_equalTo(0);
        }
        make.height.mas_equalTo(bottomLineHeight);
    }];
}

- (void)setClearButtonImage:(UIImage *)clearButtonImage {
    _clearButtonImage = clearButtonImage;
    
    UIButton *button =  [self valueForKey:@"_clearButton"];
    [button setImage:clearButtonImage forState:UIControlStateNormal];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    [self setPlaceholderAttribute:placeholderColor];
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont {
    _placeholderFont = placeholderFont;
    [self setPlaceholderAttribute:placeholderFont];
}

- (void)setPlaceholder:(NSString *)placeholder {
    [super setPlaceholder:placeholder];
    
    if (_placeholderColor) {
        [self setPlaceholderAttribute:_placeholderColor];
    }
    if (_placeholderFont) {
        [self setPlaceholderAttribute:_placeholderFont];
    }
}

#pragma mark - Getter

- (NSString *)phoneNumberString {
    
    NSString * string;
    
    if (self.fieldType == ZHCFieldTypePhoneNumber) {
        string = [self.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    
    return string;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [UIView new];
        _bottomLineView.backgroundColor = [UIColor colorWithRed:216/255.f green:216/255.f blue:216/255.f alpha:1];
    }
    return _bottomLineView;
}

- (UIView *)secureView {
    if (!_secureView) {
        _secureView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 64, 30)];
        
        self.secureButton.frame = CGRectMake(10, 0, 44, 30);
        [_secureView addSubview:self.secureButton];
    }
    return _secureView;
}

- (UIButton *)secureButton {
    if (!_secureButton) {
        _secureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_secureButton addTarget:self action:@selector(secureBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [_secureButton setImage:[UIImage imageNamed:@"Resource.bundle/eye_close"] forState:UIControlStateNormal];
        [_secureButton setImage:[UIImage imageNamed:@"Resource.bundle/eye_open"] forState:UIControlStateSelected];
        //        _secureButton.selected = YES;
    }
    return _secureButton;
}

@end
