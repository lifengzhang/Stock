//
//  StockListView.h
//  Stock
//
//  Created by apple on 15/10/21.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StockListView : UIView <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *stockListTableView;
@end
