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
    // Do any additional setup after loading the view, typically from a nib.
  

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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rotateApp) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    [Pollfish initAtPosition:PollFishPositionMiddleRight
                 withPadding:0
             andDeveloperKey:@"af89aaf1-b7d4-46c1-8e91-b2625c2d5dbe"
               andDebuggable:true andCustomMode:false];
    
    _loggingLabel.text=@"Logging area..";

}

-(void) rotateApp{
        _loggingLabel.text=@"Logging area..";
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter]  removeObserver: self];
}

- (IBAction)showPollfish:(id)sender {
    
    NSLog(@"Pollfish: showPollfish");
    
    [Pollfish show];
    
}

- (IBAction)hidePollfish:(id)sender {
    
    NSLog(@"Pollfish: hidePollfish");
    
    [Pollfish hide];
}

- (void)pollfishCompleted:(NSNotification *)notification
{
    BOOL playfulSurvey = [[[notification userInfo] valueForKey:@"playfulSurvey"] boolValue];
    
    int surveyPrice = [[[notification userInfo] valueForKey:@"surveyPrice"] intValue];
    
    NSLog(@"Pollfish: Survey Completed - Playful Survey: %@ and survey Price: %d" , playfulSurvey?@"YES":@"NO",surveyPrice);
    
    _loggingLabel.text=@"Pollfish - Survey Completed";
}

- (void)pollfishReceived:(NSNotification *)notification
{
    
    BOOL playfulSurvey = [[[notification userInfo] valueForKey:@"playfulSurvey"] boolValue];
    
    int surveyPrice = [[[notification userInfo] valueForKey:@"surveyPrice"] intValue];
    
    NSLog(@"Pollfish: Survey Received - Playful Survey: %@ and survey Price: %d" , playfulSurvey?@"YES":@"NO",surveyPrice);
    
    _loggingLabel.text=@"Pollfish - Survey Received";
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
