//
//  ThirdViewController.swift
//  SampleProjectSwift
//
//  Created by Pollfish on 13/05/2019.
//  Copyright © 2019 POLLFISH. All rights reserved.
//


import UIKit
import Pollfish
#if canImport(AppTrackingTransparency)
import AppTrackingTransparency
#endif

class ThirdViewController: UIViewController, PollfishDelegate {
    
    
    @IBOutlet weak var offerwallBtn: UIButton!
    @IBOutlet weak var loggingLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        loggingLabel.text="Logging area.."
        offerwallBtn.isHidden=true
        
        if #available(iOS 14, *) {
            requestIDFAPermission()
        } else {
            initPollfish()
        }
        
        loggingLabel.text="Logging area.."
    }
    
    @available(iOS 14, *)
    func requestIDFAPermission() {
        #if canImport(AppTrackingTransparency)
        ATTrackingManager.requestTrackingAuthorization { status in
            DispatchQueue.main.async {
                switch status {
                case .authorized:
                    self.initPollfish()
                default:
                    self.showNoPermissionAlert()
                }
            }
        }
        #endif
    }
    
    func initPollfish() {
        let pollfishParams = PollfishParams("YOUR_API_KEY")
            .rewardMode(true)
            .offerwallMode(true)
            .releaseMode(false)
            .requestUUID("my_id")
        
        Pollfish.initWith(pollfishParams, delegate: self)
    }
    
    func pollfishSurveyNotAvailable() {
        print("pollfishNotAvailable")
        
        loggingLabel.text="Pollfish - Survey Not Available"
    }
    
    func pollfishSurveyReceived(surveyInfo: SurveyInfo?) {
        print("Pollfish Survey Received")
        
        loggingLabel.text="Pollfish Survey Received"
        offerwallBtn.isHidden=false
    }
    
    func pollfishOpened() {
        print("pollfishOpened")
        
        loggingLabel.text="Pollfish - Pollfish Panel Opened"
    }
    
    func pollfishClosed() {
        print("pollfishClosed")
    }
    
    func pollfishUserNotEligible() {
        print("pollfishUsernotEligible")
        
        loggingLabel.text="Pollfish - User Not Eligible"
    }
    
    func pollfishSurveyCompleted(surveyInfo: SurveyInfo) {
        let surveyPrice = surveyInfo.cpa?.intValue
        let surveyIR = surveyInfo.ir?.intValue
        let surveyLOI = surveyInfo.loi?.intValue
        let surveyClass = surveyInfo.surveyClass
        
        let rewardName = surveyInfo.rewardName
        let rewardValue = surveyInfo.rewardValue?.intValue
        
        print("Pollfish Survey  Completed - SurveyPrice: \(String(describing: surveyPrice)) andSurveyIR: \(String(describing: surveyIR)) andSurveyLOI: \(String(describing: surveyLOI)) andSurveyClass: \(String(describing: surveyClass)) andRewardName: \(String(describing: rewardName)) andRewardValue:\(String(describing: rewardValue))")
        
        loggingLabel.text="Pollfish Survey Completed - You won \(rewardValue ?? 0) \(rewardName ?? "")"
        
        // in a real world app you should wait for s2s callbacks prior rewarding your user
    }

    @IBAction func showPollfish(_ sender: AnyObject) {
        print("showPollfish")
        
        Pollfish.show()
    }
    
    @IBAction func hidePollfish(_ sender: AnyObject) {
        print("hidePollfish")
        
        Pollfish.hide()
    }
    
}
