//
//  StockServerManager.h
//  Stock
//
//  Created by apple on 15/10/27.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockServerManager : NSObject

#define stockServerManager          [StockServerManager sharedAPIManager]

+ (instancetype)sharedAPIManager;

/**
 * @brief This Method is that get stock list
 *
 */
#pragma mark stock list
- (void)requestStockListWithSucceedBlock:(void (^)())succeedBlock
                             failedBlock:(void (^)(NSError * error))failedBlock;


#pragma mark stock Indices
- (void)requestStockIndicesWithSucceedBlock:(void (^)())succeedBlock
                                failedBlock:(void (^)(NSError * error))failedBlock;


#pragma mark stock
- (void)requestStockWithCode:(NSString *)code
                SucceedBlock:(void (^)())succeedBlock
                 failedBlock:(void (^)(NSError * error))failedBlock;

@end
