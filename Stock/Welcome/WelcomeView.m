//
//  WelcomeView.m
//  Stock
//
//  Created by apple on 15/10/11.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "WelcomeView.h"

#define WV_TitleColor                                                         \
[UIColor colorWithRed:255 / 255.0 green:107 / 255.0 blue: 22 / 255.0 alpha:1.0]

#define WV_TitleFont                                     [UIFont fontWithName:@"Aller" size:33.f]

@interface WelcomeView ()

@property(nonatomic,strong) UIImage *backgroundImage;
@property(nonatomic,strong) UIImageView *backgroundImageView;
@property(nonatomic,strong) UILabel *welcomeLabel;
@property(nonatomic,strong) NSLayoutConstraint *welcomeLabelLeftLC;
@end

@implementation WelcomeView

- (instancetype)initWithFrame:(CGRect)frame backgroundImageStr:(NSString*)backgroundImageStr{
    self = [super initWithFrame:frame];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.backgroundColor = [UIColor redColor];
        self.backgroundImage = [UIImage imageNamed:backgroundImageStr];
        
        [self initSubViews];
        
        [self setUpConstrain];
    }
    return self;
}

- (void)initSubViews {
    [self createBackgroundImageView];
    
    [self createWelcomeLabel];
}

- (void)createBackgroundImageView {
    self.backgroundImageView = [[UIImageView alloc] initWithImage:self.backgroundImage];
    [self addSubview:self.backgroundImageView];
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)createWelcomeLabel {
    NSString *welcomeStr = @"welcome to use my stock app";
    self.welcomeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.welcomeLabel.text = welcomeStr;
    self.welcomeLabel.textAlignment = NSTextAlignmentCenter;
    self.welcomeLabel.textColor = WV_TitleColor;
    self.welcomeLabel.font = WV_TitleFont;
    [self addSubview:self.welcomeLabel];
    self.welcomeLabel.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)setUpConstrain {
    //ios 9 new method for auto layout
//    UILayoutGuide *layoutGuide = self.layoutMarginsGuide;
//    
//    [self.backgroundImageView.topAnchor constraintEqualToAnchor:layoutGuide.topAnchor].active = YES;
//    [self.backgroundImageView.bottomAnchor constraintEqualToAnchor:layoutGuide.bottomAnchor].active = YES;
//    [self.backgroundImageView.leftAnchor constraintEqualToAnchor:layoutGuide.leftAnchor].active = YES;
//    [self.backgroundImageView.rightAnchor constraintEqualToAnchor:layoutGuide.rightAnchor].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.f].active = YES;
    [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.f].active = YES;
    [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.f].active = YES;
    [NSLayoutConstraint constraintWithItem:self.backgroundImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.f].active = YES;
    
    
    self.welcomeLabelLeftLC = [NSLayoutConstraint constraintWithItem:self.welcomeLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.f];
    self.welcomeLabelLeftLC.active = YES;
    [NSLayoutConstraint constraintWithItem:self.welcomeLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.f].active = YES;
    
}

- (void)viewAnimation {
    [self removeConstraint:self.welcomeLabelLeftLC];

    [NSLayoutConstraint constraintWithItem:self.welcomeLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f].active = YES;

    [UIView animateWithDuration:1.f animations:^{
        [self layoutIfNeeded];
    }];
}

@end
