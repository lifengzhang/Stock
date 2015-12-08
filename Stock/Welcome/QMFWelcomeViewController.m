//
//  QMFWelcomeViewController.m
//  Stock
//
//  Created by ums on 15/12/2.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "QMFWelcomeViewController.h"
#import "QMFWelcomeFirstView.h"

#import "QMFWelcomeThirdView.h"

#import "LogInViewController.h"

#define QMFWelcomeViewBGColor                                                       \
[UIColor colorWithRed: 134 / 255.0 green:19 / 255.0 blue: 79 / 255.0 alpha:1.0]


@interface QMFWelcomeViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) QMFWelcomeFirstView *qmfWelcomeFirstView;

@property (nonatomic, strong) UIView  *qmfWelcomeSecondView;

@property (nonatomic, strong) QMFWelcomeThirdView  *qmfWelcomeThirdView;

@end

@implementation QMFWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createScrollView];
    
    [self createContentView];
    
    [self createQMFWelcomeFirstView];
    
    [self createQMFWelcomeSecondView];
    
    [self createQMFWelcomeThirdView];
    
    [self createPageControl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createScrollView {
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    
    self.scrollView.delegate = self;
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.scrollView.pagingEnabled = YES;
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
    
    
    [self.view addSubview:self.scrollView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets
        (UIEdgeInsetsMake(0,0,0,0));
    }];
    
}

- (void)createContentView {
    self.contentView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.scrollView addSubview:self.contentView];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        
        make.width.mas_equalTo(self.view.frame.size.width*3);
    }];

}

- (void)createQMFWelcomeFirstView {
    self.qmfWelcomeFirstView = [[QMFWelcomeFirstView alloc] initWithFrame:CGRectZero];
    
    [self.contentView addSubview:self.qmfWelcomeFirstView];
    
    [self.qmfWelcomeFirstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(self.view);
        make.left.equalTo(self.contentView);
        make.height.equalTo(self.contentView);
        make.width.equalTo(self.view);
    }];
    
}

- (void)createQMFWelcomeSecondView {
    self.qmfWelcomeSecondView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.qmfWelcomeSecondView.backgroundColor = [UIColor blueColor];
    
    [self.contentView addSubview:self.qmfWelcomeSecondView];
    
    [self.qmfWelcomeSecondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(self.view);
        make.left.equalTo(self.qmfWelcomeFirstView.mas_right);
        make.width.equalTo(self.view);
        make.height.equalTo(self.contentView);
    }];
    
}

- (void)createQMFWelcomeThirdView {
    self.qmfWelcomeThirdView = [[QMFWelcomeThirdView alloc] initWithFrame:CGRectZero];
    
    [self.contentView addSubview:self.qmfWelcomeThirdView];
    
    [self.qmfWelcomeThirdView.messageButton addTarget:self action:@selector(showMessageSignUpView) forControlEvents:UIControlEventTouchUpInside];
    
    [self.qmfWelcomeThirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.equalTo(self.view);
        make.left.equalTo(self.qmfWelcomeSecondView.mas_right);
        make.width.equalTo(self.view);
        make.height.equalTo(self.contentView);
    }];

}

- (void)createPageControl {
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;
    [self.view addSubview:self.pageControl];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
        make.centerX.equalTo(self.view);
    }];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self hideNavigationController];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    dispatch_time_t when=dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC));
//    dispatch_after(when, dispatch_get_main_queue(), ^{
//        [self.qmfWelcomeFirstView smallCardAnimaiton];
//    });
}

- (void)hideNavigationController {
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = scrollView.contentOffset.x / self.view.frame.size.width;
    
    self.pageControl.currentPage = page;
}

- (void)showMessageSignUpView {
    LogInViewController *loginViewController = [[LogInViewController alloc] init];
    
    [self.navigationController pushViewController:loginViewController animated:YES];
}

@end
