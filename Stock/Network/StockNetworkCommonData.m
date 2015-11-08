//
//  StockNetworkCommonData.m
//  Stock
//
//  Created by apple on 15/11/7.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "StockNetworkCommonData.h"

@implementation StockNetworkCommonData

#pragma mark - Singleton
static StockNetworkCommonData *sharedInstance = nil;
+ (instancetype)sharedInstance {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[StockNetworkCommonData alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Common Parameter

+ (NSMutableDictionary *)commonParamMDictionary {
    NSMutableDictionary *commonParamDictionary = [[NSMutableDictionary alloc] init];
    
    commonParamDictionary[@"key"] = @"fca64e125e114e8a92fbe680139e08fa";
    
    return commonParamDictionary;
}


@end
