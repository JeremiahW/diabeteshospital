//
//  BloodGlucoseViewController.h
//  diabeteshospital
//
//  Created by Wang Jixiao on 14-6-19.
//  Copyright (c) 2014年 diabeteshospital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BloodGlucoseViewController : UIViewController

-(IBAction)BtnSegClicked:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *InputView;

@property (strong, nonatomic) IBOutlet UIView *InputMgtView;

@property (strong, nonatomic) IBOutlet UIView *InputChartView;

@end
