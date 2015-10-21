//
//  StockListView.m
//  Stock
//
//  Created by apple on 15/10/21.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "StockListView.h"

@implementation StockListView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createStockListTableView];
        
        [self setUpConstrain];
    }
    return self;
}

- (void)createStockListTableView {
    self.stockListTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];

    self.stockListTableView.dataSource = self;
    self.stockListTableView.delegate = self;
    [self.stockListTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"A"];
    
    [self addSubview:self.stockListTableView];
}

- (void)setUpConstrain {
    [self.stockListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"A" forIndexPath:indexPath];
    cell.textLabel.text = @"ABC";
    return cell;
}

@end
