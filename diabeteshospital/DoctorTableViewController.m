//
//  DoctorTableViewController.m
//  diabeteshospital
//
//  Created by Wang Jixiao on 6/18/14.
//  Copyright (c) 2014 diabeteshospital. All rights reserved.
//

#import "DoctorTableViewController.h"
#import "Doctor.h"
#import "DoctorCell.h"
#import "DoctorDetailsViewController.h"//;

@interface DoctorTableViewController ()

@end

@implementation DoctorTableViewController

@synthesize Doctors;

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Doctors = [[NSMutableArray alloc] initWithCapacity:0];
    
    Doctor *doctor = [[Doctor alloc] init];
    doctor.Name = @"王相国";
    doctor.Title = @"内分泌专家";
    doctor.Description = @"专治各种糖尿病病发症";
    doctor.Photo = @"1.jpg";
    [Doctors addObject:doctor];
    
    doctor = [[Doctor alloc] init];
    doctor.Name = @"江吉康";
    doctor.Title = @"内分泌足专家";
    doctor.Description = @"专治各种糖尿病病发症";
    doctor.Photo = @"2.jpg";
    [Doctors addObject:doctor];
    
    doctor = [[Doctor alloc] init];
    doctor.Name = @"王吉晓";
    doctor.Title = @"内分泌足专家";
    doctor.Description = @"专治各种糖尿病病发症";
    doctor.Photo =@"3.jpg";
    [Doctors addObject:doctor];
    
    doctor = [[Doctor alloc] init];
    doctor.Name = @"孙飞";
    doctor.Title = @"眼病专家";
    doctor.Description = @"专治各种糖尿病病发症";
    doctor.Photo =@"4.jpg";
    [Doctors addObject:doctor];
    
    doctor = [[Doctor alloc] init];
    doctor.Name = @"徐鹏";
    doctor.Title = @"什么都会专家";
    doctor.Description = @"专治各种糖尿病病发症";
    doctor.Photo =@"5.jpg";
    [Doctors addObject:doctor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return [self.Doctors count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DoctorCell *cell = (DoctorCell *)[tableView dequeueReusableCellWithIdentifier:@"DoctorCell" forIndexPath:indexPath];
    
    Doctor *doctor = (self.Doctors)[indexPath.row];
    cell.LblName.text = doctor.Name;
    cell.LblTitle.text = doctor.Title;
    cell.LblDesc.text = doctor.Description;
    cell.ImagePhoto.image= [UIImage imageNamed:doctor.Photo];
    cell.ImagePhoto.frame = CGRectMake(0, 0, 80, 80);
   // cell.ImagePhoto.image = [UIImage imageNamed:doctor.Photo];
    cell.ImagePhoto.contentMode = UIViewContentModeScaleAspectFit;
    
    
   // CGRectMake(0, 0, 60, 60);
    return cell;
}
-(void)tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    
    
    
}

 
-(void)tableView:(UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath
{
 
 
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SegueDoctorDetails"]) {
        
          NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        //DoctorCell *doctorCell = (DoctorCell *)[self.tableView cellForRowAtIndexPath:path];
        Doctor *doctor = (self.Doctors)[path.row];
        DoctorDetailsViewController *controller = segue.destinationViewController;
        controller.Doctor = doctor;
        
        @try {
          

        }
        @catch (NSException *exception) {
            NSLog(@"%@,%@", [exception name], [exception reason]);
        }
        @finally {
            
        }
        
              // PlayerDetailsViewController *playerDetailsViewController = [navigationController viewControllers][0];
        // playerDetailsViewController.delegate = self;
    }

    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
