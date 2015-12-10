//
//  TimerButton.h
//  Stock
//
//  Created by ums on 15/12/8.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerButton : UIButton

+ (instancetype)countTimeWithTotalTime:(NSTimeInterval)totalTime
                          TimeInterval:(NSTimeInterval)seconds
                                 block:(void (^)(void))block;

- (void)fire;

- (void)stop;

@end
