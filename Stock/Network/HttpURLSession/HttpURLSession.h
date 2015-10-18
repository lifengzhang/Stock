//
//  HttpURLSession.h
//  Stock
//
//  Created by apple on 15/10/18.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpURLSession : NSObject

/**
 * 
 The NSURLSession API supports three types of sessions, as determined by the type of configuration object used to create the session:
 
 Default sessions behave similarly to other Foundation methods for downloading URLs. They use a persistent disk-based cache and store credentials in the user’s keychain.
 
 Ephemeral sessions do not store any data to disk; all caches, credential stores, and so on are kept in RAM and tied to the session. Thus, when your app invalidates the session, they are purged automatically.
 
 Background sessions are similar to default sessions, except that a separate process handles all data transfers. Background sessions have some additional limitations.
 */

@property NSURLSession *backgroundSession;
@property NSURLSession *defaultSession;
@property NSURLSession *ephemeralSession;

@end
