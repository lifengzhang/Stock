//
//  WelcomeViewController.m
//  Stock
//
//  Created by apple on 15/10/11.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "WelcomeViewController.h"
#import "WelcomeView.h"

@interface WelcomeViewController ()

@property(nonatomic,strong) WelcomeView *welcomeView;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.welcomeView = [[WelcomeView alloc] initWithFrame:CGRectZero backgroundImageStr:@"welcome-background-image"];
    [self.view addSubview:self.welcomeView];
    
//    UILayoutGuide *layoutGuide = self.view.layoutMarginsGuide;
//    
//    [self.welcomeView.topAnchor constraintEqualToAnchor:layoutGuide.topAnchor].active = YES;
//    [self.welcomeView.bottomAnchor constraintEqualToAnchor:layoutGuide.bottomAnchor].active = YES;
//    [self.welcomeView.leftAnchor constraintEqualToAnchor:layoutGuide.leftAnchor].active = YES;
//    [self.welcomeView.rightAnchor constraintEqualToAnchor:layoutGuide.rightAnchor].active = YES;
    
    
    [NSLayoutConstraint constraintWithItem:self.welcomeView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.f].active = YES;
    [NSLayoutConstraint constraintWithItem:self.welcomeView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.f].active = YES;
    [NSLayoutConstraint constraintWithItem:self.welcomeView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.f].active = YES;
    [NSLayoutConstraint constraintWithItem:self.welcomeView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.f].active = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
