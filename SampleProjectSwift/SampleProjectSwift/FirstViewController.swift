//
//  FirstViewController.swift
//  SampleProjectSwift
//
//  Created by Pollfish Inc. on 11/4/15.
//  Copyright © 2015 POLLFISH. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var loggingLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        print("viewWillAppear()")
       
        NotificationCenter.default.addObserver(self, selector:#selector(FirstViewController.pollfishNotAvailable) , name:
            NSNotification.Name(rawValue: "PollfishSurveyNotAvailable"), object: nil)
       
        NotificationCenter.default.addObserver(self, selector:#selector(FirstViewController.pollfishReceived) , name:
            NSNotification.Name(rawValue: "PollfishSurveyReceived"), object: nil)

        NotificationCenter.default.addObserver(self, selector:#selector(FirstViewController.pollfishOpened) , name:
            NSNotification.Name(rawValue: "PollfishOpened"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(FirstViewController.pollfishClosed) , name:
            NSNotification.Name(rawValue: "PollfishClosed"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(FirstViewController.pollfishUsernotEligible) , name:
            NSNotification.Name(rawValue: "PollfishUserNotEligible"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(FirstViewController.pollfishCompleted) , name:
            NSNotification.Name(rawValue: "PollfishSurveyCompleted"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(FirstViewController.rotateApp) , name:
          NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        Pollfish.initAtPosition( Int32(PollfishPosition.PollFishPositionMiddleLeft.rawValue), withPadding: 0, andDeveloperKey: "2ae349ab-30b8-4100-bc4d-b33b82e76519", andDebuggable: true, andCustomMode: false);
        
        loggingLabel.text="Logging area.."
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
    
    func pollfishReceived() {
        print("pollfishReceived")
        
        loggingLabel.text="Pollfish - Survey Received"
    }
    
    func pollfishOpened() {
        print("pollfishOpened")
        
        loggingLabel.text="Pollfish - Pollfish Panel Opened"
    }
    
    func pollfishClosed() {
        print("pollfishClosed")

        loggingLabel.text="Pollfish - Pollfish Panel Closed"
    }
    
    func pollfishUsernotEligible() {
        print("pollfishUsernotEligible")
        
        loggingLabel.text="Pollfish - User Not Eligible"
    }
    
    func pollfishCompleted() {
        print("pollfishCompleted")
        
        loggingLabel.text="Pollfish - Pollfish Survey Completed"
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
    
    @IBAction func hidePollfish(_ sender: AnyObject) {
        print("hidePollfish")
        
        Pollfish.hide();
    }

}

