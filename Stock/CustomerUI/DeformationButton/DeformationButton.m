//
//  DeformationButton.m
//  Stock
//
//  Created by ums on 15/12/1.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "DeformationButton.h"

#import "SpinnerView.h"

@interface DeformationButton ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation DeformationButton

- (instancetype)initWithFrame:(CGRect)frame withColor:(UIColor*)color
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViewsWithColor:(UIColor*)color];
        
        [self addTarget:self action:@selector(loadingAction) forControlEvents:UIControlEventTouchUpInside];
   
        [self setUpConstrain];
    }
    return self;
}

- (void)initSubViewsWithColor:(UIColor*)color{
    self.clipsToBounds = NO;
    self.layer.masksToBounds = NO;
    
    self.bgView = [[UIView alloc]initWithFrame:CGRectZero];
    self.bgView.backgroundColor = color;
    self.bgView.userInteractionEnabled = NO;
    self.bgView.hidden = YES;
    self.bgView.layer.cornerRadius = 3;
    self.bgView.layer.masksToBounds = NO;
    [self addSubview:self.bgView];
    
    
    self.displayView = [[UIView alloc]initWithFrame:CGRectZero];
    self.displayView.userInteractionEnabled = NO;
    
    self.displayView.backgroundColor = color;
    
    //[self.forDisplayButton setBackgroundImage:[[self imageWithColor:color cornerRadius:3] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)] forState:UIControlStateNormal];
    [self addSubview:self.displayView];

    
    SpinnerView *spinnerView = [[SpinnerView alloc] initWithFrame:CGRectZero];
    self.spinnerView = spinnerView;
    
    self.spinnerView.tintColor = [UIColor whiteColor];
    self.spinnerView.lineWidth = 2;
    self.spinnerView.center = CGPointMake(CGRectGetMidX(self.layer.bounds), CGRectGetMidY(self.layer.bounds));
    self.spinnerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.spinnerView.userInteractionEnabled = NO;
    [self addSubview:self.spinnerView];
}

- (void)setUpConstrain {
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.displayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)loadingAction {
    [self startLoading];
}

- (void)startLoading{
    
    self.isLoading = YES;
    
    self.bgView.hidden = NO;
    self.displayView.hidden = YES;
    
    CGFloat defaultW = self.bgView.frame.size.width;
    CGFloat defaultH = self.bgView.frame.size.height;
    CGFloat defaultR = self.bgView.layer.cornerRadius;
    
    self.spinnerView.bounds = CGRectMake(0, 0, defaultH*0.8, defaultH*0.8);
    self.spinnerView.center = CGPointMake(CGRectGetMidX(self.layer.bounds), CGRectGetMidY(self.layer.bounds));
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fromValue = [NSNumber numberWithFloat:defaultR];
    animation.toValue = [NSNumber numberWithFloat:defaultH*1.2*0.5];
    animation.duration = 0.3;
    [self.bgView.layer setCornerRadius:defaultH*1.2*0.5];
    [self.bgView.layer addAnimation:animation forKey:@"cornerRadius"];
    
    self.bgView.backgroundColor = [UIColor redColor];
    
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.bgView.layer.bounds = CGRectMake(0, 0, defaultW*1.2, defaultH*1.2);
    } completion:^(BOOL finished) {
        if (self.isLoading) {
            [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
                self.bgView.layer.bounds = CGRectMake(0, 0, defaultH*1.2, defaultH*1.2);
                self.displayView.transform = CGAffineTransformMakeScale(0, 0);
                self.displayView.alpha = 0;
            } completion:^(BOOL finished) {
                if (self.isLoading) {
                    self.displayView.hidden = YES;
                    [self.spinnerView startAnimating];
                }
            }];
        }
    }];
}

@end
