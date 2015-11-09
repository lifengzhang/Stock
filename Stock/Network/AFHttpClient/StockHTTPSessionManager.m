//
//  StockHTTPSessionManager.m
//  Stock
//
//  Created by apple on 15/11/7.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "StockHTTPSessionManager.h"
#import "StockNetworkCommonData.h"

@implementation StockHTTPSessionManager


- (NSURLSessionDataTask *)asyncRequestWithURL:(NSString *)urlString
                                       method:(MethodType)method
                                    parameter:(NSDictionary *)paramDict
                                        retry:(BOOL)needRetry
                                      success:(void (^)(NSDictionary *responseDict))success
                                      failure:(void (^)(NSError *error))failure {
    //-- param
    NSMutableDictionary *allParamMDict = [StockNetworkCommonData commonParamMDictionary];
    [allParamMDict addEntriesFromDictionary:paramDict];
    

    NSURLSessionDataTask *task;
    
    if (method == ServerRequestMethodTypeGet) {
        task =
        [self GET:urlString parameters:allParamMDict success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                if (success) {
                    success(responseObject);
                }
            }if ([responseObject isKindOfClass:[NSData class]]) {
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                if ([json isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *resultDict = (NSDictionary *)json;
                    if (success) {
                        success(resultDict);
                    }
                }
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
    }
    else {
        task =
        [self POST:urlString parameters:allParamMDict success:^(NSURLSessionDataTask *task, id responseObject) {
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                if (success) {
                    success(responseObject);
                }
            }if ([responseObject isKindOfClass:[NSData class]]) {
                id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                if ([json isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *resultDict = (NSDictionary *)json;
                    if (success) {
                        success(resultDict);
                    }
                }
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
    }
    
    return  task;

}

@end
