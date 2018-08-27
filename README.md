# Pollfish iOS SDK

![alt tag](https://storage.googleapis.com/pollfish-images/logoHome.png)

[Pollfish](http://www.pollfish.com) is new way of monetizing mobile apps that pays up to 20x more than classic ads. 

Pollfish is a survey platform that delivers surveys instead of ads through mobile apps. Integration of Pollfish SDK takes less than 2 minutes and requires only one line of code. No changes are needed in the UI of the app since everything is displayed as an overlay (see below), while users that respond to surveys, enter into draws and win prizes (happy users)! 

![alt tag](https://storage.googleapis.com/pollfish_production/multimedia/basic_survey.gif)

Minimum revenue for each completed survey through an app is $0.30 and users never leave the app. If no survey is available, nothing is shown to the users, as if Pollfish was never integrated in the app. 

Since Pollfish addresses the market research marketplace, Pollfish surveys can be used along with any ad network you are already using in your app without any problem, just to bring extra revenue! 

[Learn More..](https://www.pollfish.com/publisher/)

**Requirements:** Pollfish framework works with iOS version 7.0 and above.  


## Quick Quide

Though CocoaPods:



* Add a Podfile with Pollfish framework as a pod reference:
```
platform :ios, '9.0'
pod 'Pollfish'
```
* Run 'pod install' on the command line to install the Pollfish cocoapod. 
* Call init and destroy function of Pollfish in the App’s Delegate or within a View Controller
* Set to Release mode and release in AppStore
* Update your privacy policy



or:

* Download Pollfish iOS SDK and unzip it
* Import Pollfish.framework to your project
* Import AdSupport.framework, SystemConfiguration.framework, WebKit.framework and CoreTelephony.framework to your project
* Call init Pollfish in the App’s Delegate or within a View Controller
* Set to Release mode and release in AppStore
* Update your privacy policy

**Note: Be careful to set your app in release mode in the init function prior submitting to AppStore**

## Documentation

You can see a step by step guide on how to integrate at the official [Documentation page](http://www.pollfish.com/docs/ios)

## Pollfish iOS Demo App

Try the look and feel of Pollfish surveys on [Pollfish iOS Demo App](https://itunes.apple.com/us/app/pollfish-chalkboard/id782617904)
