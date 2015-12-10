//
//  LogInViewController.m
//  Stock
//
//  Created by apple on 15/11/30.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "LogInViewController.h"
#import "SignUpView.h"
#import "DeformationButton.h"
#import "SetUpPassWordViewController.h"

@interface LogInViewController ()

@property (nonatomic, strong) SignUpView *logInView;

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self showNavigationController];
    
}

- (void)showNavigationController {
    
    self.navigationController.navigationBarHidden = NO;

    UIImage *backgroundImage = [UIImage createImageViewWithColor:[UIColor clearColor]];
    
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)initSubViews {
    self.logInView = [[SignUpView alloc] initWithFrame:CGRectZero];
    
    [self.logInView.nextButton addTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.logInView];
    
    
    [self.logInView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)signUp {
    
    dispatch_time_t when=dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.f * NSEC_PER_SEC));
    dispatch_after(when, dispatch_get_main_queue(), ^{
        SetUpPassWordViewController *setUpPassWordViewController = [[SetUpPassWordViewController alloc] init];
        
        [self.navigationController pushViewController:setUpPassWordViewController animated:YES];
    });

}

@end
