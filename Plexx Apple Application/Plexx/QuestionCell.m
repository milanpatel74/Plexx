//
//  QuestionCell.m
//  Plexx
//
//  Created by Sheldon Trotman on 6/2/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "QuestionCell.h"
#import "QuestionDisplayViewController.h"

@implementation QuestionCell
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize questionLabel;
@synthesize buttonAAttributes;
@synthesize buttonBAttributes;
@synthesize buttonCAttributes;
@synthesize buttonDAttributes;

@synthesize buttonABool;
@synthesize buttonBBool;
@synthesize buttonCBool;
@synthesize buttonDBool;

@synthesize answerIndex;

@synthesize cellIndex;

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
}


- (IBAction)buttonAAction:(id)sender {
    [[QuestionDisplayViewController cellArray] count];
    QuestionCell *currentCell = [[QuestionDisplayViewController cellArray] objectAtIndex:cellIndex];
    
    UIColor *selected = [UIColor greenColor];
    UIColor *clear = [UIColor clearColor];
    
    [[currentCell buttonAAttributes] setBackgroundColor:selected];
    [buttonAAttributes setBackgroundColor:selected];
    
    [[currentCell buttonBAttributes] setBackgroundColor:clear];
    [buttonBAttributes setBackgroundColor:clear];
    
    [[currentCell buttonCAttributes] setBackgroundColor:clear];
    [buttonCAttributes setBackgroundColor:clear];
    
    [[currentCell buttonDAttributes] setBackgroundColor:clear];
    [buttonDAttributes setBackgroundColor:clear];
    
    //[[QuestionDisplayViewController cellArray] ]
//    [[QuestionDisplayViewController cellArray] insertObject:currentCell atIndex:cellIndex];
    //[[QuestionDisplayViewController cellArray] removeObjectAtIndex: cellIndex+1];
/*
    if (buttonABool) {//&&  [answerIndex isEqualToString:@"0"]) {
        UIColor *selected = [UIColor greenColor];
        UIColor *clear = [UIColor clearColor];
        
    }else {
        UIColor *selected = [UIColor redColor];
        UIColor *clear = [UIColor clearColor];
    }
 */
}

- (IBAction)buttonBAction:(id)sender {
    QuestionCell *currentCell = [[QuestionDisplayViewController cellArray] objectAtIndex:cellIndex];
    
    UIColor *selected = [UIColor greenColor];
    UIColor *clear = [UIColor clearColor];
    
    [[currentCell buttonAAttributes] setBackgroundColor:clear];
    [buttonAAttributes setBackgroundColor:clear];
    
    [[currentCell buttonBAttributes] setBackgroundColor:selected];
    [buttonBAttributes setBackgroundColor:selected];
    
    [[currentCell buttonCAttributes] setBackgroundColor:clear];
    [buttonCAttributes setBackgroundColor:clear];
    
    [[currentCell buttonDAttributes] setBackgroundColor:clear];
    [buttonDAttributes setBackgroundColor:clear];
    
    
//    [[QuestionDisplayViewController cellArray] insertObject:currentCell atIndex:cellIndex];
    //[[QuestionDisplayViewController cellArray] removeObjectAtIndex: cellIndex+1];
/*
    if (buttonBBool) {// &&  [answerIndex isEqualToString:@"1"]) {

        UIColor *selected = [UIColor greenColor];
        UIColor *clear = [UIColor clearColor];
    } else {
        
        UIColor *selected = [UIColor redColor];
        UIColor *clear = [UIColor clearColor];
    }
    */
}
- (IBAction)buttonCAction:(id)sender {
    QuestionCell *currentCell = [[QuestionDisplayViewController cellArray] objectAtIndex:cellIndex];

    UIColor *selected = [UIColor greenColor];
    UIColor *clear = [UIColor clearColor];

    [[currentCell buttonAAttributes] setBackgroundColor:clear];
    [buttonAAttributes setBackgroundColor:clear];
    
    [[currentCell buttonBAttributes] setBackgroundColor:clear];
    [buttonBAttributes setBackgroundColor:clear];
    
    [[currentCell buttonCAttributes] setBackgroundColor:selected];
    [buttonCAttributes setBackgroundColor:selected];
    
    [[currentCell buttonDAttributes] setBackgroundColor:clear];
    [buttonDAttributes setBackgroundColor:clear];

//    [[QuestionDisplayViewController cellArray] insertObject:currentCell atIndex:cellIndex];
    //[[QuestionDisplayViewController cellArray] removeObjectAtIndex: cellIndex+1];
    /*
     if (buttonCBool) {// &&  [answerIndex isEqualToString:@"2"]) {
     UIColor *selected = [UIColor greenColor];
     UIColor *clear = [UIColor clearColor];
     } else {
     UIColor *selected = [UIColor redColor];
     UIColor *clear = [UIColor clearColor];
     }
     */
}

- (IBAction)buttonDAction:(id)sender {
    QuestionCell *currentCell = [[QuestionDisplayViewController cellArray] objectAtIndex:cellIndex];
    
    UIColor *selected = [UIColor greenColor];
    UIColor *clear = [UIColor clearColor];
    
    [[currentCell buttonAAttributes] setBackgroundColor:clear];
    [buttonAAttributes setBackgroundColor:clear];
    
    [[currentCell buttonBAttributes] setBackgroundColor:clear];
    [buttonBAttributes setBackgroundColor:clear];
    
    [[currentCell buttonCAttributes] setBackgroundColor:clear];
    [buttonCAttributes setBackgroundColor:clear];
    
    [[currentCell buttonDAttributes] setBackgroundColor:selected];
    [buttonDAttributes setBackgroundColor:selected];
    
//    [[QuestionDisplayViewController cellArray] insertObject:currentCell atIndex:cellIndex];
    //[[QuestionDisplayViewController cellArray] removeObjectAtIndex: cellIndex+1];
    /*
    if (buttonDBool) {// &&  [answerIndex isEqualToString:@"3"]) {

        UIColor *selected = [UIColor greenColor];
        UIColor *clear = [UIColor clearColor];
    }else{
        UIColor *selected = [UIColor redColor];
        UIColor *clear = [UIColor clearColor];
    }
     */
}
@end
