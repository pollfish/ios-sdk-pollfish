//
//  ThirdViewController.m
//  SampleProject
//
//  Created by Pollfish on 12/05/2019.
//  Copyright © 2019 POLLFISH. All rights reserved.
//


#import "ThirdViewController.h"

@interface ThirdViewController()

@end

@implementation ThirdViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (@available(iOS 14, *)) {
        [self requestIDFAPermission];
    } else {
        [self initPollfish];
    }
}

- (void)requestIDFAPermission {
#if __has_include(<AppTrackingTransparency/AppTrackingTransparency.h>)
    [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
      dispatch_async(dispatch_get_main_queue(), ^{
          if (status == ATTrackingManagerAuthorizationStatusAuthorized) {
              [self initPollfish];
          } else {
              [self showNoPermissionAlert];
          }
      });
    }];
#endif
}

- (void) initPollfish{
    
    NSLog(@"Pollfish: init");
    
    PollfishParams *pollfishParams = [[PollfishParams alloc] init:@"af89aaf1-b7d4-46c1-8e91-b2625c2d5dbe"];
    [pollfishParams releaseMode:false];
    [pollfishParams offerwallMode:true];
    [pollfishParams rewardMode:true];
    [pollfishParams requestUUID:@"my_id"];
    
    [Pollfish initWith:pollfishParams delegate:self];
    
    _offerwallBtn.hidden=true;
    _loggingLabel.text=@"Logging area..";
}

- (void)pollfishSurveyReceivedWithSurveyInfo:(SurveyInfo *)surveyInfo
{
    NSLog(@"Pollfish: Survey Received - Offerwall available");
    
    _offerwallBtn.hidden=false;
    _loggingLabel.text=[NSString stringWithFormat:@"Pollfish: Survey Received - Offerwall available"];
}


- (void) pollfishSurveyCompletedWithSurveyInfo:(SurveyInfo *)surveyInfo
{
    int surveyPrice = [[surveyInfo cpa] intValue];
    int surveyIR = [[surveyInfo ir] intValue];
    int surveyLOI = [[surveyInfo loi] intValue];
    
    NSString *surveyClass = [surveyInfo surveyClass];
    
    NSString *rewardName = [surveyInfo rewardName];
    int rewardValue = [[surveyInfo rewardValue] intValue];
    
    NSLog(@"Pollfish: Survey Completed - SurveyPrice:%d andSurveyIR: %d andSurveyLOI:%d andSurveyClass:%@ andRewardName:%@ andRewardValue:%d", surveyPrice,surveyIR, surveyLOI, surveyClass, rewardName, rewardValue);
    
    _loggingLabel.text=[NSString stringWithFormat:@"Pollfish: Survey Completed - SurveyPrice:%d andSurveyIR: %d andSurveyLOI:%d andSurveyClass:%@ andRewardName:%@ andRewardValue:%d", surveyPrice,surveyIR, surveyLOI, surveyClass, rewardName, rewardValue];

    // in a real world app you should wait for s2s callbacks prior rewarding your user
}

- (void)pollfishOpened
{
    NSLog(@"Pollfish: Survey Opened");
    
    _loggingLabel.text=@"Pollfish: Survey Opened";
}

- (void)pollfishClosed
{
    NSLog(@"Pollfish: Survey Closed");
}

- (void)pollfishNotAvailable
{
    NSLog(@"Pollfish: Offerwall Not Available");
    
    _loggingLabel.text=@"Pollfish: Offerwall Not Available";
}

- (void)pollfishUsernotEligible
{
    NSLog(@"Pollfish: User Not Eligible");
    
    _loggingLabel.text=@"Pollfish: User Not Eligible";
}

-(IBAction)showPollfish:(id)sender{
    [Pollfish show];
}

- (void) pollfishUserRejectedSurvey
{
    NSLog(@"Pollfish: User Rejected Survey");
    
    _loggingLabel.text=@"Pollfish: User Rejected Survey";
    _offerwallBtn.hidden=true;
}

@end
