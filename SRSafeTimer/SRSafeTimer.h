//
//  SRSafeTimer.h
//  SRSafeTimerDemo
//
//  Created by 郭伟林 on 2018/2/9.
//  Copyright © 2018年 SR. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^repeatHandlerBlock)(void);

@interface SRSafeTimer : NSObject

/**
 Creates and returns a safe timer with timeInterval, isRepeat and handler which will execute in main queue.
 */
+ (instancetype)sr_safeTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                      repeat:(BOOL)isRepeat
                                     handler:(repeatHandlerBlock)handler;


/**
 Creates and returns a safe timer with timeInterval, isRepeat, queue and handler which will execute in specified queue.
 */
+ (instancetype)sr_safeTimerWithTimeInterval:(NSTimeInterval)timeInterval
                                      repeat:(BOOL)isRepeat
                                       queue:(dispatch_queue_t)queue
                                     handler:(repeatHandlerBlock)handler;

- (void)fire;
- (void)frozen;
- (void)invalidate;

@end
