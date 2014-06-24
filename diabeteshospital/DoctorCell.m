//
//  DoctorCell.m
//  diabeteshospital
//
//  Created by Wang Jixiao on 6/18/14.
//  Copyright (c) 2014 diabeteshospital. All rights reserved.
//

#import "DoctorCell.h"

@implementation DoctorCell

@synthesize LblName;
@synthesize LblDesc;
@synthesize LblTitle;
@synthesize ImagePhoto;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
