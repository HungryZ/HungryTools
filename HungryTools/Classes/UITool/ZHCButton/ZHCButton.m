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
}

- (void)sizeToFit {
    [super sizeToFit];

    CGRect bounds = self.bounds;
    bounds.size = [self intrinsicContentSize];
    self.bounds = bounds;

    CGFloat offset = 0;
    CGSize imageSize = self.currentImage.size;
    if ((self.currentTitle.length > 0 || self.currentAttributedTitle.length > 0) &&
        (imageSize.width > 0 && imageSize.height > 0)) {
        offset = _zhc_spacing * 0.5;
    }

    CGPoint center = self.center;
    center.x += offset;
    self.center = center;
}

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    if (_zhc_alignment == ZHCButtonAlignmentHorizontal) {
        size.width += _zhc_spacing;
    } else {
        size.height += _zhc_spacing;
    }

    return size;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return _newImageRect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    [self calculateImageRectAndTitleRectForContentRect:contentRect];
    return _newTitleRect;
}

- (void)calculateImageRectAndTitleRectForContentRect:(CGRect)contentRect {
    if (self.zhc_alignment == ZHCButtonAlignmentHorizontal && _zhc_spacing == 0) {
        // 普通状态
        _newTitleRect = [super titleRectForContentRect:contentRect];
        _newImageRect = [super imageRectForContentRect:contentRect];
        return;
    }
    if (CGRectIsEmpty(contentRect)) {
        return;
    }
    if (!CGRectIsEmpty(_newImageRect) || !CGRectIsEmpty(_newImageRect)) {
        return;
    }

    CGRect imageRect = [super imageRectForContentRect:contentRect];
    CGRect titleRect = [super titleRectForContentRect:contentRect];
    if (self.zhc_alignment == ZHCButtonAlignmentVertical) {
        CGFloat imageHeight = CGRectGetHeight(imageRect);
        CGFloat titleHeight = CGRectGetHeight(titleRect);
        CGFloat imageAndTitleHeight = imageHeight + _zhc_spacing + titleHeight;
        
        CGFloat imageX = CGRectGetMidX(contentRect) - CGRectGetWidth(imageRect) / 2;
        CGFloat imageY = CGRectGetMidY(contentRect) - imageAndTitleHeight / 2;
        _newImageRect = CGRectMake(imageX, imageY, CGRectGetWidth(imageRect), CGRectGetHeight(imageRect));
        
        CGFloat titleBottom = CGRectGetMidY(contentRect) + imageAndTitleHeight / 2;
        CGFloat titleX = 0;
        CGFloat titleY = titleBottom - CGRectGetHeight(titleRect);
        _newTitleRect = CGRectMake(titleX, titleY, CGRectGetWidth(contentRect), CGRectGetHeight(titleRect));
    } else {
        imageRect.origin.x -= _zhc_spacing / 2;
        _newImageRect = imageRect;
        titleRect.origin.x += _zhc_spacing / 2;
        _newTitleRect = titleRect;
    }
}

#pragma mark - Setter

- (void)setZhc_alignment:(ZHCButtonAlignment)alignment {
    _zhc_alignment = alignment;
    
    if (_zhc_alignment == ZHCButtonAlignmentVertical) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
}

@end
