//
//  SecondViewController.swift
//  SampleProjectSwift
//
//  Created by Pollfish Inc. on 11/4/15.
//  Copyright © 2015 POLLFISH. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var incentivizeBtn: UIButton!
    @IBOutlet weak var loggingLabel: UILabel!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
        print("viewWillAppear()")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(SecondViewController.pollfishNotAvailable) , name:
            "PollfishSurveyNotAvailable", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(SecondViewController.pollfishReceived(_:)) , name:
            "PollfishSurveyReceived", object: nil)
        print("viewDidLoad()")
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(SecondViewController.pollfishOpened) , name:
            "PollfishOpened", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(SecondViewController.pollfishClosed) , name:
            "PollfishClosed", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(SecondViewController.pollfishUsernotEligible) , name:
            "PollfishUserNotEligible", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(SecondViewController.pollfishCompleted(_:)) , name:
            "PollfishSurveyCompleted", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(SecondViewController.rotateApp) , name:
            UIDeviceOrientationDidChangeNotification, object: nil)
        
        Pollfish.initAtPosition( Int32(PollfishPosition.PollFishPositionMiddleLeft.rawValue), withPadding: 50, andDeveloperKey: "2ae349ab-30b8-4100-bc4d-b33b82e76519", andDebuggable: true, andCustomMode: true);
        
        Pollfish.hide()
        
        loggingLabel.text="Logging area.."
        incentivizeBtn.hidden=true
    }
    
    func rotateApp(){
        loggingLabel.text="Logging area.."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        print("viewDidLoad()")
    }
    
    func pollfishNotAvailable() {
        print("pollfishNotAvailable")
        
        loggingLabel.text="Pollfish - Survey Not Available"
    }
    
    func pollfishReceived(notification:NSNotification) {
     
        let tmp : [NSObject : AnyObject] = notification.userInfo!
        
        let playfulSurvey = tmp["playfulSurvey"]! as! Bool
        let surveyPrice = tmp["surveyPrice"]!
        
        print("pollfishReceived - Playful Survey: \(playfulSurvey)  and survey Price: \(surveyPrice)")
 
        loggingLabel.text="Pollfish Survey Received -Playful Survey: \(playfulSurvey)  and survey Price: \(surveyPrice)"
        
        incentivizeBtn.hidden=false
    }
    
    func pollfishOpened() {
        print("pollfishOpened")
        
        loggingLabel.text="Pollfish - Pollfish Panel Opened"
    }
    
    func pollfishClosed() {
        print("pollfishClosed")
        
        //loggingLabel.text="Pollfish - Pollfish Panel Closed"
    }
    
    func pollfishUsernotEligible() {
        print("pollfishUsernotEligible")
        
        loggingLabel.text="Pollfish - User Not Eligible"
    }
    
    
    func pollfishCompleted(notification:NSNotification) {
        
        let tmp : [NSObject : AnyObject] = notification.userInfo!
        
        let playfulSurvey = tmp["playfulSurvey"]! as! Bool
        let surveyPrice = tmp["surveyPrice"]!
        
        print("pollfishCompleted - Playful Survey: \(playfulSurvey)  and survey Price: \(surveyPrice)")

        incentivizeBtn.hidden=true
        
        loggingLabel.text="Pollfish Survey Completed - Congratulations, you have won 200 coins!"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated:Bool) {
        super.viewWillDisappear(animated)
      
        print("viewWillDisappear()")
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    @IBAction func showPollfish(sender: AnyObject) {
        print("showPollfish")
        
        Pollfish.show();
    }
}

