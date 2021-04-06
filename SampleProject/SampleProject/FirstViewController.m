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
}

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

- (void)initPollfish {
    PollfishParams *pollfishParams = [[PollfishParams alloc] init:@"YOUR_API_KEY"];
    [pollfishParams indicatorPadding:10];
    [pollfishParams indicatorPosition:IndicatorPositionMiddleRight];
    [pollfishParams releaseMode:false];
    [pollfishParams offerwallMode:false];
    [pollfishParams rewardMode:false];
    [pollfishParams requestUUID:@"my_id"];
    
    [Pollfish initWith:pollfishParams delegate:self];
}

- (IBAction)showPollfish:(id)sender {
    
    NSLog(@"Pollfish: showPollfish");
    
    [Pollfish show];
}

- (IBAction)hidePollfish:(id)sender {
    NSLog(@"Pollfish: hidePollfish");
    
    [Pollfish hide];
}

- (void)pollfishSurveyReceivedWithSurveyInfo:(SurveyInfo *)surveyInfo
{
    int surveyPrice = [[surveyInfo cpa] intValue];
    int surveyIR = [[surveyInfo ir] intValue];
    int surveyLOI = [[surveyInfo loi] intValue];
    
    NSString *surveyClass = [surveyInfo surveyClass];
    
    NSString *rewardName = [surveyInfo rewardName];
    int rewardValue = [[surveyInfo rewardValue] intValue];
    
    NSLog(@"Pollfish: Survey Received - SurveyPrice:%d andSurveyIR: %d andSurveyLOI:%d andSurveyClass:%@ andRewardName:%@ andRewardValue:%d", surveyPrice,surveyIR, surveyLOI, surveyClass, rewardName, rewardValue);
    
    _loggingLabel.text=@"Pollfish - Survey Received";
}

-(void)pollfishSurveyCompletedWithSurveyInfo:(SurveyInfo *)surveyInfo
{
    int surveyPrice = [[surveyInfo cpa] intValue];
    int surveyIR = [[surveyInfo ir] intValue];
    int surveyLOI = [[surveyInfo loi] intValue];
    
    NSString *surveyClass = [surveyInfo surveyClass];
    
    NSString *rewardName = [surveyInfo rewardName];
    int rewardValue = [[surveyInfo rewardValue] intValue];
    
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
