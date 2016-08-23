//
//  ViewController.m
//  block(基本使用)
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 xuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
// 使用typedof 定义block 类型： 定义一个名称为SumBlock 类型为void(^)(int, int)
typedef void(^sum_4)(int a, int b) ;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ------------block-------------
    int (^myblock)(int a,int b) = ^(int x,int y){
        
        return x+y;
    };
    
    int sum_1 = myblock(7,8);

    NSLog(@"sum_1 = %d",sum_1);
    
    void (^mblock)(int a) = ^(int a){
        
        NSLog(@"mblock = %d",a);
    };
    mblock(100);
    
    void (^yblock)() = ^{
        
        NSLog(@"这是没有返回值返回参数的block");
    };
    yblock();
    
    // -------------block作为函数、方法的函数-------------
    
    int value_1 = sum_2(myblock);
    int value_2 = sum_2(^int(int a, int b) {
        return 100+200;
    });
    NSLog(@"value_1 = %d , value_2 = %d",value_1,value_2);
    
    
    // ------------调用带有block参数的方法-----------------
    
    [self sum_3:^(int a, int b) {
        NSLog(@"sum_3 = %d",a+b);
    }];
    [self sum_5:^(int a, int b) {
        NSLog(@"sum_5 = %d",a + b);
    }];
     // 使用sum_4 类型定义block 变量
    sum_4 sum_6 = ^(int a , int b){
        NSLog(@"sum_6 = %d",a + b);
    };
}

#pragma mrak block 作为函数参数
int sum_2(int (^sumblock)(int a ,int b)){
    
    return sumblock(30,40);
}

#pragma mark block 作为方法的参数
- (void)sum_3:(void(^)(int a , int b ))sumblock_1{
    
    
    sumblock_1(300,200);
}
//typedef void(^sum_4)(int a, int b);

- (void)sum_5:(sum_4)sumblock{
    
    sumblock(33,22);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
