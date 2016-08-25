//
//  ViewController.m
//  Clock
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
    
    CALayer *clock;
    CALayer *hour;
    CALayer *minu;
    CALayer *second;
    NSTimer *timer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    clock = [CALayer layer];
    clock.bounds = CGRectMake(0, 0, 350, 350);
    clock.position = self.view.center;
    clock.anchorPoint = CGPointMake(0.5, 0.5);
//    clock.zPosition = 2;
    clock.contents = (__bridge id _Nullable)([UIImage imageNamed:@"dial"].CGImage);
    [self.view.layer addSublayer:clock];

    hour = [CALayer layer];
    hour.bounds = CGRectMake(0, 0, 27, 120);
    hour.position = self.view.center;
    hour.anchorPoint = CGPointMake(0.5, 1);
//    hour.zPosition = 2;
    hour.contents = (__bridge id _Nullable)([UIImage imageNamed:@"hourHand"].CGImage);
    [self.view.layer addSublayer:hour];
    
    minu = [CALayer layer];
    minu.bounds = CGRectMake(0, 0, 21, 128);
    minu.position = self.view.center;
    minu.anchorPoint = CGPointMake(0.5, 1);
    minu.contents = (__bridge id _Nullable)([UIImage imageNamed:@"minuteHand"].CGImage);
    [self.view.layer addSublayer:minu];
    
    second = [CALayer layer];
    second.bounds = CGRectMake(0, 0, 9, 159);
    second.position = self.view.center;
    second.anchorPoint = CGPointMake(0.5, 1);
    second.contents = (__bridge id _Nullable)([UIImage imageNamed:@"secondHand"].CGImage);
    [self.view.layer addSublayer:second];
    [self updateTime];
    
//    NSDate *date = [[NSDate alloc]init];
//    date.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:+8];
//    NSLog(@"%@",date);
    [self times];
    // Do any additional setup after loading the view, typically from a nib.
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
    
    second.transform = CATransform3DMakeRotation(angle2raditon(secondA), 0, 0, 1);
    minu.transform = CATransform3DMakeRotation(angle2raditon(minuteA), 0, 0, 1);
    hour.transform = CATransform3DMakeRotation(angle2raditon(hourA), 0, 0, 1);
    
}
- (void) updateTime
{
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self
                                           selector:@selector(times)
                                           userInfo: nil
                                            repeats:YES];
}


//- (void)timechange{
//    
//    second.transform = CATransform3DRotate(second.transform, M_PI/30, 0, 0, 1);
//    minu.transform = CATransform3DRotate(minu.transform, M_PI/1800, 0, 0, 1);
//    hour.transform = CATransform3DRotate(hour.transform, M_PI/27000, 0, 0, 1);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
