//
//  SRSafeTimerViewController.m
//  SRSafeTimerDemo
//
//  Created by 郭伟林 on 2018/2/27.
//  Copyright © 2018年 SR. All rights reserved.
//

#import "SRSafeTimerViewController.h"
#import "SRSafeTimer.h"

@interface SRSafeTimerViewController ()

@property (nonatomic, strong) SRSafeTimer *safeTimer;

@end

@implementation SRSafeTimerViewController

- (void)dealloc {
    [self.safeTimer invalidate]; // work
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.safeTimer = [SRSafeTimer sr_safeTimerWithTimeInterval:1.0 repeat:YES handler:^{
        NSLog(@"SRSafeTimer");
    }];
    [self.safeTimer fire];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
//    [self.safeTimer invalidate]; // work
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.safeTimer frozen];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.safeTimer fire];
    });
}

@end
