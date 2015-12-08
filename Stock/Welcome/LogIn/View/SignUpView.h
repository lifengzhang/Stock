//
//  LogInView.h
//  Stock
//
//  Created by apple on 15/11/30.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DeformationButton;

@interface SignUpView : UIView

@property (nonnull, nonatomic, strong) UIImageView *signUpLogoIV;

@property (nonnull, nonatomic, strong) UITextField *phoneNumberTF;

@property (nonnull, nonatomic, strong) UITextField *testNumberTF;

@property (nonnull, nonatomic, strong) UIButton *getTextNumberButton;

@property (nonnull, nonatomic, strong) DeformationButton *nextButton;

@end
