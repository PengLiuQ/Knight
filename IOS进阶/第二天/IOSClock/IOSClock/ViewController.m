//
//  ViewController.m
//  IOSClock
//
//  Created by tens04 on 16/8/25.
//  Copyright © 2016年 xuan. All rights reserved.
//

#import "ViewController.h"
//一秒钟秒针转多少度
#define preSecondA 6

//一分钟分针转多少度
#define preMinuteA 6

//一小时时针转多少度
#define preHourA 30

//每分钟时针转多少度
#define preHourMinute 0.5

//每秒钟分针转多少度
#define preMinuteSecond 0.1

#define angle2raditon(a) ((a) / 180.0 * M_PI)

@interface ViewController (){
    
    NSTimer *timer;
}

@property(nonatomic, strong) CALayer *clock;
@property(nonatomic, strong) CALayer *hour;
@property(nonatomic, strong) CALayer *minu;
@property(nonatomic, strong) CALayer *second;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self clock];
    [self.view.layer addSublayer:_clock];
    [self hour];
    [self.view.layer addSublayer:_hour];
    [self minu];
    [self.view.layer addSublayer:_minu];
    [self second];
    [self.view.layer addSublayer:_second];
    [self updateTime];
}

- (CALayer *)clock{
    
    if (!_clock) {
        _clock = [CALayer layer];
        _clock.bounds = CGRectMake(0, 0, 350, 350);
        _clock.position = self.view.center;
        _clock.anchorPoint = CGPointMake(0.5, 0.5);
        //    _clock.zPosition = 2;
        _clock.contents = (__bridge id _Nullable)([UIImage imageNamed:@"dial"].CGImage);
    }
    return _clock;
}

- (CALayer *)hour{
    
    if (!_hour) {
        _hour = [CALayer layer];
        _hour.bounds = CGRectMake(0, 0, 27, 120);
        _hour.position = self.view.center;
        _hour.anchorPoint = CGPointMake(0.5, 1);
        //    _hour.zPosition = 2;
        _hour.contents = (__bridge id _Nullable)([UIImage imageNamed:@"hourHand"].CGImage);
    }
    return _hour;
}

- (CALayer *)minu{
    
    if (!_minu) {
        _minu = [CALayer layer];
        _minu.bounds = CGRectMake(0, 0, 21, 128);
        _minu.position = self.view.center;
        _minu.anchorPoint = CGPointMake(0.5, 1);
        _minu.contents = (__bridge id _Nullable)([UIImage imageNamed:@"minuteHand"].CGImage);

    }
    return _minu;
}

- (CALayer *)second{
    
    if (!_second) {
        _second = [CALayer layer];
        _second.bounds = CGRectMake(0, 0, 9, 159);
        _second.position = self.view.center;
        _second.anchorPoint = CGPointMake(0.5, 1);
        _second.contents = (__bridge id _Nullable)([UIImage imageNamed:@"secondHand"].CGImage);
    }
    return _second;
}
-(void)times{
    
    
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *cmp=[calendar components:NSCalendarUnitSecond|NSCalendarUnitMinute|NSCalendarUnitHour fromDate:[NSDate date]];
    NSInteger seconds=cmp.second;
    NSInteger minutes=cmp.minute;
    NSInteger hours = cmp.hour;
    
    CGFloat secondA=seconds * preSecondA;
    CGFloat minuteA = minutes *preMinuteA + minutes * preMinuteSecond;
    CGFloat hourA = hours *preHourA + minutes *preHourMinute;
    
    _second.transform = CATransform3DMakeRotation(angle2raditon(secondA), 0, 0, 1);
    _minu.transform = CATransform3DMakeRotation(angle2raditon(minuteA), 0, 0, 1);
    _hour.transform = CATransform3DMakeRotation(angle2raditon(hourA), 0, 0, 1);
    
}
- (void) updateTime
{
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self
                                           selector:@selector(times)
                                           userInfo: nil
                                            repeats:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
