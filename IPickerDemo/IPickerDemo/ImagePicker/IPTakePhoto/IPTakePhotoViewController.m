//
//  IPTakePhotoViewController.m
//  IPickerDemo
//
//  Created by Wangjianlong on 16/7/3.
//  Copyright © 2016年 JL. All rights reserved.
//

#import "IPTakePhotoViewController.h"
#import "IPMediaCenter.h"
#import "IPPrivateDefine.h"

@interface IPTakePhotoViewController ()
/**头部标题*/
@property (nonatomic, weak)UIView *headerBGView;
/**底部标题*/
@property (nonatomic, weak)UIView *bottomBGView;
/**返回btn*/
@property (nonatomic, weak)UIButton *leftButton;

@property (nonatomic, weak)UIButton *takePhotoBtn;

@end

@implementation IPTakePhotoViewController
- (void)dealloc{
    IPLog(@"IPTakePhotoViewController dealloc");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addMainView];
    [self addHeaderView];
    [self addBottomView];
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (void)addMainView{
//    AVCaptureVideoPreviewLayer *previewLayer = [IPMediaCenter defaultCenter].previewLayer;
//    if (previewLayer.superlayer) {
//        [previewLayer removeFromSuperlayer];
//    }
//    previewLayer.frame = self.view.bounds;
//    [self.view.layer addSublayer:previewLayer];
}
- (void)addBottomView{
    
    UIView *bottomBGView = [[UIView alloc]init];
    bottomBGView.backgroundColor = [UIColor colorWithRed:0 green:0  blue:0 alpha:0.5];
    [self.view addSubview:bottomBGView];
    self.bottomBGView = bottomBGView;
    
    
    UIButton *takePhotoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image =[UIImage imageNamed:@"icon_fabu_take_photo"];
    [takePhotoBtn setImage:image forState:UIControlStateNormal];
    [takePhotoBtn addTarget:self action:@selector(takePhoto:) forControlEvents:UIControlEventTouchUpInside];
    [bottomBGView addSubview:takePhotoBtn];
    self.takePhotoBtn = takePhotoBtn;
}
- (void)addHeaderView{
    
    //添加背景图
    UIView *headerBGView = [[UIView alloc]init];
    headerBGView.backgroundColor = [UIColor colorWithRed:0 green:0  blue:0 alpha:0.5];
    
    [self.view addSubview:headerBGView];
    self.headerBGView = headerBGView;
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    UIImage *leftBtnImage =[UIImage imageNamed:@"bar_btn_icon_returntext_white"];
    [leftBtn setImage:leftBtnImage forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    [self.headerBGView addSubview:leftBtn];
    self.leftButton = leftBtn;
    
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    rightBtn.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
//    UIImage *image =[UIImage imageNamed:@"img_icon_check_Big"];
//    UIImage *image_p =[UIImage imageNamed:@"img_icon_check_Big_p"];
//    [rightBtn setImage:image forState:UIControlStateNormal];
//    [rightBtn setImage:image_p forState:UIControlStateSelected];
//    [rightBtn addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [self.headerView addSubview:rightBtn];
//    self.rightButton = rightBtn;
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [[IPMediaCenter defaultCenter]startPreview];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [[IPMediaCenter defaultCenter]stopPreview];
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.headerBGView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 20 + 44);
    self.leftButton.frame = CGRectMake(-5, 20, 44, 44);
    
    self.bottomBGView.frame = CGRectMake(0, self.view.bounds.size.height - 64, self.view.bounds.size.width, 64);
    
    self.takePhotoBtn.frame = CGRectMake(0, 0, 44, 44);
    self.takePhotoBtn.center = CGPointMake(_bottomBGView.center.x, 32);

}
#pragma mark - btn_click
- (void)cancle{
    if ([_delegate respondsToSelector:@selector(didClickCancelBtnInTakePhotoViewController:)]) {
        [_delegate didClickCancelBtnInTakePhotoViewController:self];
    }
    
}
- (void)takePhoto:(UIButton *)sender
{
    
}
@end
