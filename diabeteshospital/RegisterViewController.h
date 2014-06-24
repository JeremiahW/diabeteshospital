//
//  RegisterViewController.h
//  diabeteshospital
//
//  Created by Wang Jixiao on 14-6-16.
//  Copyright (c) 2014年 diabeteshospital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *TxtRegName;
@property (strong, nonatomic) IBOutlet UITextField *TxtAuthCode;
@property (strong, nonatomic) IBOutlet UITextField *TxtPwd;
@property (strong, nonatomic) IBOutlet UITextField *TxtPwdConfirm;

-(IBAction)BtnShowDetails:(id)sender;
@end
