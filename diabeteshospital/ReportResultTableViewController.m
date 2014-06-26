//
//  ReportResultTableViewController.m
//  diabeteshospital
//
//  Created by Wang Jixiao on 6/26/14.
//  Copyright (c) 2014 diabeteshospital. All rights reserved.
//

#import "ReportResultTableViewController.h"
#import "MainTableViewCell.h"
#import "CommandTableViewCell.h"


@interface ReportResultTableViewController ()

@end

@implementation ReportResultTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
     
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDictionary *dic = @{@"Cell": @"MainCell",@"isAttached":@(NO)};
    NSArray * array = @[dic,dic,dic,dic,dic,dic];
    
    self.dataArray = [[NSMutableArray alloc] initWithCapacity:1];
    self.dataArray = [NSMutableArray arrayWithArray:array];
    
    UINib *cellNib = [UINib nibWithNibName:@"MainTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"MainCell"];
    
    UINib *cellNib2 = [UINib nibWithNibName:@"CommandTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib2 forCellReuseIdentifier:@"AttachedCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.dataArray[indexPath.row] objectForKey:@"Cell"] isEqualToString:@"MainCell"])
    {
        
        static NSString *CellIdentifier = @"MainCell";
        
        MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        
        if (cell == nil) {
             cell = [[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
             cell.selectionStyle = UITableViewCellSelectionStyleGray;
            
      
        }
       // cell.Headerphoto.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",indexPath.row%4+1]];
        
        return cell;
        
    }else if([[self.dataArray[indexPath.row] objectForKey:@"Cell"] isEqualToString:@"AttachedCell"]){
        
        static NSString *CellIdentifier = @"AttachedCell";
        
        CommandTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        
        if (cell == nil) {
            cell = [[CommandTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
            
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;
        
    }
    
    return nil;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSIndexPath *path = nil;
    
    if ([[self.dataArray[indexPath.row] objectForKey:@"Cell"] isEqualToString:@"MainCell"]) {
        path = [NSIndexPath indexPathForItem:(indexPath.row+1) inSection:indexPath.section];
    }else{
        path = indexPath;
    }
    
    if ([[self.dataArray[indexPath.row] objectForKey:@"isAttached"] boolValue]) {
        // 关闭附加cell
        NSDictionary * dic = @{@"Cell": @"MainCell",@"isAttached":@(NO)};
        self.dataArray[(path.row-1)] = dic;
        [self.dataArray removeObjectAtIndex:path.row];
        
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[path]  withRowAnimation:UITableViewRowAnimationMiddle];
        [self.tableView endUpdates];
        
    }else{
        // 打开附加cell
        NSDictionary * dic = @{@"Cell": @"MainCell",@"isAttached":@(YES)};
        self.dataArray[(path.row-1)] = dic;
        NSDictionary * addDic = @{@"Cell": @"AttachedCell",@"isAttached":@(YES)};
        [self.dataArray insertObject:addDic atIndex:path.row];
        
        
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationMiddle];
        [self.tableView endUpdates];
        
    }
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.dataArray[indexPath.row] objectForKey:@"Cell"] isEqualToString:@"MainCell"])
    {
        return 80;
    }else{
        return 50;
    }
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
