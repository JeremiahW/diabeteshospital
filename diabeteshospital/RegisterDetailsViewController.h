//
//  RegisterDetailsViewController.h
//  diabeteshospital
//
//  Created by Wang Jixiao on 14-6-17.
//  Copyright (c) 2014年 diabeteshospital. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RegisterDetailsViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIPickerView *PickerGender;
@property (strong, nonatomic) IBOutlet UIPickerView *PickerInsurance;
@property (strong, nonatomic) IBOutlet UIPickerView *PickerAddress;

@property (strong, nonatomic) IBOutlet UITextField *TextGender;
@property (strong, nonatomic) IBOutlet UITextField *TextInsuranceType;

-(IBAction)BtnSubmit:(id)sender;

@property(strong, nonatomic) NSMutableArray *Genders;
@property(strong, nonatomic) NSMutableArray *InsuranceTypes;



@property(strong, nonatomic) NSString *RegName;
@property(strong, nonatomic) NSString *AuthCode;
@property(strong, nonatomic) NSString *Password;

@end
