//
//  DoctorCell.h
//  diabeteshospital
//
//  Created by Wang Jixiao on 6/18/14.
//  Copyright (c) 2014 diabeteshospital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoctorCell : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *LblName;
@property(nonatomic, weak) IBOutlet UILabel *LblTitle;
@property(nonatomic, weak) IBOutlet UITextView *LblDesc;
@property(nonatomic, weak) IBOutlet UIImageView *ImagePhoto;

@end
