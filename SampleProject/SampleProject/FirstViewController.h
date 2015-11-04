//
//  FirstViewController.h
//  SampleProject
//
//  Created by Pollfish Inc. on 11/3/15.
//  Copyright © 2015 POLLFISH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Pollfish/Pollfish.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *loggingLabel;

- (IBAction)showPollfish:(id)sender;
- (IBAction)hidePollfish:(id)sender;

@end

