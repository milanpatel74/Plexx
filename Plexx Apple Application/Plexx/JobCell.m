//
//  JobCell.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "JobCell.h"

@implementation JobCell
@synthesize jobButtonAttributes;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
     //   [self.jobButtonAttributes setBackgroundColor:[UIColor grayColor]];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)jobButton:(id)sender {
    //[self.jobButtonAttributes setEnabled:YES];
  //  NSLog(@"hello");
    //[self.jobButtonAttributes setEnabled:NO];
   // [self setBackgroundColor:[UIColor redColor]];
    //[self.jobButtonAttributes setBackgroundColor:[UIColor grayColor]];
    //[self.jobButtonAttributes setTintColor:[UIColor redColor]];
    //[self.jobButtonAttributes setAlpha:0];
//    [self.jobButtonAttributes setHighlighted:YES];
}
@end
