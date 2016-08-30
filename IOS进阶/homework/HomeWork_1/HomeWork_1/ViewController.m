//
//  ViewController.m
//  HomeWork_1
//
//  Created by tens04 on 16/8/29.
//  Copyright © 2016年 xuan. All rights reserved.
//

#import "ViewController.h"
#import "Draw.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Draw *draw = [[Draw alloc] initWithFrame:self.view.bounds];
    draw.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:draw];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
