//
//  QMFWelcomeFirstView.m
//  Stock
//
//  Created by ums on 15/12/2.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "QMFWelcomeFirstView.h"

#define QMFWelcomeViewBGColor                                                       \
[UIColor colorWithRed: 134 / 255.0 green:19 / 255.0 blue: 79 / 255.0 alpha:1.0]

@interface QMFWelcomeFirstView ()

@property (nonatomic, strong) UIImageView * cardImageView;

@property (nonatomic, strong) UIImageView * iconImageView;

@property (nonatomic, strong) UIImageView * cardNumImageView;

@property (nonatomic, strong) NSMutableArray *smallCardsArray;

@property (nonatomic, strong) UIImageView * smallCardImageView;

@end

@implementation QMFWelcomeFirstView


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
    
    self.cardImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"welcome-card-image"]];
    
    [self addSubview:self.cardImageView];
    
    
    self.iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"welcome-icon-image"]];
    
    [self.cardImageView addSubview:self.iconImageView];
    
    self.cardNumImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"welcome-cardnum-image"]];
    
    [self.cardImageView addSubview:self.cardNumImageView];
    
    self.smallCardsArray = [NSMutableArray arrayWithCapacity:5];
    
    for (int i; i < 6; i++) {
        UIImageView *smallCardImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"welcome-scard-image"]];
        
        [self.smallCardsArray addObject:smallCardImageView];
        
        [self addSubview:smallCardImageView];
    }
    
}

- (void)setUpConstrain {
    
    [self.cardImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cardImageView).with.offset(5.f);
        make.left.equalTo(self.cardImageView);
    }];
    
    [self.cardNumImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.cardImageView);
        make.centerY.equalTo(self.cardImageView);
    }];
    
    
    for (UIImageView *smallCardImageView in self.smallCardsArray) {
        
        [smallCardImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_top);
            make.right.equalTo(self).with.offset(-30.f);
        }];
    }
    
}

- (void)smallCardAnimaiton {
    
    void (^keyFrameBlock)() = ^(){
        for (UIImageView * cardImageView in self.smallCardsArray) {
            NSUInteger position = [self.smallCardsArray indexOfObject:cardImageView];
            CGFloat centerX = 0;
            CGFloat centerY = 0;
            
            CGFloat centerYOffset = arc4random()%150;
            
            if (centerYOffset < 100) {
                centerYOffset += 120;
            }
            
            centerY = self.frame.size.height/2 - centerYOffset;
            
            if (position%2 == 0) {
                centerX = self.frame.size.width/2 - arc4random()%150;
            }else {
                centerX = self.frame.size.width/2 + arc4random()%150;
            }
            
            [UIView addKeyframeWithRelativeStartTime:position / self.smallCardsArray.count
                                    relativeDuration:self.smallCardsArray.count
                                          animations:^{
                                              //[self layoutIfNeeded];
                                              cardImageView.center = CGPointMake(centerX, centerY);
                                          }];

            
        }
    };

    [UIView animateKeyframesWithDuration:2.0
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic | UIViewAnimationOptionCurveLinear
                              animations:keyFrameBlock
                              completion:^(BOOL finished) {
                                  
                                  [self completeAnimation];
                                  
                              }];

}

- (void)completeAnimation {
    
    void (^keyFrameBlock)() = ^(){
        for (UIImageView * cardImageView in self.smallCardsArray) {
            NSUInteger position = [self.smallCardsArray indexOfObject:cardImageView];
            CGFloat centerX = self.frame.size.width/2;
            CGFloat centerY = self.frame.size.height/2;
            
            [UIView addKeyframeWithRelativeStartTime:position / self.smallCardsArray.count
                                    relativeDuration:self.smallCardsArray.count
                                          animations:^{
                                              cardImageView.alpha = 0;
                                              cardImageView.center = CGPointMake(centerX, centerY);
                                          }];
            
            
        }
    };
    
    [UIView animateKeyframesWithDuration:2.0
                                   delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeCubic | UIViewAnimationOptionCurveLinear
                              animations:keyFrameBlock
                              completion:^(BOOL finished) {
                                  
                                  
                              }];
    
}

@end
