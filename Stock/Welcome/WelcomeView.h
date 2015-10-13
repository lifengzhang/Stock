//
//  WelcomeView.h
//  Stock
//
//  Created by apple on 15/10/11.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeView : UIView

@property (nonatomic,strong) UIButton * startButton;

- (instancetype)initWithFrame:(CGRect)frame backgroundImageStr:(NSString*)backgroundImageStr;

- (void)viewAnimation;

@end
