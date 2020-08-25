//
//  SecondViewController.h
//  SampleProject
//
//  Created by Pollfish Inc. on 11/3/15.
//  Copyright © 2015 POLLFISH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Pollfish/Pollfish.h>
#import <AppTrackingTransparency/ATTrackingManager.h>
#import "UIViewController+AlertHelper.h"

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *incentivizeBtn;
@property (weak, nonatomic) IBOutlet UILabel *loggingLabel;

-(IBAction)showPollfish:(id)sender;

@end

