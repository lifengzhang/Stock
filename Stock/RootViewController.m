//
//  RootViewController.m
//  Stock
//
//  Created by apple on 15/10/13.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "RootViewController.h"

#import "HomeViewController.h"
#import "PersonalViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITabBarController *) getTabBarController {
    self.tabBarController = [[UITabBarController alloc] init];
    
    [self createHomeViewNavController];
    [self createPersonalViewNavController];
    
    self.tabBarController.viewControllers = @[self.homeViewNavController, self.personalViewNavController];
    
    return self.tabBarController;
}

- (void)createHomeViewNavController {
    
    self.homeViewController = [[HomeViewController alloc] init];
    
    self.homeViewNavController = [[UINavigationController alloc] initWithRootViewController:self.homeViewController];
    
    self.homeViewNavController.tabBarItem.title = @"首页";
    
    [self.homeViewNavController.tabBarItem setImage:[UIImage imageNamed:@"homeTabBarIcon"]];
}

- (void)createPersonalViewNavController {
    
    self.personalViewController = [[PersonalViewController alloc] init];
    
    self.personalViewNavController = [[UINavigationController alloc] initWithRootViewController:self.personalViewController];
    
    self.personalViewNavController.tabBarItem.title = @"自选";
    
    [self.personalViewNavController.tabBarItem setImage:[UIImage imageNamed:@"homeTabBarIcon"]];
}

@end
