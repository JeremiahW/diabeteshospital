//
//  RegisterViewController.m
//  diabeteshospital
//
//  Created by Wang Jixiao on 14-6-16.
//  Copyright (c) 2014年 diabeteshospital. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterDetailsViewController.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize TxtRegName;
@synthesize TxtAuthCode;
@synthesize TxtPwdConfirm;
@synthesize TxtPwd;
 
-(IBAction)BtnShowDetails:(id)sender
{
    if([self AllowSubmit])
    {
        @try {
            RegisterDetailsViewController *regView = [[RegisterDetailsViewController alloc] initWithNibName:@"RegisterDetailsViewController" bundle:nil];
        
            regView.RegName = TxtRegName.text;
            regView.AuthCode = TxtAuthCode.text;
            regView.Password = TxtPwd.text;
        
            [self.navigationController pushViewController:regView animated:YES];
        }
        @catch (NSException *exception) {
            NSLog(@"%@%@", [exception name], [exception reason]);
        }
        @finally {
        }
    }
    


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
    [super viewDidLoad];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(BtnShowDetails:)];
    
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


-(BOOL)AllowSubmit{
    BOOL allowSubmit = YES;
    
    if([TxtRegName.text isEqualToString:@""])
    {
        allowSubmit = NO;
    }
    
    if(![TxtPwd.text isEqualToString:TxtPwdConfirm.text])
    {
        allowSubmit = NO;
    }
    
    return allowSubmit;

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
