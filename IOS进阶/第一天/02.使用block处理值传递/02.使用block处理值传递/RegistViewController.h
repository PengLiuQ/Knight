//
//  RegistViewController.h
//  02.使用block处理值传递
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 xuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UserInfoBlock)(NSString *userName,NSString *passWord);
@interface RegistViewController : UIViewController


- (void)loadUserName:(NSString *)userName password:(NSString *)password;

@property (nonatomic, copy) UserInfoBlock userBlock;
@end
