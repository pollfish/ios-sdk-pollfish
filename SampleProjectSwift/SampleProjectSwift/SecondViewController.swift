//
//  SecondViewController.swift
//  SampleProjectSwift
//
//  Created by Pollfish Inc. on 11/4/15.
//  Copyright © 2015 POLLFISH. All rights reserved.
//

import UIKit
import Pollfish
#if canImport(AppTrackingTransparency)
import AppTrackingTransparency
#endif

class SecondViewController: UIViewController, PollfishDelegate {

    @IBOutlet weak var incentivizeBtn: UIButton!
    @IBOutlet weak var loggingLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loggingLabel.text="Logging area.."
        incentivizeBtn.isHidden=true
        
        if #available(iOS 14, *) {
            requestIDFAPermission()
        } else {
            pollfishInit()
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
                    self.pollfishInit()
                default:
                    self.showNoPermissionAlert()
                }
            }
        }
        #endif
    }
    
    func pollfishInit(){
        let pollfishParams = PollfishParams("2ae349ab-30b8-4100-bc4d-b33b82e76519")
            .rewardMode(true)
            .releaseMode(false)
            .requestUUID("my_id")
                
        Pollfish.initWith(pollfishParams, delegate: self)
    }
        
    func pollfishSurveyNotAvailable() {
        print("pollfishNotAvailable")
        
        loggingLabel.text="Pollfish - Survey Not Available"
    }
    
    func pollfishSurveyReceived(surveyInfo: SurveyInfo?) {
        let surveyPrice = surveyInfo?.cpa?.intValue
        let surveyIR = surveyInfo?.ir?.intValue
        let surveyLOI = surveyInfo?.loi?.intValue
        let surveyClass = surveyInfo?.surveyClass
        
        let rewardName = surveyInfo?.rewardName
        let rewardValue = surveyInfo?.rewardValue?.intValue
        
        print("Pollfish Survey  Received - SurveyPrice: \(String(describing: surveyPrice)) andSurveyIR: \(String(describing: surveyIR)) andSurveyLOI: \(String(describing: surveyLOI)) andSurveyClass: \(String(describing: surveyClass)) andRewardName: \(String(describing: rewardName)) andRewardValue:\(String(describing: rewardValue))")
        
        loggingLabel.text="Pollfish Survey Received - SurveyPrice: \(surveyPrice ?? 0) andSurveyIR: \(surveyIR ?? 0) andSurveyLOI: \(surveyLOI ?? 0) andSurveyClass: \(surveyClass ?? "") andRewardName: \(rewardName ?? "") andRewardValue:\(rewardValue ?? 0)"
        
        incentivizeBtn.setTitle("Earn \(rewardValue ?? 0) \(rewardName ?? "") by completing a survey"
            , for: UIControl.State.normal)
        
        incentivizeBtn.isHidden=false
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
        incentivizeBtn.isHidden=true
    }
    
    func pollfishUserRejectedSurvey() {
        print("pollfishUserRejectedSurvey")
        
        loggingLabel.text="Pollfish - User Rejected Survey"
        incentivizeBtn.isHidden=true
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

