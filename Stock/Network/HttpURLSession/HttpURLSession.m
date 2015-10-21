//
//  HttpURLSession.m
//  Stock
//
//  Created by apple on 15/10/18.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "HttpURLSession.h"

@implementation HttpURLSession

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initDefaultSession];
    }
    return self;
}

- (void)initDefaultSessionNoDelegate{
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    self.defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    [[self.defaultSession dataTaskWithURL:[NSURL URLWithString:@"http://ctxalgo.com/api/stocks"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Got response %@ with error %@.\n",response,error);
        
        NSError *Error;
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&Error];
        
        NSLog(@"DATA:\n%@\nEND DATA\n",jsonDict);

    }]resume];
}

- (void)initDefaultSession{
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    self.defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *sessionDataTask = [self.defaultSession dataTaskWithURL:[NSURL URLWithString:@"http://ctxalgo.com/api/stocks"]];
    
    [sessionDataTask resume];
}


#pragma protocol NSURLSessionTaskDelegate <NSURLSessionDelegate>
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    
}

#pragma protocol NSURLSessionTaskDelegate <NSURLSessionDelegate>
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(nullable NSError *)error {
    
}

@end
