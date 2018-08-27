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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        print("viewWillAppear()")
        
        NotificationCenter.default.addObserver(self, selector:#selector(SecondViewController.pollfishNotAvailable) , name:
            NSNotification.Name(rawValue: "PollfishSurveyNotAvailable"), object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(SecondViewController.pollfishReceived(_:)) , name:
            NSNotification.Name(rawValue: "PollfishSurveyReceived"), object: nil)
        print("viewDidLoad()")
        NotificationCenter.default.addObserver(self, selector:#selector(SecondViewController.pollfishOpened) , name:
            NSNotification.Name(rawValue: "PollfishOpened"), object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(FirstViewController.pollfishUserRejectedSurvey) , name:
            NSNotification.Name(rawValue: "PollfishUserRejectedSurvey"), object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(SecondViewController.pollfishClosed) , name:
            NSNotification.Name(rawValue: "PollfishClosed"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(SecondViewController.pollfishUsernotEligible) , name:
            NSNotification.Name(rawValue: "PollfishUserNotEligible"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(SecondViewController.pollfishCompleted(_:)) , name:
            NSNotification.Name(rawValue: "PollfishSurveyCompleted"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(SecondViewController.rotateApp) , name:
            NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        Pollfish.initAtPosition( Int32(PollfishPosition.PollFishPositionMiddleLeft.rawValue), withPadding: 50, andDeveloperKey: "2ae349ab-30b8-4100-bc4d-b33b82e76519", andDebuggable: true, andCustomMode: true);
        
        Pollfish.hide()
        
        loggingLabel.text="Logging area.."
        incentivizeBtn.isHidden=true
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
    
    func pollfishReceived(_ notification:Notification) {
     
        let tmp : [AnyHashable: Any] = notification.userInfo!
        
        let playfulSurvey = tmp["playfulSurvey"]! as! Bool
        let surveyPrice = tmp["surveyPrice"]!
        
        print("pollfishReceived - Playful Survey: \(playfulSurvey)  and survey Price: \(surveyPrice)")
 
        loggingLabel.text="Pollfish Survey Received -Playful Survey: \(playfulSurvey)  and survey Price: \(surveyPrice)"
        
        incentivizeBtn.isHidden=false
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
    
    
    func pollfishCompleted(_ notification:Notification) {
        
        let tmp : [AnyHashable: Any] = notification.userInfo!
        
        let playfulSurvey = tmp["playfulSurvey"]! as! Bool
        let surveyPrice = tmp["surveyPrice"]!
        
        print("pollfishCompleted - Playful Survey: \(playfulSurvey)  and survey Price: \(surveyPrice)")

        incentivizeBtn.isHidden=true
        
        loggingLabel.text="Pollfish Survey Completed - Congratulations, you have won 200 coins!"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated:Bool) {
        super.viewWillDisappear(animated)
      
        print("viewWillDisappear()")
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func showPollfish(_ sender: AnyObject) {
        print("showPollfish")
        
        Pollfish.show();
    }
    
    func pollfishUserRejectedSurvey() {
        print("pollfishUserRejectedSurvey")
        
        loggingLabel.text="Pollfish - User Rejected Survey"
        
        incentivizeBtn.isHidden=true
        
    }
    
}

