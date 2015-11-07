//
//  PersonalViewController.m
//  Stock
//
//  Created by apple on 15/10/16.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "PersonalViewController.h"
#import "StockListView.h"
#import "Stock.h"
#import "AppDelegate.h"

@interface PersonalViewController ()
@property (nonatomic,strong) StockListView *stockListView;
@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchData];
    
    self.stockListView = [[StockListView alloc] init];
    
    [self.view addSubview:self.stockListView];
    
    [self.stockListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchData {
    
    [stockServerManager requestStockIndicesWithSucceedBlock:^{
        
    } failedBlock:^(NSError *error) {
        
    }];
    
}

@end
