//
//  TimerButton.m
//  Stock
//
//  Created by ums on 15/12/8.
//  Copyright © 2015年 zlf. All rights reserved.
//

#import "TimerButton.h"

typedef void (^handelBlock)();

@interface TimerButton ()

@property (nonatomic, copy)  handelBlock block;

@property (nonatomic, strong) dispatch_source_t source;

@property (nonatomic, assign) NSTimeInterval totalTime;

@end

@implementation TimerButton

+ (instancetype)countTimeWithTotalTime:(NSTimeInterval)totalTime
                             TimeInterval:(NSTimeInterval)seconds
                                    block:(void (^)(void))block {
    
    TimerButton * timerbutton = [super buttonWithType:UIButtonTypeCustom];
    
    timerbutton.totalTime = totalTime;
    
    [timerbutton createCountTimerWithTimeInterval:seconds block:block];
    
    [timerbutton addTarget:timerbutton action:@selector(fire) forControlEvents:UIControlEventTouchUpInside];
    
    return timerbutton;

}

- (void)createCountTimerWithTimeInterval:(NSTimeInterval)seconds
                                   block:(void (^)(void))block {
    
    self.block = block;

    self.source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,
                                          0, 0,
                                          dispatch_get_main_queue());
    
    uint64_t nsec = (uint64_t)(seconds * NSEC_PER_SEC);
    
    dispatch_source_set_timer(self.source,
                              dispatch_time(DISPATCH_TIME_NOW, nsec),
                              1.0*NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(self.source, block);
    
}

- (void)fire {
    dispatch_resume(self.source);
}

- (void)stop {
    dispatch_suspend(self.source);
}

- (void)dealloc {
    NSLog(@"aaaa");
    dispatch_source_cancel(self.source);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
