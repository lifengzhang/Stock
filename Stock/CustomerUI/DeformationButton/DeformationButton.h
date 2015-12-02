//
//  DeformationButton.h
//  Stock
//
//  Created by ums on 15/12/1.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpinnerView;

@interface DeformationButton : UIButton

@property(nonatomic, assign) BOOL isLoading;

@property(nonatomic, strong) SpinnerView *spinnerView;

@property(nonatomic, strong) UIView *displayView;

- (instancetype)initWithFrame:(CGRect)frame withColor:(UIColor*)color;

@end
