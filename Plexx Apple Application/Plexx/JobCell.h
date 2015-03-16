//
//  JobCell.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobCell : UICollectionViewCell
- (IBAction)jobButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *jobCellTitle;
@property (strong, nonatomic) IBOutlet UILabel *jobCellLocation;
@property (strong, nonatomic) IBOutlet UILabel *jobCellNumberOfSkills;
@property (strong, nonatomic) IBOutlet UIButton *jobButtonAttributes;

@end
