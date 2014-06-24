//
//  BloodGlucoseTableViewController.m
//  diabeteshospital
//
//  Created by Wang Jixiao on 6/19/14.
//  Copyright (c) 2014 diabeteshospital. All rights reserved.
//

#import "BloodGlucoseTableViewController.h"
#import "InputResultViewController.h"
#import "BloodGlucoseChartViewController.h"

@interface BloodGlucoseTableViewController ()<ACNavBarDrawerDelegate>
{
    UIImageView *_plusIV;
    BOOL _isOpen;
    ACNavBarDrawer *_drawerView;
}
@end

@implementation BloodGlucoseTableViewController

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
    
    //** barButton *********************************************************************************
    CGFloat navRightBtn_w = 40.f;
    CGFloat navRightBtn_h = 30.f;
    CGFloat navRightBtn_x = App_Frame_Width - 10.f;
    CGFloat navRightBtn_y = (kTopBarHeight - navRightBtn_h) / 2.f;
    
    UIButton *navRightBtn = [[UIButton alloc] init];
    [navRightBtn setFrame:CGRectMake(navRightBtn_x,
                                     navRightBtn_y,
                                     navRightBtn_w,
                                     navRightBtn_h)];
    
    //-- 按钮上的图片 --------------------------------------------------------------------------------
    CGFloat plusIV_w = 20.f;
    CGFloat plusIV_h = 20.f;
    CGFloat plusIV_x = (navRightBtn.bounds.size.width - plusIV_w) / 2.f;
    CGFloat plusIV_y = (navRightBtn.bounds.size.height - plusIV_h) / 2.f;
    
    _plusIV = [[UIImageView alloc] initWithImage:PNGIMAGE(@"nav_plus")];
    [_plusIV setFrame:CGRectMake(plusIV_x,
                                 plusIV_y,
                                 plusIV_w,
                                 plusIV_h)];
    
    [navRightBtn addSubview:_plusIV];
    
    // 设置按钮点击时调用的方法
    [navRightBtn addTarget:self action:@selector(navPlusBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:navRightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    //-- 按钮信息 -------------------------------------------------------------------------------
    // 就不建数据对象了，第一个为图片名、第二个为按钮名
    NSArray *item_01 = [NSArray arrayWithObjects:@"drawer_msg", @"结果录入", nil];
    NSArray *item_02 = [NSArray arrayWithObjects:@"drawer_msg", @"结果管理", nil];
    NSArray *item_03 = [NSArray arrayWithObjects:@"drawer_msg", @"曲线展示", nil];
    
    
    // 最好是 2-5 个按钮，1个很2，5个以上很丑
    NSArray *allItems = [NSArray arrayWithObjects:item_01,item_02,item_03, nil];
    
    _drawerView = [[ACNavBarDrawer alloc] initWithView:self.view andItemInfoArray:allItems];
    _drawerView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)navPlusBtnPressed:(UIButton *)sender
{
    // 如果是关，则开，反之亦然
    if (_drawerView.isOpen == NO)
    {
        [_drawerView openNavBarDrawer];
    }
    else
    {
        [_drawerView closeNavBarDrawer];
    }
    
    [self rotatePlusIV];
}
#pragma mark - Rotate _plusIV
- (void)rotatePlusIV
{
    // 旋转加号按钮
    float angle = _drawerView.isOpen ? -M_PI_4 : 0.0f;
    [UIView animateWithDuration:0.2f animations:^{
        _plusIV.transform = CGAffineTransformMakeRotation(angle);
    }];
}
#pragma mark - ACNavBarDrawerDelegate

-(void)theBtnPressed:(UIButton *)theBtn
{
    NSInteger btnTag = theBtn.tag;
    
    NSInteger btnNumber = btnTag + 1;
    
    DLog(@"按钮%d被点击", btnNumber);
    
    switch (theBtn.tag)
    {
        case 0:
        {
            InputResultViewController *view = [[InputResultViewController alloc] initWithNibName:@"InputResultViewController" bundle:nil];
            [self.navigationController pushViewController:view animated:YES];
        }
            break;
            
        case 1:
        {
            BloodGlucoseChartViewController *view = [[BloodGlucoseChartViewController alloc] initWithNibName:@"BloodGlucoseChartViewController" bundle:nil];
            [self.navigationController pushViewController:view animated:YES];
            
        }
            break;
            
        case 2:
        {
            
        }
            break;
            
        case 3:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    // 点完按钮，旋回加号图片
    [self rotatePlusIV];
}

-(void)theBGMaskTapped
{
    // 触摸背景遮罩时，需要通过回调，旋回加号图片
    [self rotatePlusIV];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
 
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return 2;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
