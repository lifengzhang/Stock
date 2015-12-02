//
//  LogInViewController.m
//  Stock
//
//  Created by apple on 15/11/30.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "LogInViewController.h"
#import "LogInView.h"

@interface LogInViewController ()

@property (nonatomic, strong) LogInView *logInView;

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

- (void)initSubViews {
    self.logInView = [[LogInView alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:self.logInView];
    
    
    [self.logInView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

@end
