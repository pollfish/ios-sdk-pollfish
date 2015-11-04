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
    
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initPollfish) name:UIDeviceOrientationDidChangeNotification object:nil];

    [self initPollfish];

}

- (void) initPollfish{
    
    NSLog(@"Pollfish: init");
    
    [Pollfish initAtPosition:PollFishPositionMiddleRight
                 withPadding:0
             andDeveloperKey:@"af89aaf1-b7d4-46c1-8e91-b2625c2d5dbe"
               andDebuggable:true andCustomMode:true];
    
    [Pollfish hide];
    
    _incentivizeBtn.hidden=true;
    _loggingLabel.text=@"Logging area..";
}


- (void)pollfishCompleted:(NSNotification *)notification
{
    BOOL playfulSurvey = [[[notification userInfo] valueForKey:@"playfulSurvey"] boolValue];
    
    int surveyPrice = [[[notification userInfo] valueForKey:@"surveyPrice"] intValue];
    
    NSLog(@"Pollfish: Survey Completed - Playful Survey: %@ and survey Price: %d" , playfulSurvey?@"YES":@"NO",surveyPrice);
  
    _incentivizeBtn.hidden=true;
    
    _loggingLabel.text=@"Pollfish Survey Completed - Congratulations, you have won 200 coins!";
}

- (void)pollfishReceived:(NSNotification *)notification
{
    
    BOOL playfulSurvey = [[[notification userInfo] valueForKey:@"playfulSurvey"] boolValue];
    
    int surveyPrice = [[[notification userInfo] valueForKey:@"surveyPrice"] intValue];
    
    NSLog(@"Pollfish: Survey Received - Playful Survey: %@ and survey Price: %d" , playfulSurvey?@"YES":@"NO",surveyPrice);
  
    _incentivizeBtn.hidden=false;
    
    _loggingLabel.text=[NSString stringWithFormat:@"Pollfish: Survey Received - Playful Survey: %@ and survey Price: %d" , playfulSurvey? @"YES":@"NO",surveyPrice];
    

}

- (void)pollfishOpened
{
    NSLog(@"Pollfish: Survey Opened");
    
     _loggingLabel.text=@"Pollfish Survey Opened";
}

- (void)pollfishClosed
{
    NSLog(@"Pollfish: Survey Closed");
    
   // _loggingLabel.text=@"Pollfish Survey Closed";
}

- (void)pollfishNotAvailable
{
    NSLog(@"Pollfish: Survey Not Available");
    
    _loggingLabel.text=@"Pollfish Survey Not Available";
}

- (void)pollfishUsernotEligible
{
    NSLog(@"Pollfish: User Not Eligible");
    
    _loggingLabel.text=@"Pollfish Survey Not Eligible";
}

-(IBAction)showPollfish:(id)sender{
    
    [Pollfish show];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter]  removeObserver: self];
}


@end
