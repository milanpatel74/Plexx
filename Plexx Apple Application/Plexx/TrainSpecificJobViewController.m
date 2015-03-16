//
//  TrainSpecificJobViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/30/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "TrainSpecificJobViewController.h"
#import "JobSpecificSkillTableCell.h"

@interface TrainSpecificJobViewController ()

@end

@implementation TrainSpecificJobViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize className = _className;
@synthesize parentViewController;
@synthesize selection;
@synthesize objectTable;

- (id)initWithCoder:(NSCoder *)aCoder {
    self = [super initWithCoder:aCoder];
    if (self) {
        // Customize the table
        
        // The className to query on
        self.className = @"Video";
        self.parseClassName = @"Video";
        
        // Uncomment the following line to specify the key of a PFFile on the PFObject to display in the imageView of the default cell style
        // self.imageKey = @"image";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 25;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    objectTable = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
    static NSString *CellIdentifier = @"JobSpecificSkillTableCell";
    
    JobSpecificSkillTableCell *skillCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UIFont *UbuntuBig = [UIFont fontWithName:@"Ubuntu-Medium" size:18.f];
    
    UIFont *UbuntuSmall = [UIFont fontWithName:@"Ubuntu-Medium" size:15];
    
    skillCell.skillName.text = object[@"Name"];
    [skillCell.skillName setFont:UbuntuBig];
    
    skillCell.authorOfSkill.text = object[@"Creator"];
    [skillCell.authorOfSkill setFont:UbuntuSmall];
    
    skillCell.parentViewController = parentViewController;
    [skillCell.jobSkillButton setTitle:@"Test Yourself" forState:normal];
    [[skillCell.jobSkillButton titleLabel] setFont:UbuntuSmall];
    ///
 
//    skillCell.skillName.text = object[@"Name"];
//    skillCell.authorOfSkill.text = object[@"Creator"];
    skillCell.objectBacking = object;

    NSMutableString *linkPrior = [NSMutableString stringWithFormat:@"%@", object[@"Link"]];
    
    NSString* newString = [linkPrior stringByReplacingOccurrencesOfString:@"watch?"
                                                               withString:@""];
    
    NSMutableString *mute = [NSMutableString stringWithFormat:@"%@", newString];
    
    NSString* finalLink = [mute stringByReplacingOccurrencesOfString:@"="
                                                          withString:@"/"];
    
    skillCell.link = finalLink;
    
    [skillCell playVideo:finalLink frame:CGRectMake(0, 0, 145, 115)];
    
    
    //[skillCell.buttonAAttributes setTitle:@"Train Skill" forState:normal];
    
    //[skillCell.buttonBAttributes setTitle:@"Take Test" forState:normal];
    
    [objectTable addObject:object];
    
    
    //NSLog(@"as %@", jobCell.parseObject);
    
    //NSURL *url = [NSURL URLWithString:path];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    //UIImage *img = [[UIImage alloc] initWithData:data cache:NO];
    //CGSize size = img.size;
    
    return skillCell;
}

// Override to customize what kind of query to perform on the class. The default is to query for
// all objects ordered by createdAt descending.
- (PFQuery *)queryForTable {
    PFQuery *query = [PFQuery queryWithClassName:self.className];
    
    // If Pull To Refresh is enabled, query against the network by default.
    if (self.pullToRefreshEnabled) {
        query.cachePolicy = kPFCachePolicyNetworkOnly;
    }
    
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    if (self.objects.count == 0) {
        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    }
    
    [query orderByDescending:@"createdAt"];
    
    return query;
}

#pragma mark - PFQueryTableViewController

- (void)objectsWillLoad {
    [super objectsWillLoad];
    
    // This method is called before a PFQuery is fired to get more objects
}

- (void)objectsDidLoad:(NSError *)error {
    [super objectsDidLoad:error];
    
    // This method is called every time objects are loaded from Parse via the PFQuery
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
    //static NSString *CellIdentifier = @"JobScreenTableCell";
    
    //JobScreenTableCell *jobCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    PFObject *parseObjectForCellSelected = [objectTable objectAtIndex:[indexPath row]];
    
    // NSLog([jobCell.parseObject valueForKey:@"title"]);
    //NSLog(@"%@", [parseObjectForCellSelected objectId]);
    
    ///////////////////////////////
    //[parentViewController selectionMade:parseObjectForCellSelected];
    
    
}

@end
