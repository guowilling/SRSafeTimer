# SRSafeTimer
A convenient and memory-safe timer.


## APIs

````objc
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
````

## Usage

````objc
#import "SRSafeTimerViewController.h"
#import "SRSafeTimer.h"

@interface SRSafeTimerViewController ()

@property (nonatomic, strong) SRSafeTimer *safeTimer;

@end

@implementation SRSafeTimerViewController

- (void)dealloc {
    [self.safeTimer invalidate]; // it is also ok to invalidate timer here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.safeTimer = [SRSafeTimer sr_safeTimerWithTimeInterval:1.0 repeat:YES handler:^{
        NSLog(@"SRSafeTimer");
    }];
    [self.safeTimer fire];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.safeTimer frozen];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.safeTimer fire];
    });
}
````
