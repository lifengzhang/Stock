//
//  DeviceInfo.h
//  Stock
//
//  Created by apple on 15/11/30.
//  Copyright © 2015年 zlf. All rights reserved.
//

#ifndef DeviceInfo_h
#define DeviceInfo_h

#define IOS9_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending )
#define IOS8_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )
#define IOS7_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )

#define Is_iPhone       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_iPad         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define IsOniPhone6Plus ([UIScreen mainScreen].bounds.size.height == 736.f)
#define IsOniPhone6     ([UIScreen mainScreen].bounds.size.height == 667.f)
#define IsOniPhone5     ([UIScreen mainScreen].bounds.size.height == 568.f)
#define IsOniPhone4     ([UIScreen mainScreen].bounds.size.height == 480.f)

#endif /* DeviceInfo_h */
