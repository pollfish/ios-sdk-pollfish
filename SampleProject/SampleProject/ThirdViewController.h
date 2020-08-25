//
//  ThirdViewController.h
//  SampleProject
//
//  Created by Pollfish on 12/05/2019.
//  Copyright © 2019 POLLFISH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Pollfish/Pollfish.h>
#if __has_include(<AppTrackingTransparency/AppTrackingTransparency.h>)
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#endif
#import "UIViewController+AlertHelper.h"

@interface ThirdViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *offerwallBtn;
@property (weak, nonatomic) IBOutlet UILabel *loggingLabel;

-(IBAction)showPollfish:(id)sender;

@end
