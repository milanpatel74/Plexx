//
//  QuestionDisplayViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 6/2/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "QuestionDisplayViewController.h"
#import "QuestionCell.h"

@interface QuestionDisplayViewController ()

@end

@implementation QuestionDisplayViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize questionsArray;
@synthesize answersArray;
//@synthesize cellArray;

//++++++++++++++++++++++ cellArray ++++++++++++++++++++++
static NSMutableArray* cellArray = nil;

+ (NSMutableArray*) cellArray
{
    @synchronized([QuestionDisplayViewController class])
    {
        if (cellArray == nil)
        {
            cellArray = [[NSMutableArray alloc] init];
        }
    }
    return cellArray;
}

+ (void) setCellArray:(NSMutableArray *)newArray
{
    @synchronized([QuestionDisplayViewController class])
    {
        cellArray = [newArray mutableCopy];
    }
}
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    cellArray = [[NSMutableArray alloc] init];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [questionsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@">>> %i <<<.>>>> %i",[[QuestionDisplayViewController cellArray] count], indexPath.row );
    if ([[QuestionDisplayViewController cellArray] count]  == [questionsArray count]) {
        NSLog(@">>>>>>>>>>>>>>>>>>> INSIDE");
        return [[QuestionDisplayViewController cellArray] objectAtIndex:indexPath.row];
    }
    
    static NSString *CellIdentifier = @"QuestionCell";
    QuestionCell *questionCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // Configure the cell...
    
    NSString *questionText = [questionsArray objectAtIndex:indexPath.row];

    [[questionCell questionLabel] setText:questionText];
    NSArray *answersSpecificArray = [[NSArray alloc] initWithArray:[answersArray objectAtIndex:indexPath.row]];
    int *counters = [answersSpecificArray count];
    
    int boss = [answersSpecificArray objectAtIndex:([answersSpecificArray count]-1)];
    
    //NSLog(@"%i........%@", boss, [answersSpecificArray objectAtIndex:([answersSpecificArray count]-1)]);
    NSString *stringVersion = [answersSpecificArray objectAtIndex:([answersSpecificArray count]-1)];
    //questionCell.answerIndex = stringVersion;

    questionCell.answerIndex = 0;

    questionCell.cellIndex = indexPath.row;
    
    [[questionCell buttonAAttributes] setBackgroundColor:[UIColor clearColor]];
    [[questionCell buttonBAttributes] setBackgroundColor:[UIColor clearColor]];
    [[questionCell buttonCAttributes] setBackgroundColor:[UIColor clearColor]];
    [[questionCell buttonDAttributes] setBackgroundColor:[UIColor clearColor]];
    

    
    //NSLog([NSString stringWithFormat:@"%i", counters]);
   // NSLog(@"/////////////////////////////////////////////");
    for (int index = 0; index < 4; index++) {
       // NSLog(@"###################### %i", index);
        if ([answersSpecificArray count] <= index) {
            if (index == 0) {
                [[questionCell buttonAAttributes] setAlpha:0];
                [[questionCell buttonAAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonAAttributes] setTitle:@"" forState:normal];
                questionCell.buttonABool = NO;
                
                [[questionCell buttonBAttributes] setAlpha:0];
                [[questionCell buttonBAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonBAttributes] setTitle:@"" forState:normal];
                questionCell.buttonBBool = NO;
                
                [[questionCell buttonCAttributes] setAlpha:0];
                [[questionCell buttonCAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonCAttributes] setTitle:@"" forState:normal];
                questionCell.buttonCBool = NO;
                
                [[questionCell buttonDAttributes] setAlpha:0];
                [[questionCell buttonDAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonDAttributes] setTitle:@"" forState:normal];
                questionCell.buttonDBool = NO;
                
                break;

            } else if (index == 1) {
                [[questionCell buttonBAttributes] setAlpha:0];
                [[questionCell buttonBAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonBAttributes] setTitle:@"" forState:normal];
                questionCell.buttonBBool = NO;
                
                [[questionCell buttonCAttributes] setAlpha:0];
                [[questionCell buttonCAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonCAttributes] setTitle:@"" forState:normal];
                questionCell.buttonCBool = NO;
                
                [[questionCell buttonDAttributes] setAlpha:0];
                [[questionCell buttonDAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonDAttributes] setTitle:@"" forState:normal];
                questionCell.buttonDBool = NO;
                
                break;

            } else if (index == 2) {
                [[questionCell buttonCAttributes] setAlpha:0];
                [[questionCell buttonCAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonCAttributes] setTitle:@"" forState:normal];
                questionCell.buttonCBool = NO;
                
                [[questionCell buttonDAttributes] setAlpha:0];
                [[questionCell buttonDAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonDAttributes] setTitle:@"" forState:normal];
                questionCell.buttonDBool = NO;
                
                break;

            } else if (index == 3) {
                [[questionCell buttonDAttributes] setAlpha:0];
                [[questionCell buttonDAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonDAttributes] setTitle:@"" forState:normal];
                questionCell.buttonDBool = NO;
                
                break;

            }
        
        }else{
            if (index == 0 && index < [answersSpecificArray count] - 1) {
                [[questionCell buttonAAttributes] setAlpha:1];
                [[questionCell buttonAAttributes] setUserInteractionEnabled:YES];
                
                questionCell.buttonABool = YES;

                NSString *answerA = [answersSpecificArray objectAtIndex:0];
                [[questionCell buttonAAttributes] setTitle:answerA forState:normal];
                
                //////////////////////////////
                [[questionCell buttonBAttributes] setAlpha:0];
                [[questionCell buttonBAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonBAttributes] setTitle:@"" forState:normal];
                questionCell.buttonBBool = NO;
                
                [[questionCell buttonCAttributes] setAlpha:0];
                [[questionCell buttonCAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonCAttributes] setTitle:@"" forState:normal];
                questionCell.buttonCBool = NO;
                
                [[questionCell buttonDAttributes] setAlpha:0];
                [[questionCell buttonDAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonDAttributes] setTitle:@"" forState:normal];
                questionCell.buttonDBool = NO;
            } else if (index == 1 && index < [answersSpecificArray count] - 1) {
                [[questionCell buttonBAttributes] setAlpha:1];
                [[questionCell buttonBAttributes] setUserInteractionEnabled:YES];
                questionCell.buttonBBool = YES;

                NSString *answerB = [answersSpecificArray objectAtIndex:1];
                [[questionCell buttonBAttributes] setTitle:answerB forState:normal];
                
                //////////////////////////////
                [[questionCell buttonCAttributes] setAlpha:0];
                [[questionCell buttonCAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonCAttributes] setTitle:@"" forState:normal];
                questionCell.buttonCBool = NO;
                
                [[questionCell buttonDAttributes] setAlpha:0];
                [[questionCell buttonDAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonDAttributes] setTitle:@"" forState:normal];
                questionCell.buttonDBool = NO;
                
            } else if (index == 2 && index < [answersSpecificArray count] - 1) {
                [[questionCell buttonCAttributes] setAlpha:1];
                [[questionCell buttonCAttributes] setUserInteractionEnabled:YES];
                questionCell.buttonCBool = YES;

                NSString *answerC = [answersSpecificArray objectAtIndex:2];
                //NSLog(answerC);
                //NSLog(@"2222222222222");
                [[questionCell buttonCAttributes] setTitle:answerC forState:normal];
                
                
                //////////////////////////////
                [[questionCell buttonDAttributes] setAlpha:0];
                [[questionCell buttonDAttributes] setUserInteractionEnabled:NO];
                [[questionCell buttonDAttributes] setTitle:@"" forState:normal];
                questionCell.buttonDBool = NO;

                
            } else if (index == 3 && index < [answersSpecificArray count] - 1) {
                [[questionCell buttonDAttributes] setAlpha:1];
                [[questionCell buttonDAttributes] setUserInteractionEnabled:YES];
                questionCell.buttonDBool = YES;

                NSString *answerD = [answersSpecificArray objectAtIndex:3];
                //NSLog(answerD);
                //NSLog(@"3333333333333333");
                [[questionCell buttonDAttributes] setTitle:answerD forState:normal];
            }
        }
    }
    if ([[QuestionDisplayViewController cellArray] count] <  indexPath.row) {
        [[QuestionDisplayViewController cellArray] addObject:questionCell];
    }
    
    return questionCell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
}

@end
