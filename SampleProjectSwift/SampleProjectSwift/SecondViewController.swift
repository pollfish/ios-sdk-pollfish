//
//  SecondViewController.swift
//  SampleProjectSwift
//
//  Created by Pollfish Inc. on 11/4/15.
//  Copyright © 2015 POLLFISH. All rights reserved.
//

import UIKit
import AppTrackingTransparency

class SecondViewController: UIViewController {

    @IBOutlet weak var incentivizeBtn: UIButton!
    @IBOutlet weak var loggingLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        print("viewWillAppear()")
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "PollfishSurveyNotAvailable"),
                                               object: nil,
                                               queue: nil,
                                               using:pollfishNotAvailable)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "PollfishUserRejectedSurvey"),
                                               object: nil,
                                               queue: nil,
                                               using:pollfishUserRejectedSurvey)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "PollfishSurveyReceived"),
                                               object: nil,
                                               queue: nil,
                                               using:pollfishReceived)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "PollfishSurveyCompleted"),
                                               object: nil,
                                               queue: nil,
                                               using:pollfishCompleted)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "PollfishOpened"),
                                               object: nil,
                                               queue: nil,
                                               using:pollfishOpened)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "PollfishClosed"),
                                               object: nil,
                                               queue: nil,
                                               using:pollfishClosed)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "PollfishUserNotEligible"),
                                               object: nil,
                                               queue: nil,
                                               using:pollfishUsernotEligible)
        
        loggingLabel.text="Logging area.."
        incentivizeBtn.isHidden=true
        
        if #available(iOS 14, *) {
            requestIDFAPermission()
        } else {
            pollfishInit()
        }
        
    }
    
    @available(iOS 14, *)
    func requestIDFAPermission() {
        ATTrackingManager.requestTrackingAuthorization { status in
            DispatchQueue.main.async {
                switch status {
                case .authorized:
                    self.pollfishInit()
                default:
                    self.showNoPermissionAlert()
                }
            }
        }
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
    
    func pollfishInit(){
        
        Pollfish.destroy();
        
        let pollfishParams = PollfishParams ()
        
        pollfishParams.indicatorPosition=Int32(PollfishPosition.PollFishPositionMiddleRight.rawValue);
        pollfishParams.rewardMode=true;
        pollfishParams.indicatorPadding=10;
        pollfishParams.releaseMode = false;
        pollfishParams.offerwallMode = false;
        pollfishParams.requestUUID="my_id";
        
        Pollfish.initWithAPIKey("2ae349ab-30b8-4100-bc4d-b33b82e76519", andParams: pollfishParams);
    }
    
    
    
    func pollfishNotAvailable(_ notification:Notification) {
        print("pollfishNotAvailable")
        
        loggingLabel.text="Pollfish - Survey Not Available"
    }
    
    
    func pollfishReceived(_ notification:Notification) {
        
        if let userInfo : [AnyHashable: Any] = (notification.userInfo) {
            
            let surveyPrice = userInfo["survey_cpa"]
            let surveyIR =  userInfo["survey_ir"]
            let surveyLOI =  userInfo["survey_loi"]
            let surveyClass =  userInfo["survey_class"]
            
            let rewardName = userInfo["reward_name"]
            let rewardValue = userInfo["reward_value"]
            
            print("Pollfish Survey  Received - SurveyPrice: \(String(describing: surveyPrice)) andSurveyIR: \(String(describing: surveyIR)) andSurveyLOI: \(String(describing: surveyLOI)) andSurveyClass: \(String(describing: surveyClass)) andRewardName: \(String(describing: rewardName)) andRewardValue:\(String(describing: rewardValue))")
            
            loggingLabel.text="Pollfish Survey Received - SurveyPrice: \(String(describing: surveyPrice)) andSurveyIR: \(String(describing: surveyIR)) andSurveyLOI: \(String(describing: surveyLOI)) andSurveyClass: \(String(describing: surveyClass)) andRewardName: \(String(describing: rewardName)) andRewardValue:\(String(describing: rewardValue))"
            
            incentivizeBtn.setTitle("Earn \(rewardValue ?? "") \(rewardName ?? "") by completing a survey"
                , for: UIControl.State.normal)
            
        }else{
            
            print("Pollfish Survey Received")
            
            loggingLabel.text="Pollfish Survey Received"
        }
        
        incentivizeBtn.isHidden=false
    }
    
    func pollfishOpened(_ notification:Notification) {
        print("pollfishOpened")
        
        loggingLabel.text="Pollfish - Pollfish Panel Opened"
    }
    
    func pollfishClosed(_ notification:Notification) {
        print("pollfishClosed")
        
        //loggingLabel.text="Pollfish - Pollfish Panel Closed"
    }
    
    func pollfishUsernotEligible(_ notification:Notification) {
        print("pollfishUsernotEligible")
        
        loggingLabel.text="Pollfish - User Not Eligible"
        
        incentivizeBtn.isHidden=true
    }
    
    func pollfishUserRejectedSurvey(_ notification:Notification) {
        print("pollfishUserRejectedSurvey")
        
        loggingLabel.text="Pollfish - User Rejected Survey"
        
        incentivizeBtn.isHidden=true
    }
    
    
    func pollfishCompleted(_ notification:Notification) {
        
        if let userInfo : [AnyHashable: Any] = (notification.userInfo) {
            
            let surveyPrice = userInfo["survey_cpa"]
            let surveyIR =  userInfo["survey_ir"]
            let surveyLOI =  userInfo["survey_loi"]
            let surveyClass =  userInfo["survey_class"]
            
            let rewardName = userInfo["reward_name"]
            let rewardValue = userInfo["reward_value"]
            
            print("Pollfish Survey  Completed - SurveyPrice: \(String(describing: surveyPrice)) andSurveyIR: \(String(describing: surveyIR)) andSurveyLOI: \(String(describing: surveyLOI)) andSurveyClass: \(String(describing: surveyClass)) andRewardName: \(String(describing: rewardName)) andRewardValue:\(String(describing: rewardValue))")
            
            loggingLabel.text="Pollfish Survey Completed - You won \(rewardValue ?? "") \(rewardName ??  "")"
            
        }else{
            
            print("Pollfish Survey Completed")
            
            loggingLabel.text="Pollfish Survey Completed"
        }
        
        
        // in a real world app you should wait for s2s callbacks prior rewarding your user
        
        incentivizeBtn.isHidden=true
    }
    
    @IBAction func showPollfish(_ sender: AnyObject) {
        print("showPollfish")
        
        Pollfish.show();
    }
    
    @IBAction func hidePollfish(_ sender: AnyObject) {
        print("hidePollfish")
        
        Pollfish.hide();
    }

}

