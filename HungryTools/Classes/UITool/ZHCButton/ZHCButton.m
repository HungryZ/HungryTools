//
//  ZHCButton.m
//  HungryTools
//
//  Created by 张海川 on 2020/7/23.
//

#import "ZHCButton.h"

@interface ZHCButton()

@property (nonatomic, assign) CGRect newImageRect;
@property (nonatomic, assign) CGRect newTitleRect;

@end

@implementation ZHCButton

+ (instancetype)buttonwithAlignment:(ZHCButtonAlignment)alignment {
    ZHCButton *button = [self buttonWithType:UIButtonTypeCustom];
    button.zhc_alignment = alignment;
    
    return button;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self config];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

- (void)config {
    _zhc_spacing = 0;
    _zhc_horizontalPadding = 10;
    _zhc_verticalPadding = 10;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - overwrite

- (CGSize)sizeThatFits:(CGSize)size {
    return [self zhc_contentSize];
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    [self calculateImageRectAndTitleRectForContentRect:contentRect];
    return _newTitleRect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return _newImageRect;
}

- (CGSize)intrinsicContentSize {
    return [self zhc_contentSize];
}

#pragma mark - Helper

- (void)calculateImageRectAndTitleRectForContentRect:(CGRect)contentRect {
    if (CGRectIsEmpty(contentRect)) {
        return;
    }
    if (!CGRectIsEmpty(_newImageRect) || !CGRectIsEmpty(_newImageRect)) {
        return;
    }
    
    CGSize imageSize = [self imageSize];
    CGSize titleSize = [self titleSize];
    if (_zhc_alignment == ZHCButtonAlignmentHorizontal) {
        _newImageRect = [super imageRectForContentRect:contentRect];
        _newTitleRect = [super titleRectForContentRect:contentRect];
        _newImageRect.origin.x -= _zhc_spacing / 2;
        _newTitleRect.origin.x += _zhc_spacing / 2;
    } else {
        CGFloat imageHeight = imageSize.height;
        CGFloat titleHeight = titleSize.height;
        CGFloat imageAndTitleHeight = imageHeight + _zhc_spacing + titleHeight;
        
        CGFloat imageX = CGRectGetMidX(contentRect) - imageSize.width / 2;
        CGFloat imageY = CGRectGetMidY(contentRect) - imageAndTitleHeight / 2;
        _newImageRect = CGRectMake(imageX, imageY, imageSize.width, imageSize.height);
        
        CGFloat titleBottom = CGRectGetMidY(contentRect) + imageAndTitleHeight / 2;
        CGFloat titleX = 0;
        CGFloat titleY = titleBottom - titleSize.height;
        _newTitleRect = CGRectMake(titleX, titleY, CGRectGetWidth(contentRect), titleSize.height);
    }
}

- (CGSize)zhc_contentSize {
    CGSize imageSize = [self imageSize];
    CGSize titleSize = [self titleSize];
    
    CGFloat width, height;
    if (_zhc_alignment == ZHCButtonAlignmentHorizontal) {
        // 水平布局
        width = imageSize.width + _zhc_spacing + titleSize.width;
        height = MAX(imageSize.height, titleSize.height);
    } else {
        // 垂直布局
        width = MAX(imageSize.width, titleSize.width);
        height = imageSize.height + _zhc_spacing + titleSize.height;
    }
    // 加上边距
    width += 2 * _zhc_horizontalPadding;
    height += 2 * _zhc_verticalPadding;
    
    return CGSizeMake(ceil(width), ceil(height));
}

- (CGSize)imageSize {
    UIImage *image = [self imageForState:self.state];
    return image ? image.size : CGSizeZero;
}

- (CGSize)titleSize {
    NSString *title = [self titleForState:self.state];
    return title ? [self widthForString:title inFont:self.titleLabel.font] : CGSizeZero;
}

- (CGSize)widthForString:(NSString *)string inFont:(UIFont *)font {
    
    return [string boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                options:NSStringDrawingUsesLineFragmentOrigin
                             attributes:@{NSFontAttributeName : font}
                                context:nil].size;
}

@end
