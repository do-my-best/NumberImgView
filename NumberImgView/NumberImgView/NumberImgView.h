//
//  NumberImgView.h
//  NumberImgView
//
//  Created by liuzhu on 2019/1/29.
//  Copyright © 2019 liuzhu. All rights reserved.
//


/**
 todo:
    1. 传入字典将图片和对应的数字或小数点等符号数据匹配起来
    2. 增加间距
 */

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NumberAlignment) {
    NumberAlignmentLeft      = 0,
    NumberAlignmentCenter    = 1,
    NumberAlignmentRight     = 2,
};

NS_ASSUME_NONNULL_BEGIN

/// 需要传入的参数: 1. 照片的路径名称  2. 照片的高度
@interface NumberImgView : UIView

@property (nonatomic,strong) UIView *rootView;
@property (nonatomic, assign) NumberAlignment numberAlignment;
@property (nonatomic, copy) NSString *numberString;


/**
 图片数字视图

 @param imgArray 图片数组
 @param numberAlignment 数字排列方式: 居左/居中/居右
 @return 数字图片视图
 */
+ (instancetype)numberImgViewWithArray:(NSArray<UIImage *>*)imgArray numberAlignment:(NumberAlignment)numberAlignment;

- (CGSize)getImageSize;

@end

NS_ASSUME_NONNULL_END
