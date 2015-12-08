//
//  LogInView.m
//  Stock
//
//  Created by apple on 15/11/30.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "SignUpView.h"
#import "DeformationButton.h"

#define QMFWelcomeViewBGColor                                                       \
[UIColor colorWithRed: 255 / 255.0 green:240 / 255.0 blue: 127 / 255.0 alpha:1.0]

#define PhoneNumberTFPlaceHolderColor                                               \
[UIColor colorWithRed:180 / 255.0 green:180 / 255.0 blue:180 / 255.0 alpha:1.0]
#define PhoneNumberTFTextColor                                                      \
[UIColor colorWithRed:59 / 255.0 green:59 / 255.0 blue:59 / 255.0 alpha:1.0]
#define NextButtonColor                                                             \
[UIColor colorWithRed:180 / 255.0 green:180 / 255.0 blue:180 / 255.0 alpha:1.0]

#define PhoneNumberTFFont                                   [UIFont systemFontOfSize:16]
#define NextButtonFont                                      [UIFont systemFontOfSize:15]

@interface SignUpView ()

@property (nonatomic, strong) UIView *tfContentView;

@property (nonatomic, strong) UIImageView *lineIV;

@end

@implementation SignUpView

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
    
    [self createSignUpLogoIV];
    
    [self createTfContentView];
    
    [self createPhoneNumberTF];
    
    [self createLineIV];
    
    [self createTestNumberTF];
    
    [self createGetTextNumberButton];
    
    [self createNextButton];
    
}

- (void)createSignUpLogoIV {
    
    self.signUpLogoIV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sign-logo-image"]];
    
    [self addSubview:self.signUpLogoIV];
    
}

- (void)createTfContentView {
    
    self.tfContentView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.tfContentView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.tfContentView];
    
}

- (void)createPhoneNumberTF {
    self.phoneNumberTF = [[UITextField alloc] init];
    //self.phoneNumberTF.tag = TKWV_LOGIN_EMAIL_TAG;
    self.phoneNumberTF.placeholder = @"请你输入手机号";
    [self.phoneNumberTF setValue:PhoneNumberTFPlaceHolderColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.phoneNumberTF setValue:PhoneNumberTFFont forKeyPath:@"_placeholderLabel.font"];
    self.phoneNumberTF.font = PhoneNumberTFFont;
    self.phoneNumberTF.translatesAutoresizingMaskIntoConstraints = NO;
    self.phoneNumberTF.textColor = PhoneNumberTFTextColor;
    self.phoneNumberTF.backgroundColor = [UIColor whiteColor];
    self.phoneNumberTF.returnKeyType = UIReturnKeyNext;
    self.phoneNumberTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneNumberTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.phoneNumberTF.autocorrectionType = UITextAutocorrectionTypeNo;
    //[self.phoneNumberTF setKeyboardAppearanceType];
    
    [self.tfContentView addSubview:self.phoneNumberTF];
}

- (void)createTestNumberTF {
    self.testNumberTF = [[UITextField alloc] init];
    //self.phoneNumberTF.tag = TKWV_LOGIN_EMAIL_TAG;
    self.testNumberTF.placeholder = @"验证码";
    [self.testNumberTF setValue:PhoneNumberTFPlaceHolderColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.testNumberTF setValue:PhoneNumberTFFont forKeyPath:@"_placeholderLabel.font"];
    self.testNumberTF.font = PhoneNumberTFFont;
    self.testNumberTF.translatesAutoresizingMaskIntoConstraints = NO;
    self.testNumberTF.textColor = PhoneNumberTFTextColor;
    self.testNumberTF.backgroundColor = [UIColor whiteColor];
    self.testNumberTF.returnKeyType = UIReturnKeyNext;
    self.testNumberTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.testNumberTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.testNumberTF.autocorrectionType = UITextAutocorrectionTypeNo;
    //[self.phoneNumberTF setKeyboardAppearanceType];
    
    [self.tfContentView addSubview:self.testNumberTF];
}

- (void)createLineIV {
    
    self.lineIV = [[UIImageView alloc] initWithFrame:CGRectZero];
    
    self.lineIV.backgroundColor = [UIColor grayColor];
    
    [self.tfContentView addSubview:self.lineIV];
    
}

- (void)createGetTextNumberButton {
    self.getTextNumberButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //self.nextButton.backgroundColor = NextButtonColor;
    [self.nextButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.nextButton.titleLabel.font = NextButtonFont;
    //[self disableSignUpOrLogInButton];
    [self.nextButton.layer setCornerRadius:5.0];
    [self addSubview:self.nextButton];
}

- (void)createNextButton {
    self.nextButton = [[DeformationButton alloc] initWithFrame:CGRectZero withColor:NextButtonColor];
    //self.nextButton.backgroundColor = NextButtonColor;
    [self.nextButton setTitle:@"确定" forState:UIControlStateNormal];
    self.nextButton.titleLabel.font = NextButtonFont;
    //[self disableSignUpOrLogInButton];
    [self.nextButton.layer setCornerRadius:5.0];
    [self addSubview:self.nextButton];
}

- (void)setUpConstrain {
    
    [self.signUpLogoIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(80.f);
        make.centerX.equalTo(self);
    }];
    
    [self.tfContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.signUpLogoIV.mas_bottom).with.offset(30.f);
        make.left.equalTo(self).with.offset(25);
        make.right.equalTo(self).with.offset(-25);
        make.height.mas_equalTo(100);
    }];
    
    [self.phoneNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tfContentView);
        make.left.equalTo(self.tfContentView).with.offset(10.f);
        make.right.equalTo(self.tfContentView);
        make.height.mas_equalTo(49.5);
    }];
    
    [self.lineIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneNumberTF.mas_bottom);
        make.left.equalTo(self.tfContentView).with.offset(10.f);
        make.right.equalTo(self.tfContentView).with.offset(-10.f);
        make.height.mas_equalTo(1);
    }];
    
    [self.testNumberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineIV.mas_bottom);
        make.left.equalTo(self.phoneNumberTF);
        make.right.equalTo(self.tfContentView).with.offset(-40);
        make.height.equalTo(self.phoneNumberTF);
    }];
    
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.testNumberTF.mas_bottom).with.offset(20.f);
        make.centerX.equalTo(self.tfContentView);
        make.width.equalTo(self.tfContentView);
        make.height.mas_equalTo(45.f);
    }];
}

@end
