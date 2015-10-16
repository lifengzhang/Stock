//
//  RootViewController.h
//  Stock
//
//  Created by apple on 15/10/13.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeViewController;
@class PersonalViewController;


@interface RootViewController : UIViewController

@property (nonatomic,strong) UITabBarController *tabBarController;

@property (nonatomic,strong) UINavigationController *homeViewNavController;
@property (nonatomic,strong) HomeViewController *homeViewController;

@property (nonatomic,strong) UINavigationController *personalViewNavController;
@property (nonatomic,strong) PersonalViewController *personalViewController;


- (UITabBarController *) getTabBarController;

@end
