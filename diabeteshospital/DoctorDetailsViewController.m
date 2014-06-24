//
//  DoctorDetailsViewController.m
//  diabeteshospital
//
//  Created by Wang Jixiao on 14-6-19.
//  Copyright (c) 2014年 diabeteshospital. All rights reserved.
//

#import "DoctorDetailsViewController.h"

@interface DoctorDetailsViewController ()

@end

@implementation DoctorDetailsViewController

@synthesize LblName;
@synthesize ImagePhoto;
@synthesize Doctor;


-(IBAction)BtnSubmitReserv:(id)sender
{

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
    // Do any additional setup after loading the view.
    LblName.text = self.Doctor.Name;
    ImagePhoto.image = [UIImage imageNamed:self.Doctor.Photo];
    //ImagePhoto.frame = CGRectMake(0, 0, 80, 80);
    // cell.ImagePhoto.image = [UIImage imageNamed:doctor.Photo];
    ImagePhoto.contentMode = UIViewContentModeScaleAspectFit;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"确认预约" style:UIBarButtonItemStylePlain target:self action:@selector(BtnSubmitReserv:)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
