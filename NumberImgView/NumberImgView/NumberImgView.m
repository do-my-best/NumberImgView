//
//  NumberImgView.m
//  NumberImgView
//
//  Created by yu on 2019/1/29.
//  Copyright © 2019 liuzhu. All rights reserved.
//

#import "NumberImgView.h"
#import "NSArray+PTVSafe.h"
#import "Masonry.h"


static const CGFloat MaximumLength = 3;

@interface NumberImgView ()

/**
 数字视图数组
 */
@property (nonatomic, strong) NSMutableArray *numImgViewLists;


/**
 图片数组
 */
@property (nonatomic, strong) NSArray<UIImage *>*imgArray;

@end


@implementation NumberImgView

+ (instancetype)numberImgViewWithArray:(NSArray<UIImage *>*)imgArray numberAlignment:(NumberAlignment)numberAlignment{
    NumberImgView *numberImgView = [NumberImgView new];
    numberImgView.imgArray = imgArray;
    numberImgView.numberAlignment = numberAlignment;
    [numberImgView setupControl];
    return numberImgView;
}


- (void)setupControl{
    [self _initializeViews];
    [self _makeConstraints];
    [self _initializeBaseConfig];
}

- (void)_initializeBaseConfig{
    for (int i = 0; i < MaximumLength; i++) {
        [self addNewNumImageView];
    }
}

- (void)addNewNumImageView{
    UIImageView *numImageView = [[UIImageView alloc] init];
    numImageView.contentMode = UIViewContentModeScaleAspectFit;
    numImageView.hidden = YES;
    [self.rootView addSubview:numImageView];
    [self.numImgViewLists addObject:numImageView];
}

- (void)_initializeViews {
    [self addSubview:self.rootView];
}

- (void)_makeConstraints {
}
- (void)_updateRootViewConstraints {
    [self.rootView mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.centerY.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake([self getImageSize].width * self.numberString.length, [self getImageSize].height));
        if (self.numberAlignment == NumberAlignmentLeft) {
            make.left.mas_equalTo(self);
        } else if (self.numberAlignment == NumberAlignmentRight){
            make.right.mas_equalTo(self);
        } else if (self.numberAlignment == NumberAlignmentCenter){
            make.centerX.mas_equalTo(self);
        }
    }];
}

#pragma mark - private method

- (CGSize)getImageSize {
    CGSize size = CGSizeMake(7, 12);
    for (UIImage *img in self.imgArray) {
        if (img) {
            size = img.size;
            break;
        }
    }
    return size;
}

#pragma mark - setter

- (void)setNumberString:(NSString *)numberString {
    if (![numberString isKindOfClass:[NSString class]]) {
        return;
    }
    _numberString = numberString;
    
    [self _updateRootViewConstraints];
    [self addNewImgViewIfNeeded];
    [self showEachImgView];
}

- (void)addNewImgViewIfNeeded{
    while (_numberString.length > _numImgViewLists.count) {
        [self addNewNumImageView];
    }
}

- (void)showEachImgView{
    // 遍历所有的数字图片, 确定每个数字图片的显示和隐藏.
    for (int i = 0; i < self.numImgViewLists.count; i++) {
        UIImageView *imageView = self.numImgViewLists[i];
        if (i < _numberString.length) {
            imageView.hidden = NO;
            NSRange range = NSMakeRange(i, 1);
            NSString *numberStr = [_numberString substringWithRange:range];
            UIImage *img = [self.imgArray objectAtIndex:numberStr.integerValue];
            if (img) {
                imageView.image = img;
            }
            CGFloat beginOriginLeft = [self getBeginOriginLeft:_numberString];
            CGFloat imageLeft = beginOriginLeft + (i * [self getImageSize].width);
            [imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(imageLeft);
                make.centerY.mas_equalTo(self);
                make.size.mas_equalTo([self getImageSize]);
            }];
        }
        else {
            imageView.hidden = YES;
        }
    }
}

- (CGFloat)getBeginOriginLeft:(NSString *)str {
    CGFloat textWidth = [self getImageSize].width * str.length;
    CGFloat allWidth = [self getImageSize].width * MaximumLength;
    if (_numberAlignment == NumberAlignmentCenter) {
        CGFloat leftMargin = (allWidth - textWidth)/2;
        return leftMargin;
    }
    else if (_numberAlignment == NumberAlignmentRight) {
        CGFloat leftMargin = (allWidth - textWidth);
        return leftMargin;
    }
    else {
        return 0;
    }
}

#pragma mark - getter

- (NSMutableArray *)numImgViewLists {
    if (_numImgViewLists == nil) {
        _numImgViewLists = [[NSMutableArray alloc] init];
    }
    return _numImgViewLists;
}

- (UIView *)rootView{
    if (_rootView == nil) {
        _rootView = [[UIView alloc] init];
    }
    return _rootView;
}
@end
