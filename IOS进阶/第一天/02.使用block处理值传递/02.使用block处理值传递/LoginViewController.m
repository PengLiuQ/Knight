//
//  LoginViewController.m
//  02.使用block处理值传递
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 xuan. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    RegistViewController *registV = segue.destinationViewController;
    NSString *userName = @"ddddd";
    NSString *password = @"11111";
    
    [registV loadUserName:userName password:password];
    registV.userBlock = ^(NSString *userName, NSString *password){
        
        self.userName.text = userName;
        self.passWord.text = password;
    };
}
@end
