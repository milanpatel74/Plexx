//
//  EngineeringJobCell.m
//  Plexx
//
//  Created by Sheldon Trotman on 6/6/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "EngineeringJobCell.h"

@implementation EngineeringJobCell
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize companyPicture;
@synthesize jobCategory;
@synthesize jobTitle;
@synthesize companyName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    double redAdjusted = 109/255.0;
    double greenAdjusted = 207/255.0;
    double blueAdjusted = 246/255.0;
    
    UIView *myBackView = [[UIView alloc] initWithFrame:self.frame];
    myBackView.backgroundColor = [UIColor colorWithRed:redAdjusted green:greenAdjusted blue:blueAdjusted alpha:1];
    self.selectedBackgroundView = myBackView;
}

@end
