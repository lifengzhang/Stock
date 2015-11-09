//
//  StockServerAFHttpClient.m
//  Stock
//
//  Created by apple on 15/11/7.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "StockServerAFHttpClient.h"
#import "StockServerAPI.h"
@implementation StockServerAFHttpClient

static NSString * const SearchServer_BaseURL                                = @"http://apis.haoservice.com/lifeservice/";

static CGFloat const SearchServerClient_RequestTimeOut                      = 30.0;

#pragma mark - Singleton
static StockServerAFHttpClient *sharedClient = nil;
+ (instancetype)sharedClient {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //[NSURL URLWithString:@"hq?" relativeToURL:[NSURL URLWithString:SearchServer_BaseURL]]
        sharedClient = [[StockServerAFHttpClient alloc] initWithBaseURL:[NSURL URLWithString:SearchServer_BaseURL]];
        sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        sharedClient.requestSerializer.timeoutInterval = SearchServerClient_RequestTimeOut;
        
        
        // this line exist is because server side not returing the correct "Content-Type" : "application/json"
        sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain",@"application/x-javascript", nil];
        // server side sometimes returing different "Content-Type", it should at least stay same
        
    });
    return sharedClient;
}

- (NSURLSessionDataTask *)requestStockListWithSucceedBlock:(void (^)(NSDictionary *responseDict))succeedBlock
                                               failedBlock:(void (^)(NSError *error))failedBlock {
    
    return [self asyncRequestWithURL:StockServer_APIPath_Stocks method:ServerRequestMethodTypeGet parameter:nil retry:NO success:succeedBlock failure:^(NSError *error) {
        
    }];
    
};

- (NSURLSessionDataTask *)requestStockIndicesWithSucceedBlock:(void (^)(NSDictionary *responseDict))succeedBlock
                                                  failedBlock:(void (^)(NSError *error))failedBlock {
    
    return [self asyncRequestWithURL:StockServer_APIPath_Indices method:ServerRequestMethodTypeGet parameter:nil retry:NO success:succeedBlock failure:^(NSError *error) {
        
    }];
    
};

- (NSURLSessionDataTask *)requestStockWithParam:(NSDictionary *)paramDict
                                   SucceedBlock:(void (^)(NSDictionary *responseDict))succeedBlock
                                    failedBlock:(void (^)(NSError *error))failedBlock {
    
    return [self asyncRequestWithURL:StockServer_APIPath_Stock method:ServerRequestMethodTypePost parameter:paramDict retry:NO success:^(NSDictionary *responseDict) {
        
        if (responseDict[@"result"]) {
            succeedBlock(responseDict[@"result"]);
        }
        
    } failure:^(NSError *error) {
        
    }];
    
};

@end
