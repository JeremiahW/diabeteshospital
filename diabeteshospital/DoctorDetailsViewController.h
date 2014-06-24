//
//  DoctorDetailsViewController.h
//  diabeteshospital
//
//  Created by Wang Jixiao on 14-6-19.
//  Copyright (c) 2014年 diabeteshospital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"

@interface DoctorDetailsViewController : UIViewController

@property(strong, nonatomic) Doctor *Doctor;

@property (strong, nonatomic) IBOutlet UILabel *LblName;

@property (strong, nonatomic) IBOutlet UIImageView *ImagePhoto;

-(IBAction)BtnSubmitReserv:(id)sender;
@end
