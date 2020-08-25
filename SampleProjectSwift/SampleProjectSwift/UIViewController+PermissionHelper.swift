//
//  UIViewController+PermissionHelper.swift
//  SampleProjectSwift
//
//  Created by Fotis Mitropoulos on 25/8/20.
//  Copyright © 2020 POLLFISH. All rights reserved.
//

import UIKit
import AppTrackingTransparency

extension UIViewController {
    
    func requestIDFAPermission(permissionGrantedHandler: @escaping () -> ()) {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                DispatchQueue.main.async {
                    switch status {
                    case .authorized:
                        permissionGrantedHandler()
                    default:
                        self.showAlert()
                    }
                }
            }
        } else {
            permissionGrantedHandler()
        }
    }
    
    private func showAlert() {
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
