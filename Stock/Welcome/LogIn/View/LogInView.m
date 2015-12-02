//
//  LogInView.m
//  Stock
//
//  Created by apple on 15/11/30.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "LogInView.h"
#import "DeformationButton.h"

#define PhoneNumberTFPlaceHolderColor                                           \
[UIColor colorWithRed:180 / 255.0 green:180 / 255.0 blue:180 / 255.0 alpha:1.0]
#define PhoneNumberTFTextColor                                                  \
[UIColor colorWithRed:59 / 255.0 green:59 / 255.0 blue:59 / 255.0 alpha:1.0]
#define NextButtonColor                                                         \
[UIColor colorWithRed:250 / 255.0 green:194 / 255.0 blue:170 / 255.0 alpha:1.0]

#define PhoneNumberTFFont                                   [UIFont systemFontOfSize:16]
#define NextButtonFont                                      [UIFont systemFontOfSize:15]

@implementation LogInView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self initSubViews];
        
        [self setUpConstrain];
        
    }
    return self;
}

- (void)initSubViews {
    
    [self createPhoneNumberTF];
    
    [self createTestNumberTF];
    
    [self createGetTextNumberButton];
    
    [self createNextButton];
    
}

- (void)createPhoneNumberTF {
    self.phoneNumberTF = [[UITextField alloc] init];
    //self.phoneNumberTF.tag = TKWV_LOGIN_EMAIL_TAG;
    self.phoneNumberTF.placeholder = @"phoneNumber";
    [self.phoneNumberTF setValue:PhoneNumberTFPlaceHolderColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.phoneNumberTF setValue:PhoneNumberTFFont forKeyPath:@"_placeholderLabel.font"];
    self.phoneNumberTF.font = PhoneNumberTFFont;
    self.phoneNumberTF.translatesAutoresizingMaskIntoConstraints = NO;
    self.phoneNumberTF.textColor = PhoneNumberTFTextColor;
    self.phoneNumberTF.backgroundColor = [UIColor clearColor];
    self.phoneNumberTF.returnKeyType = UIReturnKeyNext;
    self.phoneNumberTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneNumberTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.phoneNumberTF.autocorrectionType = UITextAutocorrectionTypeNo;
    //[self.phoneNumberTF setKeyboardAppearanceType];
    
    [self addSubview:self.phoneNumberTF];
}

- (void)createTestNumberTF {
    self.testNumberTF = [[UITextField alloc] init];
    //self.phoneNumberTF.tag = TKWV_LOGIN_EMAIL_TAG;
    self.testNumberTF.placeholder = @"textNumber";
    [self.testNumberTF setValue:PhoneNumberTFPlaceHolderColor forKeyPath:@"_placeholderLabel.textColor"];
    [self.testNumberTF setValue:PhoneNumberTFFont forKeyPath:@"_placeholderLabel.font"];
    self.testNumberTF.font = PhoneNumberTFFont;
    self.testNumberTF.translatesAutoresizingMaskIntoConstraints = NO;
    self.testNumberTF.textColor = PhoneNumberTFTextColor;
    self.testNumberTF.backgroundColor = [UIColor clearColor];
    self.testNumberTF.returnKeyType = UIReturnKeyNext;
    self.testNumberTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.testNumberTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.testNumberTF.autocorrectionType = UITextAutocorrectionTypeNo;
    //[self.phoneNumberTF setKeyboardAppearanceType];
    
    [self addSubview:self.testNumberTF];
}

- (void)createGetTextNumberButton {
    
}

- (void)createNextButton {
    self.nextButton = [[DeformationButton alloc] initWithFrame:CGRectZero withColor:NextButtonColor];
    //self.nextButton.backgroundColor = NextButtonColor;
    [self.nextButton setTitle:@"Log In" forState:UIControlStateNormal];
    self.nextButton.titleLabel.font = NextButtonFont;
    //[self disableSignUpOrLogInButton];
    [self.nextButton.layer setCornerRadius:5.0];
    [self addSubview:self.nextButton];
}

- (void)setUpConstrain {
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
}

@end
