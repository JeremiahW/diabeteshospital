//
//  DoctorTableViewController.h
//  diabeteshospital
//
//  Created by Wang Jixiao on 6/18/14.
//  Copyright (c) 2014 diabeteshospital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorTableViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) NSMutableArray *Doctors;

@end
