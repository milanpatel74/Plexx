//
//  HealthTableViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 6/6/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "HealthTableViewController.h"

//#import "ArtsTableViewController.h"

#import "HealthJobCell.h"
//#import "JobScreenViewController.h"

#import "PictureLoader.h"

#import "SpecificJobViewController.h"

@interface HealthTableViewController ()

@end

@implementation HealthTableViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize className = _className;
@synthesize parentViewController;
@synthesize selection;
@synthesize objectTable;
@synthesize categoryFilter;
@synthesize jobsTable;

//JobScreenViewController *parentViewController;

- (id)initWithCoder:(NSCoder *)aCoder {
    self = [super initWithCoder:aCoder];
    if (self) {
        // Customize the table
        
        // The className to query on
        self.className = @"JobsHealth";
        self.parseClassName = @"JobsHealth";
        
        // Uncomment the following line to specify the key of a PFFile on the PFObject to display in the imageView of the default cell style
        // self.imageKey = @"image";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 1000;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    objectTable = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
    static NSString *CellIdentifier = @"HealthJobCell";
    
    HealthJobCell *jobCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //UIImage *companyImage = [PictureLoader requestJobPicture:object[@"category"]];
    //UIImage *companyImage = [PictureLoader requestJobPicture:@"Health Services"];

    UIImage *companyImage = [PictureLoader requestJobPicture:@"Health Services" optionalIndex:indexPath.row];
    
    [jobCell.companyPicture setImage:companyImage];
    
    NSString *nameAndLocation = [NSString stringWithFormat:@"%@ - %@, %@", object[@"company"], object[@"city"], object[@"state"]];
    
    //   NSString *jobSalary = [NSString stringWithFormat:@"$%@", object[@"salary"]];
    // NSString *timeAndSalary = [NSString stringWithFormat:@"%@ ~ %@", object[@"employmentType"], jobSalary];
    
    jobCell.jobCategory.text = object[@"category"];
    jobCell.jobTitle.text = object[@"title"];
    jobCell.companyName.text = nameAndLocation;
    //jobCell.jobSalary.text = object[@"url"];
    
    if (indexPath.row >= [objectTable count]) {
        [objectTable addObject:object];
    }
    
    NSLog(@"HEALTH %i, %i", [objectTable count], indexPath.row);
    
    return jobCell;
}


// Override to customize what kind of query to perform on the class. The default is to query for
// all objects ordered by createdAt descending.
- (PFQuery *)queryForTable {
    NSLog(@"queryForTable----------=================");
    PFQuery *query = [PFQuery queryWithClassName:(id)self.className];
    
    
    //  if (categoryFilter != nil) {
    //    [query whereKey:@"category" equalTo:categoryFilter];
    //}
    // [query whereKey:@"category" equalTo:categoryFilter];
    
    // If Pull To Refresh is enabled, query against the network by default.
    if (self.pullToRefreshEnabled) {
        query.cachePolicy = kPFCachePolicyNetworkOnly;
    }
    
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    if (self.objects.count == 0) {
        //              query.cachePolicy = kPFCachePolicyCacheElseNetwork;
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    [query orderByDescending:@"createdAt"];
    
    return query;
}
/*
 -(void) setImageForCategory:(NSString *) category{
 NSArray *specificCategoryArray = [pictureDictionary valueForKey:[NSString stringWithFormat:@"%@", category]];
 int indexOfImage = [self someRandomNumber:[specificCategoryArray count]];
 NSString *tempPathPicture = [NSString  stringWithFormat:@"%@", [specificCategoryArray objectAtIndex:indexOfImage]];
 [pathPictureArray addObject:tempPathPicture];
 }
 
 -(void) setImage: (NSString *)randomLinkToAdd andAddArrayToDictionary: (NSArray *)arrayToBeAdded toCategory: (NSString *)category{// toCategory:[NSString stringWithFormat:@"%@", object[@"category"]]];
 //toCategory: (NSString *)category{
 //    [self addValueToDictionary:[object[@"category"]];
 /*
 if ([pictureDictionary valueForKey:category] == nil) {
 // No existing array of pictures for this name
 NSArray *newArrayOfImageLinks = [[NSArray alloc] initWithObjects:linkFromParse, nil];
 [pictureDictionary setValue:newArrayOfImageLinks forKey:category];
 }else{
 NSMutableArray *newArrayOfImageLinks = [[NSMutableArray alloc] initWithArray:[pictureDictionary valueForKey:category]];
 [newArrayOfImageLinks addObject:[NSString stringWithFormat:@"%@", linkFromParse]];
 [pictureDictionary setValue:newArrayOfImageLinks forKey:category];
 }
 */
/*
 NSLog(@"&&&&&&&&&&&&&&&&&INDEX %i \n%@", [arrayToBeAdded count], randomLinkToAdd);
 
 [pictureDictionary setValue:arrayToBeAdded forKey:category];
 
 //pathPicture = randomLinkToAdd;
 [pathPictureArray addObject:randomLinkToAdd];
 }
 */
#pragma mark - PFQueryTableViewController

- (void)objectsWillLoad {
    [super objectsWillLoad];
    
    // This method is called before a PFQuery is fired to get more objects
    // Then, elsewhere in your code...
    
    // This method is called every time objects are loaded from Parse via the PFQuery
    
    //NSString *testLink = @"http://www.hrng.ca/Conference2011/images/Event%20Image.jpg";
    //NSURL *url = [NSURL URLWithString:testLink];//[pathPictureArray objectAtIndex:0]];//indexPath.row]];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    //image = [[UIImage alloc] initWithData:data];
}

- (void)objectsDidLoad:(NSError *)error {
    [super objectsDidLoad:error];
    
    // This method gets called twice so checkto see if it went past once already
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    if (indexPath.row < [objectTable count]) {
        PFObject *parseObjectForCellSelected = [objectTable objectAtIndex:[indexPath row]];
        
        [parentViewController selectionMade:parseObjectForCellSelected];
    }
    
}

@end

