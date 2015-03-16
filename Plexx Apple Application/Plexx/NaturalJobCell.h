//
//  NaturalJobCell.h
//  Plexx
//
//  Created by Sheldon Trotman on 6/6/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface NaturalJobCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *companyPicture;
@property (strong, nonatomic) IBOutlet UILabel *jobCategory;
@property (strong, nonatomic) IBOutlet UILabel *jobTitle;
@property (strong, nonatomic) IBOutlet UILabel *companyName;

@property (nonatomic) NSString *parseObject;
@end