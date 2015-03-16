//
//  QuestionCell.h
//  Plexx
//
//  Created by Sheldon Trotman on 6/2/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *questionLabel;

@property (strong, nonatomic) IBOutlet UIButton *buttonAAttributes;
@property (strong, nonatomic) IBOutlet UIButton *buttonBAttributes;
@property (strong, nonatomic) IBOutlet UIButton *buttonCAttributes;
@property (strong, nonatomic) IBOutlet UIButton *buttonDAttributes;

- (IBAction)buttonAAction:(id)sender;
- (IBAction)buttonBAction:(id)sender;
- (IBAction)buttonCAction:(id)sender;
- (IBAction)buttonDAction:(id)sender;

@property (nonatomic) NSString *answerIndex;

@property (nonatomic) BOOL buttonABool;
@property (nonatomic) BOOL buttonBBool;
@property (nonatomic) BOOL buttonCBool;
@property (nonatomic) BOOL buttonDBool;

@property (nonatomic) int cellIndex;
@end
