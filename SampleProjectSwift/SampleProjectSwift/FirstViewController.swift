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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       
        print("viewWillAppear()")
       
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(FirstViewController.pollfishNotAvailable) , name:
            "PollfishSurveyNotAvailable", object: nil)
       
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(FirstViewController.pollfishReceived) , name:
            "PollfishSurveyReceived", object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(FirstViewController.pollfishOpened) , name:
            "PollfishOpened", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(FirstViewController.pollfishClosed) , name:
            "PollfishClosed", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(FirstViewController.pollfishUsernotEligible) , name:
            "PollfishUserNotEligible", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(FirstViewController.pollfishCompleted) , name:
            "PollfishSurveyCompleted", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(FirstViewController.rotateApp) , name:
          UIDeviceOrientationDidChangeNotification, object: nil)
        
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
    
    override func viewWillDisappear(animated:Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear()")
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    @IBAction func showPollfish(sender: AnyObject) {
        print("showPollfish")
        
        Pollfish.show();
    }
    
    @IBAction func hidePollfish(sender: AnyObject) {
        print("hidePollfish")
        
        Pollfish.hide();
    }

}

