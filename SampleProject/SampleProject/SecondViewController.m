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

    int surveyPrice = [[[notification userInfo] valueForKey:@"survey_cpa"] intValue];
    int surveyIR = [[[notification userInfo] valueForKey:@"survey_ir"] intValue];
    int surveyLOI = [[[notification userInfo] valueForKey:@"survey_loi"] intValue];
    
    NSString *surveyClass =[[notification userInfo] valueForKey:@"survey_class"];
  
    NSLog(@"Pollfish: Survey Completed - SurveyPrice:%d andSurveyIR: %d andSurveyLOI:%d andSurveyClass:%@", surveyPrice,surveyIR, surveyLOI, surveyClass);

    _incentivizeBtn.hidden=true;
    
    _loggingLabel.text=@"Pollfish Survey Completed - Congratulations, you have won 200 coins!";
}

- (void)pollfishReceived:(NSNotification *)notification
{
    
    int surveyPrice = [[[notification userInfo] valueForKey:@"survey_cpa"] intValue];
    int surveyIR = [[[notification userInfo] valueForKey:@"survey_ir"] intValue];
    int surveyLOI = [[[notification userInfo] valueForKey:@"survey_loi"] intValue];
    
    NSString *surveyClass =[[notification userInfo] valueForKey:@"survey_class"];
    
    NSLog(@"Pollfish: Survey Received - SurveyPrice:%d andSurveyIR: %d andSurveyLOI:%d andSurveyClass:%@", surveyPrice,surveyIR, surveyLOI, surveyClass);

    _incentivizeBtn.hidden=false;
    
    _loggingLabel.text=[NSString stringWithFormat:@"Pollfish: Survey Received - SurveyPrice:%d andSurveyIR: %d andSurveyLOI:%d andSurveyClass:%@",surveyPrice,surveyIR, surveyLOI, surveyClass];
    

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


- (void) pollfishUserRejectedSurvey
{
    NSLog(@"Pollfish: User Rejected Survey");
    
    _loggingLabel.text=@"Pollfish - User Rejected Survey";
    
    _incentivizeBtn.hidden=true;

}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter]  removeObserver: self];
}


@end
