//
//  SetUpPassWordViewController.m
//  Stock
//
//  Created by ums on 15/12/7.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "SetUpPassWordViewController.h"
#import "SetUpPassWordView.h"

@interface SetUpPassWordViewController ()

@property (nonatomic, strong) SetUpPassWordView *setUpPassWordView;

@end

@implementation SetUpPassWordViewController

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
    self.setUpPassWordView = [[SetUpPassWordView alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:self.setUpPassWordView];
    
    
    [self.setUpPassWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

@end
