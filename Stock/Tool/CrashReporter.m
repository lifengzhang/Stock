//
//  CrashReporter.m
//  Stock
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "CrashReporter.h"
#import <CrashReporter/CrashReporter.h>

#define DataIssueReportDir [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex: 0] stringByAppendingPathComponent: @"DataIssueReports"]
#define DataIssueReport     @"DataIssueReport"

@implementation CrashReporter

static CrashReporter *sharedInstance = nil;

+ (CrashReporter *) sharedCrashReporter{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if(!sharedInstance) {
            sharedInstance = [[self alloc] init];
        }
    });
    return sharedInstance;
    
}

- (void)enableTKCrashReporter {
    PLCrashReporter *crashReporter = [PLCrashReporter sharedReporter];
    NSError *error;
    // Enable the Crash Reporter
    if (![crashReporter enableCrashReporterAndReturnError: &error])
        NSLog(@"Warning: Could not enable crash reporter: %@", error);
}

- (void)handleTKCrashReporter:(UIViewController *)mailPresentViewController{
    
    PLCrashReporter *crashReporter = [PLCrashReporter sharedReporter];
    // Check if we previously crashed
    if ([crashReporter hasPendingCrashReport] || [self hasPendingDataIssue])
        [self handleCrashReport];
    
}

- (BOOL)hasPendingDataIssue{
    NSString * dataIssueReportPath = [DataIssueReportDir stringByAppendingPathComponent:DataIssueReport];
    return [[NSFileManager defaultManager] fileExistsAtPath:dataIssueReportPath];
}

- (void) handleCrashReport {
    PLCrashReporter *crashReporter = [PLCrashReporter sharedReporter];
    NSData *crashData;
    NSError *error;
    // Try loading the crash report
    crashData = [crashReporter loadPendingCrashReportDataAndReturnError: &error];
    if (nil == crashData) {
        crashData = [self loadPendingDataIssue];
    }
    if (crashData != nil) {
        [self performSelectorOnMainThread:@selector(askSendingReportOnMain) withObject:nil waitUntilDone:YES];
    }
}

- (NSData *)loadPendingDataIssue{
    NSString * dataIssueReportPath = [DataIssueReportDir stringByAppendingPathComponent:DataIssueReport];
    if ([[NSFileManager defaultManager] fileExistsAtPath:dataIssueReportPath]) {
        return [NSData dataWithContentsOfFile:dataIssueReportPath];
    } else {
        return nil;
    }
}

#pragma mark - Private API
- (void)askSendingReportOnMain{
    if (YES == [MFMailComposeViewController canSendMail]) {
        NSLog(@"App Abort");
        
        PLCrashReporter *crashReporter = [PLCrashReporter sharedReporter];
        BOOL isCrashRepot = [crashReporter hasPendingCrashReport];
        // Check if we previously crashed
        if (isCrashRepot) {
            
        }
    }
}

@end
