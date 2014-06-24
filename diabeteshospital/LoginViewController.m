//
//  LoginViewController.m
//  diabeteshospital
//
//  Created by Wang Jixiao on 14-6-16.
//  Copyright (c) 2014年 diabeteshospital. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

#import "Global.h"

@interface LoginViewController ()



@end

@implementation LoginViewController

@synthesize BtnLogin;
@synthesize ReturnInfoData;
@synthesize TextId;
@synthesize TextPwd;

-(IBAction)BtnSubmitClicked:(id)sender
{
    
    NSString *urlWithParam = [[NSString alloc] initWithFormat:[Global GetLoginURL],TextId.text,TextPwd.text ];
    //encode url
    NSString *urlWithParam2 = [urlWithParam stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    
    NSURL *url = [[NSURL alloc] initWithString:urlWithParam2];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [request setHTTPMethod:@"GET"];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    

    //MainTabBarController *cc = [[MainTabBarController alloc] initWithNibName:@"MainTabBarController" bundle:nil];
   // self.view.window.rootViewController = cc;
    
}
-(IBAction)BtnRegWindow:(id)sender
{
    
    RegisterViewController *regView = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    regView.title = @"用户注册";
    [self.navigationController pushViewController:regView animated:YES];
 }


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(BtnSubmitClicked:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
}

-(void)viewTapped:(UITapGestureRecognizer*)tapGr
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark- NSURLConnectionDelegate 协议方法
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)aResponse{
    NSLog(@"请求成功！");
    ReturnInfoData=[[NSMutableData alloc]init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData*)data{
    [ReturnInfoData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError*)error{
    NSLog(@"didFailWithError");
}

-(void)connectionDidFinishLoading:(NSURLConnection*)connection{
        NSString *asyReturn = [[NSString alloc] initWithData:ReturnInfoData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",asyReturn);
        if([asyReturn isEqualToString:@"func(-1)"])
        {
            UIAlertView * alertA = [[UIAlertView alloc] initWithTitle:@"用户名或密码错误"
                                                    message:@"输入的用户名或者密码错误。"
                                                    delegate:self
                                                    cancelButtonTitle:@"确定"
                                                    otherButtonTitles: nil];
           // [alertA addButtonWithTitle:@"取消"];
            [alertA show];
        }
        else
        {
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            self.view.window.rootViewController = [storyBoard instantiateInitialViewController];
        }
        ReturnInfoData= nil;
 }


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
