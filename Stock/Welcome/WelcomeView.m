//
//  WelcomeView.m
//  Stock
//
//  Created by apple on 15/10/11.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "WelcomeView.h"

@interface WelcomeView ()

@property(nonatomic,strong) UIImage *backgroundImage;
@property(nonatomic,strong) UIImageView *backgroundImageView;

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
}

- (void)createBackgroundImageView {
    self.backgroundImageView = [[UIImageView alloc] initWithImage:self.backgroundImage];
    [self addSubview:self.backgroundImageView];
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
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
}

@end
