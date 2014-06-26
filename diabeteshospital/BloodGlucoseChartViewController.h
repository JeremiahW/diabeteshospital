//
//  BloodGlucoseChartViewController.h
//  diabeteshospital
//
//  Created by Wang Jixiao on 6/24/14.
//  Copyright (c) 2014 diabeteshospital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEMSimpleLineGraphView.h"

@interface BloodGlucoseChartViewController : UIViewController<BEMSimpleLineGraphDelegate>

@property(nonatomic, strong) BEMSimpleLineGraphView *myGraph;
@property (strong, nonatomic) NSMutableArray *ArrayOfValues;
@property (strong, nonatomic) NSMutableArray *ArrayOfDates;

@property (strong, nonatomic) IBOutlet UILabel *labelValues;
@property (strong, nonatomic) IBOutlet UILabel *labelDates;

@end
 