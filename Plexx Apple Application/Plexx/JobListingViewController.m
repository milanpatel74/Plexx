//
//  JobListingViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "JobListingViewController.h"
#import "JobCell.h"

@interface JobListingViewController ()

@end

@implementation JobListingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // Creating 
    JobCell * jobCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"jobCell" forIndexPath:indexPath];
    
    jobCell.jobCellTitle.text = self.dataArray[indexPath.row];
    //jobCell.jobCellLocation.text = @"location %i", indexPath.row;
   // jobCell.jobCellNumberOfSkills.text = @"%i", indexPath.row;

    return jobCell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // source of data
    self.dataArray = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul"
    , @"Aug", @"Sept", @"Oct", @"Nov", @"Dec"];
}



@end
