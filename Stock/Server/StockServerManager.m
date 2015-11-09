//
//  StockServerManager.m
//  Stock
//
//  Created by apple on 15/10/27.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "StockServerManager.h"

#import "StockServerAFHttpClient.h"

#import "User.h"
#import "Stock.h"

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
    [ServerAFHttpClient requestStockListWithSucceedBlock:^(NSDictionary *responseDict) {
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        if (responseDict && [responseDict isKindOfClass:[NSDictionary class]]) {
            
            if (succeedBlock) {
                succeedBlock();
            }
        }

    } failedBlock:^(NSError *error) {
        
    }];
}

- (void)requestStockIndicesWithSucceedBlock:(void (^)())succeedBlock
                                failedBlock:(void (^)(NSError * error))failedBlock {
    
    [ServerAFHttpClient requestStockIndicesWithSucceedBlock:^(NSDictionary *responseDict) {

        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        if (responseDict && [responseDict isKindOfClass:[NSDictionary class]]) {
            
            NSMutableArray * stockList = [NSMutableArray array];
            
            NSArray *keysArray = [responseDict allKeys];
            
            for (NSString *key in keysArray) {
                
                
            }
            
            if (succeedBlock) {
                succeedBlock();
            }
        }
    } failedBlock:^(NSError *error) {
        
    }];
}

- (void)requestStockWithCode:(NSString *)code
                SucceedBlock:(void (^)())succeedBlock
                 failedBlock:(void (^)(NSError * error))failedBlock {
    if (code == nil || code.length == 0) {
        return;
    }
    
    NSMutableDictionary * paramDict = [NSMutableDictionary dictionary];
    paramDict[@"gid"] = code;
    
    [ServerAFHttpClient requestStockWithParam:paramDict SucceedBlock:^(NSDictionary *responseDict) {
        NSLog(@"%@",responseDict);
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        Stock *stock = [Stock insertItemInManagedObjectContext:appDelegate.managedObjectContext];
        [stock setStockPropertiesWith:responseDict[@"data"]];
        
        User *user = [User insertItemInManagedObjectContext:appDelegate.managedObjectContext];
        [user addStocklistObject:stock];
        NSLog(@"user %@",user);
        
    } failedBlock:^(NSError *error) {
        
    }];
    
}

@end
