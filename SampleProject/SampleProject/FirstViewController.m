//
//  FirstViewController.m
//  SampleProject
//
//  Created by Pollfish Inc. on 11/3/15.
//  Copyright © 2015 POLLFISH. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pollfishNotAvailable) name:@"PollfishSurveyNotAvailable" object:nil];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pollfishOpened) name:@"PollfishOpened" object:nil];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pollfishClosed) name:@"PollfishClosed" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pollfishUsernotEligible) name:@"PollfishUserNotEligible" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pollfishCompleted:) name:@"PollfishSurveyCompleted" object:nil];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pollfishReceived:) name:@"PollfishSurveyReceived" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pollfishUserRejectedSurvey) name:@"PollfishUserRejectedSurvey" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appRotated) name:UIDeviceOrientationDidChangeNotification object:nil];

#if __has_include(<AppTrackingTransparency/AppTrackingTransparency.h>)
    // Check iOS Version
    if (@available(iOS 14, *)) {

        // Request for IDFA permission through ATTracingManager
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                // Check if permission is granted
                if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
                    [self initPollfish];
                } else {
                    [self showNoPermissionAlert];
                }
                
            });
            
          }];
        
    } else {
        [self initPollfish];
    }
#else
    [self initPollfish];
#endif
    
    _loggingLabel.text=@"Logging area..";

}

- (void)initPollfish {
    PollfishParams *pollfishParams =  [PollfishParams initWith:^(PollfishParams *pollfishParams) {
        
        pollfishParams.indicatorPosition=PollFishPositionMiddleRight;
        pollfishParams.indicatorPadding=10;
        pollfishParams.releaseMode=false;
        pollfishParams.offerwallMode= false;
        pollfishParams.rewardMode=false;
        pollfishParams.requestUUID=@"my_id";
    }];
    
    [Pollfish initWithAPIKey:@"af89aaf1-b7d4-46c1-8e91-b2625c2d5dbe" andParams:pollfishParams];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter]  removeObserver: self];
}


// if you support different orientations you should re-init Pollfish on every rotation change

-(void) appRotated{
    _loggingLabel.text=@"Logging area..";
    
    // Pollfish re-init
}



- (IBAction)showPollfish:(id)sender {
    
    NSLog(@"Pollfish: showPollfish");
    
    [Pollfish show];
    
}

- (IBAction)hidePollfish:(id)sender {
    
    NSLog(@"Pollfish: hidePollfish");
    
    [Pollfish hide];
}

- (void)pollfishReceived:(NSNotification *)notification
{
    int surveyPrice = [[[notification userInfo] valueForKey:@"survey_cpa"] intValue];
    int surveyIR = [[[notification userInfo] valueForKey:@"survey_ir"] intValue];
    int surveyLOI = [[[notification userInfo] valueForKey:@"survey_loi"] intValue];
    
    NSString *surveyClass =[[notification userInfo] valueForKey:@"survey_class"];
    
    NSString *rewardName = [[notification userInfo] valueForKey:@"reward_name"];
    int rewardValue = [[[notification userInfo] valueForKey:@"reward_value"] intValue];
    
    
    NSLog(@"Pollfish: Survey Received - SurveyPrice:%d andSurveyIR: %d andSurveyLOI:%d andSurveyClass:%@ andRewardName:%@ andRewardValue:%d", surveyPrice,surveyIR, surveyLOI, surveyClass, rewardName, rewardValue);
    
    _loggingLabel.text=@"Pollfish - Survey Received";
}


- (void)pollfishCompleted:(NSNotification *)notification
{
    int surveyPrice = [[[notification userInfo] valueForKey:@"survey_cpa"] intValue];
    int surveyIR = [[[notification userInfo] valueForKey:@"survey_ir"] intValue];
    int surveyLOI = [[[notification userInfo] valueForKey:@"survey_loi"] intValue];
    
    NSString *surveyClass =[[notification userInfo] valueForKey:@"survey_class"];
    
    NSString *rewardName = [[notification userInfo] valueForKey:@"reward_name"];
    int rewardValue = [[[notification userInfo] valueForKey:@"reward_value"] intValue];
    
    
    NSLog(@"Pollfish: Survey Completed - SurveyPrice:%d andSurveyIR: %d andSurveyLOI:%d andSurveyClass:%@ andRewardName:%@ andRewardValue:%d", surveyPrice,surveyIR, surveyLOI, surveyClass, rewardName, rewardValue);
    
    _loggingLabel.text=@"Pollfish - Survey Completed";
}


- (void)pollfishOpened
{
    NSLog(@"Pollfish: Survey Opened");
    
    
    _loggingLabel.text=@"Pollfish - Survey Panel Opened";
}

- (void)pollfishClosed
{
    NSLog(@"Pollfish: Survey Closed");
    
    
    _loggingLabel.text=@"Pollfish - Survey Panel Closed";
}

- (void)pollfishNotAvailable
{
    NSLog(@"Pollfish: Survey Not Available");
    
    
    _loggingLabel.text=@"Pollfish - Survey Not Available";
}

- (void) pollfishUserRejectedSurvey
{
    NSLog(@"Pollfish: User Rejected Survey");
    
    
    _loggingLabel.text=@"Pollfish - User Rejected Survey";
}


- (void)pollfishUsernotEligible
{
    NSLog(@"Pollfish: User Not Eligible");
    
    _loggingLabel.text=@"Pollfish - User Not Eligible";
}


@end
