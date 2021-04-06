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
    
    PollfishParams *pollfishParams = [[PollfishParams alloc] init:@"YOUR_API_KEY"];
    [pollfishParams releaseMode:false];
    [pollfishParams offerwallMode:false];
    [pollfishParams rewardMode:true];
    [pollfishParams requestUUID:@"my_id"];
    
    [Pollfish initWith:pollfishParams delegate:self];
    
    _incentivizeBtn.hidden=true;
    _loggingLabel.text=@"Logging area..";
}

- (void)pollfishSurveyReceivedWithSurveyInfo:(SurveyInfo *)surveyInfo
{
    
    int surveyPrice = [[surveyInfo cpa] intValue];
    int surveyIR = [[surveyInfo ir] intValue];
    int surveyLOI = [[surveyInfo loi] intValue];
    
    NSString *surveyClass = [surveyInfo surveyClass];
    
    NSString *rewardName = [surveyInfo rewardName];
    int rewardValue = [[surveyInfo rewardValue] intValue];
    
    NSLog(@"Pollfish: Survey Completed - SurveyPrice:%d andSurveyIR: %d andSurveyLOI:%d andSurveyClass:%@ andRewardName:%@ andRewardValue:%d", surveyPrice,surveyIR, surveyLOI, surveyClass, rewardName, rewardValue);
    
    [_incentivizeBtn setTitle:[NSString stringWithFormat:@"Win %d %@ by completing a survey",rewardValue, rewardName] forState:UIControlStateNormal];

    _incentivizeBtn.hidden=false;
    
    _loggingLabel.text=[NSString stringWithFormat:@"Pollfish: Survey Received - SurveyPrice:%d andSurveyIR: %d andSurveyLOI:%d andSurveyClass:%@ andRewardName:%@ andRewardValue:%d", surveyPrice,surveyIR, surveyLOI, surveyClass, rewardName, rewardValue];
}

- (void)pollfishSurveyCompletedWithSurveyInfo:(SurveyInfo *)surveyInfo
{
    int surveyPrice = [[surveyInfo cpa] intValue];
    int surveyIR = [[surveyInfo ir] intValue];
    int surveyLOI = [[surveyInfo loi] intValue];
    
    NSString *surveyClass = [surveyInfo surveyClass];
    
    NSString *rewardName = [surveyInfo rewardName];
    int rewardValue = [[surveyInfo rewardValue] intValue];
    
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

@end
