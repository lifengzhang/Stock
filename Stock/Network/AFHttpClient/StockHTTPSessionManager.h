//
//  StockHTTPSessionManager.h
//  Stock
//
//  Created by apple on 15/11/7.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "AFHTTPSessionManager.h"

typedef NS_ENUM(NSInteger, MethodType){
    ServerRequestMethodTypeGet   = 0,
    ServerRequestMethodTypePost  = 1,
};

@interface StockHTTPSessionManager : AFHTTPSessionManager

- (NSURLSessionDataTask *)asyncRequestWithURL:(NSString *)urlString
                                       method:(MethodType)method
                                    parameter:(NSDictionary *)paramDict
                                        retry:(BOOL)needRetry
                                      success:(void (^)(NSDictionary *responseDict))success
                                      failure:(void (^)(NSError *error))failure;

@end
