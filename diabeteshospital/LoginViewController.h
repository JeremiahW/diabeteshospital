//
//  LoginViewController.h
//  diabeteshospital
//
//  Created by Wang Jixiao on 14-6-16.
//  Copyright (c) 2014年 diabeteshospital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<NSURLConnectionDelegate>

@property (weak, nonatomic) IBOutlet UIButton *BtnLogin;
@property (strong, nonatomic) IBOutlet UITextField *TextId;
@property (strong, nonatomic) IBOutlet UITextField *TextPwd;

@property(strong,nonatomic) NSMutableData *ReturnInfoData;

-(IBAction)BtnSubmitClicked:(id)sender;
-(IBAction)BtnRegWindow:(id)sender;
@end
