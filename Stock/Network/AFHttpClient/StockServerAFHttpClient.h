//
//  StockServerAFHttpClient.h
//  Stock
//
//  Created by apple on 15/11/7.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "StockHTTPSessionManager.h"

@interface StockServerAFHttpClient : StockHTTPSessionManager

#define ServerAFHttpClient                                  [StockServerAFHttpClient sharedClient]

#pragma mark - Singleton
+ (instancetype)sharedClient;

- (NSURLSessionDataTask *)requestStockListWithSucceedBlock:(void (^)())succeedBlock
                                               failedBlock:(void (^)(NSError *error))failedBlock;

@end
