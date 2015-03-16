//
//  FacebookLoginViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/29/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FacebookLoginViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *facebookWebPage;
- (IBAction)backToPlex:(id)sender;

@end
