//
//  ReportResultTableViewController.h
//  diabeteshospital
//
//  Created by Wang Jixiao on 6/26/14.
//  Copyright (c) 2014 diabeteshospital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportResultTableViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@end
