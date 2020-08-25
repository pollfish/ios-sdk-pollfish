//
//  UIViewController+PermissionHelper.swift
//  SampleProjectSwift
//
//  Created by Fotis Mitropoulos on 25/8/20.
//  Copyright © 2020 POLLFISH. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showNoPermissionAlert() {
        let alertController = UIAlertController(title: "Pollfish",
                                                message: "Unfortunately Pollfish cannot proceed without the Tracking Permission. Please go to your Application Settings and enable \"Allow Tracking\".",
                                                preferredStyle: .alert)
        
        let actionClose = UIAlertAction(title: "Close",
                                        style: .default)
        
        let actionGoToSettings = UIAlertAction(title: "Go to Settings", style: .default) { action in
            if #available(iOS 10, *) {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [UIApplication.OpenExternalURLOptionsKey:Any]())
            } else {
                UIApplication.shared.openURL(URL(string: UIApplication.openSettingsURLString)!)
            }
        }
        
        alertController.addAction(actionClose)
        alertController.addAction(actionGoToSettings)
        
        present(alertController, animated: true)
    }
    
}
