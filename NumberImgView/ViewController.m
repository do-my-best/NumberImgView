//
//  ViewController.m
//  NumberImgView
//
//  Created by 刘著 on 2019/2/22.
//  Copyright © 2019年 liuzhu. All rights reserved.
//

#import "ViewController.h"

#import "Masonry.h"
#import "NumberImgView.h"

@interface ViewController ()

@property (nonatomic,strong) NumberImgView *numberImgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupControl];
    self.numberImgView.numberString = @"23";
}


- (void)setupControl{
    [self _initializeViews];
    [self _makeConstraints];
    [self _initializeBaseConfig];
}

- (void)_initializeBaseConfig{
}

- (void)_initializeViews {
    [self.view addSubview:self.numberImgView];
}

- (void)_makeConstraints {
    [self.numberImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 200));
    }];
}

- (NumberImgView *)numberImgView {
    if (!_numberImgView) {
        NSArray *array = [self getImgArray];
        _numberImgView = [NumberImgView numberImgViewWithArray:array numberAlignment:2];
        _numberImgView.backgroundColor = [UIColor redColor];
    }
    return _numberImgView;
}

- (NSArray<UIImage *>*)getImgArray{
    
    NSString *basePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"BaseSkin.bundle"];
    basePath = [basePath stringByAppendingPathComponent:@"numbers"];
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:1];
    for (NSInteger index = 0; index < 10; index++) {
        NSString *imgName = [NSString stringWithFormat:@"xx_pk_combo_gift_number_left_%li",(long)index];
        imgName = [basePath stringByAppendingPathComponent:imgName];
        UIImage *img = [UIImage imageWithContentsOfFile:imgName];
        if (img) {
            [arrayM addObject:img];
        }
    }
    return [arrayM copy];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSInteger num = arc4random()%10000;
    self.numberImgView.numberString =[NSString stringWithFormat:@"%li",num];
    [self addComboAnimation];
}

- (void)addComboAnimation
{
    if (CGAffineTransformIsIdentity(self.numberImgView.transform) ) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self animateGiftNumImg];
        });
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self animateGiftNumImg];
        });
    }
}


/**
 礼物数字图片先放大然后回归正常
 */
- (void)animateGiftNumImg {
    UIView *comboView = self.numberImgView.rootView;
    comboView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:0.1 animations:^{
        comboView.transform = CGAffineTransformMakeScale(5, 5);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            comboView.transform = CGAffineTransformIdentity;
        }];
    }];
}

@end
