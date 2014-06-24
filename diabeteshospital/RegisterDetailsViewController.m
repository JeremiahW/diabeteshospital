//
//  RegisterDetailsViewController.m
//  diabeteshospital
//
//  Created by Wang Jixiao on 14-6-17.
//  Copyright (c) 2014年 diabeteshospital. All rights reserved.
//

#import "RegisterDetailsViewController.h"

@interface RegisterDetailsViewController ()

@end

@implementation RegisterDetailsViewController

@synthesize PickerGender;
@synthesize PickerInsurance;
@synthesize PickerAddress;
@synthesize Genders;
@synthesize InsuranceTypes;
@synthesize TextGender;
@synthesize TextInsuranceType;

@synthesize RegName;
@synthesize Password;
@synthesize AuthCode;

 

-(IBAction)BtnSubmit:(id)sender
{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   [self presentViewController:[board instantiateInitialViewController] animated:YES completion:nil];
    
  
    
   // UIStoryboard *secondStoryboard = [UIStoryboard storyboardWithName:@"SecondStoryboard" bundle:nil];
   // UIViewController *firstVC = [secondStoryboard instantiateViewControllerWithIdentifier:@"firstVC"];
    


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
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"完成注册" style:UIBarButtonItemStylePlain target:self action:@selector(BtnSubmit:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    Genders = [NSMutableArray arrayWithCapacity:2];
    [Genders addObject:@"男"];
    [Genders addObject:@"女"];
    
    InsuranceTypes = [NSMutableArray arrayWithCapacity:2];
    [InsuranceTypes addObject:@"医保大病"];
    [InsuranceTypes addObject:@"个人医保"];
    [InsuranceTypes addObject:@"无"];
    
    PickerGender.hidden = YES;
    PickerInsurance.hidden = YES;
    
    PickerInsurance.dataSource = self;
    PickerInsurance.delegate = self;
    
    TextGender.delegate = self;
    TextInsuranceType.delegate = self;
    
    
    PickerGender.backgroundColor = [UIColor whiteColor];
    PickerInsurance.backgroundColor = [UIColor whiteColor];
    
    
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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView == self.PickerGender)
    {
     return Genders.count;
    }
    else if(pickerView == self.PickerInsurance)
    {
        return InsuranceTypes.count;
    }
    else
    {
        return 1;
    }
   
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(pickerView == self.PickerGender)
    {
        return Genders[row];
    }
    else if(pickerView == self.PickerInsurance)
    {
        return InsuranceTypes[row];
    }
    else
    {
        return @"111";
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView == self.PickerGender)
    {
        TextGender.text = Genders[row];
        PickerGender.hidden = YES;
    }
    else if(pickerView == self.PickerInsurance)
    {
        TextInsuranceType.text = InsuranceTypes[row];
        PickerInsurance.hidden = YES;
    }
    else
    {
        
    }

}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(textField == TextGender)
    {
        [TextGender resignFirstResponder];
        
        PickerGender.hidden = NO;

    }
    else if(textField == TextInsuranceType)
    {
        [TextInsuranceType resignFirstResponder];
       
        PickerInsurance.hidden = NO;
    }
    return NO;
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
