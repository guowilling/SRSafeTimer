//
//  NSTimerViewController.m
//  SRSafeTimerDemo
//
//  Created by https://github.com/guowilling on 2018/2/27.
//  Copyright © 2018年 SR. All rights reserved.
//

#import "NSTimerViewController.h"

@interface NSTimerViewController ()

@property (nonatomic, strong) NSTimer *nsTimer;

//@property (nonatomic, weak) NSTimer *nsTimer; // weak has the same problem

@end

@implementation NSTimerViewController

- (void)dealloc {
    [self.nsTimer invalidate]; // not work
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.nsTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.nsTimer forMode:NSRunLoopCommonModes];
    
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//    self.nsTimer = timer; // weak has the same problem
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
//    [self.nsTimer invalidate]; // work
}

- (void)timerAction {
    NSLog(@"NSTimer");
}

@end
