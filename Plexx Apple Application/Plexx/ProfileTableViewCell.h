//
//  ProfileTableViewCell.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ProfileTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *companyPicture;
@property (strong, nonatomic) IBOutlet UILabel *jobCategory;
@property (strong, nonatomic) IBOutlet UILabel *jobTitle;
@property (strong, nonatomic) IBOutlet UILabel *companyName;
@property (strong, nonatomic) IBOutlet UILabel *jobLocation;
@property (strong, nonatomic) IBOutlet UILabel *jobSalary;

@property (nonatomic) PFObject *parseObject;
@end
