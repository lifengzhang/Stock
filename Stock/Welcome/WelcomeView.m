//
//  WelcomeView.m
//  Stock
//
//  Created by apple on 15/10/11.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "WelcomeView.h"

#define WV_TitleColor                                                           \
[UIColor colorWithRed:255 / 255.0 green:107 / 255.0 blue: 22 / 255.0 alpha:1.0]

#define WV_ButtonHighlightedColor                                               \
[UIColor colorWithRed:255 / 255.0 green:107 / 255.0 blue: 23 / 255.0 alpha:1.0]

#define WV_BorderColor                                                       \
[UIColor colorWithRed: 255 / 255.0 green:107 / 255.0 blue: 22 / 255.0 alpha:1.0]

#define WV_TitleFont                                     [UIFont fontWithName:@"Aller" size:50.f]

#define WVF_buttonFont                                    [UIFont boldSystemFontOfSize:17.f]

@interface WelcomeView ()

@property(nonatomic,strong) UIImage *backgroundImage;
@property(nonatomic,strong) UIImageView *backgroundImageView;
@property(nonatomic,strong) UILabel *welcomeLabel;
@property(nonatomic,strong) NSLayoutConstraint *welcomeLabelLeftLC;
@property(nonatomic,strong) NSLayoutConstraint *startButtonTopLC;
@end

@implementation WelcomeView

- (instancetype)initWithFrame:(CGRect)frame backgroundImageStr:(NSString*)backgroundImageStr{
    self = [super initWithFrame:frame];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO;

        self.backgroundImage = [UIImage imageNamed:backgroundImageStr];
        
        [self initSubViews];
        
        [self setUpConstrain];
    }
    return self;
}

- (void)initSubViews {
    [self createBackgroundImageView];
    
    [self createWelcomeLabel];
    
    [self createStartButton];
}

- (void)createBackgroundImageView {
    self.backgroundImageView = [[UIImageView alloc] initWithImage:self.backgroundImage];
    [self addSubview:self.backgroundImageView];
    self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)createWelcomeLabel {
    NSString *welcomeStr = @"Welcome To Use My Stock App";
    self.welcomeLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.welcomeLabel.text = welcomeStr;
    self.welcomeLabel.textAlignment = NSTextAlignmentCenter;
    self.welcomeLabel.textColor = WV_TitleColor;
    self.welcomeLabel.font = WV_TitleFont;
    [self addSubview:self.welcomeLabel];
    self.welcomeLabel.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)createStartButton {
    self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startButton.backgroundColor = [UIColor whiteColor];
    
    NSAttributedString *textAttrString =
    [[NSAttributedString alloc] initWithString:@"Start"
                                    attributes:@{NSFontAttributeName:WVF_buttonFont,
                                                 NSForegroundColorAttributeName:WV_TitleColor}];
    [self.startButton setAttributedTitle:textAttrString forState:UIControlStateNormal];
    
    NSAttributedString *hightLightTextAttrString =
    [[NSAttributedString alloc] initWithString:@"Start"
                                    attributes:@{NSFontAttributeName:WVF_buttonFont,
                                                 NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self.startButton setAttributedTitle:textAttrString forState:UIControlStateNormal];
    
    [self.startButton setAttributedTitle:hightLightTextAttrString forState:UIControlStateHighlighted];
    
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    colorView.backgroundColor = WV_ButtonHighlightedColor;
    UIGraphicsBeginImageContext(colorView.bounds.size);
    [colorView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *bottomBarBackgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.startButton setBackgroundImage:bottomBarBackgroundImage forState:UIControlStateHighlighted];
    
    [self addSubview:self.startButton];
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    
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
    [NSLayoutConstraint constraintWithItem:self.welcomeLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-50.f].active = YES;
    
    
    self.startButtonTopLC = [NSLayoutConstraint constraintWithItem:self.startButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.f];
    self.startButtonTopLC.active = YES;
    [NSLayoutConstraint constraintWithItem:self.startButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f].active = YES;
    [NSLayoutConstraint constraintWithItem:self.startButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0 constant:150.f].active = YES;
    [NSLayoutConstraint constraintWithItem:self.startButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:1.0 constant:50.f].active = YES;

}

- (void)viewAnimation {
    [self removeConstraint:self.welcomeLabelLeftLC];
    
    [self removeConstraint:self.startButtonTopLC];

    [NSLayoutConstraint constraintWithItem:self.welcomeLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.f].active = YES;
    [NSLayoutConstraint constraintWithItem:self.startButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.welcomeLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.f].active = YES;

    [UIView animateWithDuration:1.f animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self buttonBorderAnimation:self.startButton];
    }];
}

- (void)buttonBorderAnimation:(UIButton *)button {
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    
    CGPathMoveToPoint(path, NULL, 1, 1);
    CGPathAddLineToPoint(path, NULL, button.frame.size.width-1, 1);
    CGPathAddLineToPoint(path, NULL, button.frame.size.width-1, button.frame.size.height-1);
    CGPathAddLineToPoint(path, NULL, 1, button.frame.size.height-1);
    
//    CGPathMoveToPoint(path, NULL, button.size.width-1, button.size.height-1);
//    CGPathAddLineToPoint(path, NULL, 1, button.size.height-1);
//    CGPathAddLineToPoint(path, NULL, 1, 1);
//    CGPathAddLineToPoint(path, NULL, button.size.width-1, 1);
    
    CGPathCloseSubpath(path);
    
    CAShapeLayer  *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = WV_BorderColor.CGColor;
    shapeLayer.lineWidth = 2.0;
    shapeLayer.fillRule = kCAFillRuleNonZero;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    [shapeLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    
    [button.layer addSublayer:shapeLayer];
}

@end
