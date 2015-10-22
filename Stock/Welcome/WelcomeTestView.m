//
//  WelcomeTestView.m
//  Stock
//
//  Created by apple on 15/10/21.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "WelcomeTestView.h"

@interface WelcomeTestView ()
@property(nonatomic,strong) UIImage *backgroundImage;
@property(nonatomic,strong) UIImageView *backgroundImageView;
@property(nonatomic,strong) UIView *boxView;
@property(nonatomic,strong) UIDynamicAnimator *dynamicAnimator;
@end

@implementation WelcomeTestView

- (instancetype)initWithFrame:(CGRect)frame backgroundImageStr:(NSString*)backgroundImageStr{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundImage = [UIImage imageNamed:backgroundImageStr];
        
        [self initSubViews];
        
        [self setUpConstrain];
        
        [self animation];
    }
    return self;
}


- (void)initSubViews {
    [self createBackgroundImageView];
    [self createBoxView];
}

- (void)createBackgroundImageView {
    self.backgroundImageView = [[UIImageView alloc] initWithImage:self.backgroundImage];
    [self addSubview:self.backgroundImageView];
}

- (void)createBoxView {

    self.boxView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.boxView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.boxView];

}

- (void)setUpConstrain {
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)animation {
    self.dynamicAnimator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    
    UIGravityBehavior *boxGravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.boxView]];
    
    
    UIDynamicItemBehavior* itemBehaviour = [[UIDynamicItemBehavior alloc] initWithItems:@[self.boxView]];
    itemBehaviour.elasticity = 0.6;
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.boxView]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    [self.dynamicAnimator addBehavior:boxGravityBehavior];
    [self.dynamicAnimator addBehavior:itemBehaviour];
    [self.dynamicAnimator addBehavior:collisionBehavior];
}

@end
