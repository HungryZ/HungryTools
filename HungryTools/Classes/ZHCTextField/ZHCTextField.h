//
//  ZHCTextField.h
//  FCHCL
//
//  Created by 张海川 on 2019/4/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ZHCFieldTypeDefault,
    ZHCFieldTypePhoneNumber,
    ZHCFieldTypePassword,
    ZHCFieldTypeMoney,
} ZHCFieldType;

@interface ZHCTextField : UITextField

@property (nonatomic, assign) ZHCFieldType  fieldType;

@property (nonatomic, copy) NSString *      leftText;
@property (nonatomic, copy) NSString *      leftImageString;

@property (nonatomic, assign) BOOL          isShowBottomLine;
@property (nonatomic, strong) UIColor *     bottomLineColor;

@end

NS_ASSUME_NONNULL_END
