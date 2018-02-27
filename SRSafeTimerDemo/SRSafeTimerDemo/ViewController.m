//
//  ViewController.m
//  SRSafeTimerDemo
//
//  Created by 郭伟林 on 2018/2/9.
//  Copyright © 2018年 SR. All rights reserved.
//

#import "ViewController.h"
#import "NSTimerViewController.h"
#import "SRSafeTimerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)nsTimerAction:(id)sender {
    [self.navigationController pushViewController:[NSTimerViewController new] animated:YES];
}


- (IBAction)srSafeTimerAction:(id)sender {
    [self.navigationController pushViewController:[SRSafeTimerViewController new] animated:YES];
}

@end
