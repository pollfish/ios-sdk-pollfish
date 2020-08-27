//
//  SecondViewController.m
//  SampleProject
//
//  Created by Pollfish Inc. on 11/3/15.
//  Copyright © 2015 POLLFISH. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initPollfish) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    // Check iOS Version
    if (@available(iOS 14, *)) {
        
// Check if AppTrackingTransparency framework is included
#if __has_include(<AppTrackingTransparency/AppTrackingTransparency.h>)
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
#else
    [self initPollfish];
#endif
    } else {
        [self initPollfish];
    }

}

- (void)requestIDFAPermission:(void (^)(void))permissionGrantedHandler {
    if (@available(iOS 14, *)) {
        
    } else {
        permissionGrantedHandler();
    }
}

- (void) initPollfish{
    
    [Pollfish destroy];
    
    NSLog(@"Pollfish: init");

    PollfishParams *pollfishParams =  [PollfishParams initWith:^(PollfishParams *pollfishParams) {
        
        pollfishParams.indicatorPosition=PollFishPositionMiddleRight;
        //pollfishParams.indicatorPadding=10;
        pollfishParams.releaseMode= false;
        pollfishParams.offerwallMode= false;
        pollfishParams.rewardMode=true;
        pollfishParams.requestUUID=@"my_id";
    }];
    
    [Pollfish initWithAPIKey:@"af89aaf1-b7d4-46c1-8e91-b2625c2d5dbe" andParams:pollfishParams];
    
    
    _incentivizeBtn.hidden=true;
    _loggingLabel.text=@"Logging area..";
}

- (void)pollfishReceived:(NSNotification *)notification
{
    
    int surveyPrice = [[[notification userInfo] valueForKey:@"survey_cpa"] intValue];
    int surveyIR = [[[notification userInfo] valueForKey:@"survey_ir"] intValue];
    int surveyLOI = [[[notification userInfo] valueForKey:@"survey_loi"] intValue];
    
    NSString *surveyClass =[[notification userInfo] valueForKey:@"survey_class"];
    
    NSString *rewardName = [[notification userInfo] valueForKey:@"reward_name"];
    int rewardValue = [[[notification userInfo] valueForKey:@"reward_value"] intValue];
    
    
    NSLog(@"Pollfish: Survey Completed - SurveyPrice:%d andSurveyIR: %d andSurveyLOI:%d andSurveyClass:%@ andRewardName:%@ andRewardValue:%d", surveyPrice,surveyIR, surveyLOI, surveyClass, rewardName, rewardValue);
    
    [_incentivizeBtn setTitle:[NSString stringWithFormat:@"Win %d %@ by completing a survey",rewardValue, rewardName] forState:UIControlStateNormal];

    _incentivizeBtn.hidden=false;
    
    _loggingLabel.text=[NSString stringWithFormat:@"Pollfish: Survey Received - SurveyPrice:%d andSurveyIR: %d andSurveyLOI:%d andSurveyClass:%@ andRewardName:%@ andRewardValue:%d", surveyPrice,surveyIR, surveyLOI, surveyClass, rewardName, rewardValue];
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
    
    _loggingLabel.text=[NSString stringWithFormat:@"Pollfish: Survey Completed - Congratulations, you have won %d %@", rewardValue, rewardName];
    
    // in a real world app you should wait for s2s callbacks prior rewarding your user
    
    _incentivizeBtn.hidden=true;
}

- (void)pollfishOpened
{
    NSLog(@"Pollfish: Survey Opened");
    
    _loggingLabel.text=@"Pollfish: Survey Opened";
}

- (void)pollfishClosed
{
    NSLog(@"Pollfish: Survey Closed");
    
    // _loggingLabel.text=@"Pollfish: Survey Closed";
}

- (void)pollfishNotAvailable
{
    NSLog(@"Pollfish: Survey Not Available");
    
    _loggingLabel.text=@"Pollfish: Survey Not Available";
    
    _incentivizeBtn.hidden=true;
}

- (void)pollfishUsernotEligible
{
    NSLog(@"Pollfish: User Not Eligible");
    
    _loggingLabel.text=@"Pollfish: User Not Eligible";
    
    _incentivizeBtn.hidden=true;
}

-(IBAction)showPollfish:(id)sender{
    
    [Pollfish show];
}


- (void) pollfishUserRejectedSurvey
{
    NSLog(@"Pollfish: User Rejected Survey");
    
    _loggingLabel.text=@"Pollfish: User Rejected Survey";
    
    _incentivizeBtn.hidden=true;

}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter]  removeObserver: self];
}


@end
