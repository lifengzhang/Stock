//
//  CrashReporter.h
//  Stock
//
//  Created by apple on 15/11/10.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

@interface CrashReporter : NSObject <MFMailComposeViewControllerDelegate>


+ (CrashReporter *) sharedCrashReporter;
- (void)enableTKCrashReporter;
- (void)handleTKCrashReporter:(UIViewController *)mailPresentViewController;
//- (void)saveDataIssue;

@end
