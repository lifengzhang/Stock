//
//  QMFWelcomeThirdView.m
//  Stock
//
//  Created by ums on 15/12/7.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "QMFWelcomeThirdView.h"

#define QMFWelcomeViewBGColor                                                       \
[UIColor colorWithRed: 255 / 255.0 green:240 / 255.0 blue: 127 / 255.0 alpha:1.0]


@interface QMFWelcomeThirdView ()

@property (nonatomic, strong) UIImageView *logoIconImageView;

@property (nonatomic, strong) UILabel *acceptLawLabel;

@end

@implementation QMFWelcomeThirdView

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
    
    [self createLogoIconImageView];
    
    [self createWeiChatButton];
    
    [self createMessageButton];
    
    [self createAcceptLawLabel];
    
}

- (void)createLogoIconImageView {
    
    self.logoIconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"welcome-doorfox-image"]];
                              
    [self addSubview:self.logoIconImageView];
    
}

- (void)createWeiChatButton {
    
    self.weiChatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.weiChatButton setTitle:@"微信登录" forState:UIControlStateNormal];
    
    [self.weiChatButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    self.weiChatButton.layer.borderColor = [UIColor redColor].CGColor;
    self.weiChatButton.layer.borderWidth = 1.f;
    
    [self addSubview:self.weiChatButton];
    
}

- (void)createMessageButton {
 
    self.messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.messageButton setTitle:@"短信登录" forState:UIControlStateNormal];
    
    [self.messageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.messageButton.layer.borderColor = [UIColor redColor].CGColor;
    self.messageButton.layer.borderWidth = 1.f;
    
    [self addSubview:self.messageButton];
    
}

- (void)createAcceptLawLabel {
    
    self.acceptLawLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    self.acceptLawLabel.text = @"已阅读并同意软件许可及服务协议";
    
    self.acceptLawLabel.textColor = [UIColor redColor];
    
    self.acceptLawLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:self.acceptLawLabel];
    
}


- (void)setUpConstrain {
    
    [self.logoIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.weiChatButton.mas_top).with.offset(-100);
        make.centerX.equalTo(self);
    }];
    
    [self.weiChatButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.messageButton.mas_top).with.offset(-45);
        make.left.equalTo(self).with.offset(25.f);
        make.right.equalTo(self).with.offset(-25.f);
        make.height.mas_equalTo(45.f);
        make.centerX.equalTo(self);
    }];
    
    [self.messageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.acceptLawLabel.mas_top).with.offset(-77);
        make.width.equalTo(self.weiChatButton);
        make.height.equalTo(self.weiChatButton);
        make.centerX.equalTo(self.weiChatButton);
    }];
    
    
    [self.acceptLawLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-28.f);
        make.centerX.equalTo(self.weiChatButton);
    }];
    
}


@end
