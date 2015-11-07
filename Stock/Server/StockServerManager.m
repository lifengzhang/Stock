//
//  StockServerManager.m
//  Stock
//
//  Created by apple on 15/10/27.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "StockServerManager.h"

#import "StockServerAFHttpClient.h"

@implementation StockServerManager

#pragma mark - Singleton
static StockServerManager *sharedAPIManager = nil;
+ (instancetype)sharedAPIManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAPIManager = [[StockServerManager alloc] init];
    });
    return sharedAPIManager;
}

- (void)requestStockListWithSucceedBlock:(void (^)())succeedBlock
                             failedBlock:(void (^)(NSError * error))failedBlock {
    [ServerAFHttpClient requestStockListWithSucceedBlock:^{
        
    } failedBlock:^(NSError *error) {
        
    }];
}

@end
