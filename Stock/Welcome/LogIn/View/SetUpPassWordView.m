//
//  SetUpPassWordView.m
//  Stock
//
//  Created by ums on 15/12/7.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "SetUpPassWordView.h"
#import "DeformationButton.h"

#define QMFWelcomeViewBGColor                                                       \
[UIColor colorWithRed: 255 / 255.0 green:240 / 255.0 blue: 127 / 255.0 alpha:1.0]

#define NextButtonColor                                                             \
[UIColor colorWithRed:180 / 255.0 green:180 / 255.0 blue:180 / 255.0 alpha:1.0]
#define PhoneNumberTFTextColor                                                      \
[UIColor colorWithRed:59 / 255.0 green:59 / 255.0 blue:59 / 255.0 alpha:1.0]
#define PhoneNumberTFPlaceHolderColor                                               \
[UIColor colorWithRed:180 / 255.0 green:180 / 255.0 blue:180 / 255.0 alpha:1.0]


#define PhoneNumberTFFont                                   [UIFont systemFontOfSize:16]
#define NextButtonFont                                      [UIFont systemFontOfSize:15]

@implementation SetUpPassWordView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = QMFWelcomeViewBGColor;
        
        [self initSubViews];
        
        [self setUpConstrain];
        
    }
    return self;
}

- (void)initSubViews {
    
    [self createSetUpPassWordLogoIV];
    
    
    [self createPassWordTF];
    
    
    [self createNextButton];
    
}

- (void)createSetUpPassWordLogoIV {
    
    self.setUpPassWordLogoIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"setpassword-logo-image"]];
    
    [self addSubview:self.setUpPassWordLogoIV];
    

}

- (void)createPassWordTF {
    self.passWordTF = [[UITextField alloc] init];
    //self.phoneNumberTF.tag = TKWV_LOGIN_EMAIL_TAG;
    self.passWordTF.placeholder = @"密码";
    [self.passWordTF setValue:PhoneNumberTFPlaceHolderColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.passWordTF setValue:PhoneNumberTFFont forKeyPath:@"_placeholderLabel.font"];
    self.passWordTF.font = PhoneNumberTFFont;
    self.passWordTF.translatesAutoresizingMaskIntoConstraints = NO;
    self.passWordTF.textColor = PhoneNumberTFTextColor;
    self.passWordTF.backgroundColor = [UIColor whiteColor];
    self.passWordTF.returnKeyType = UIReturnKeyNext;
    self.passWordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passWordTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.passWordTF.autocorrectionType = UITextAutocorrectionTypeNo;
    //[self.phoneNumberTF setKeyboardAppearanceType];
    
    [self addSubview:self.passWordTF];

}

- (void)createNextButton {
    
    self.nextButton = [[DeformationButton alloc] initWithFrame:CGRectZero withColor:NextButtonColor];

    [self.nextButton setTitle:@"确定" forState:UIControlStateNormal];
    self.nextButton.titleLabel.font = NextButtonFont;
    //[self disableSignUpOrLogInButton];
    [self.nextButton.layer setCornerRadius:5.0];
    [self addSubview:self.nextButton];
}

- (void)setUpConstrain {
    
    [self.setUpPassWordLogoIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(80.f);
        make.centerX.equalTo(self);
    }];
    
    [self.passWordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.setUpPassWordLogoIV.mas_bottom).with.offset(30.f);
        make.left.equalTo(self).with.offset(25);
        make.right.equalTo(self).with.offset(-25);
        make.height.mas_equalTo(50);
    }];
    
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passWordTF.mas_bottom).with.offset(20.f);
        make.centerX.equalTo(self.passWordTF);
        make.width.equalTo(self.passWordTF);
        make.height.mas_equalTo(45.f);
    }];
    
}

@end
