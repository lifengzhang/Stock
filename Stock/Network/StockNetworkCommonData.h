//
//  StockNetworkCommonData.h
//  Stock
//
//  Created by apple on 15/11/7.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockNetworkCommonData : NSObject

+ (instancetype)sharedInstance;

+ (NSMutableDictionary *)commonParamMDictionary;

@end
