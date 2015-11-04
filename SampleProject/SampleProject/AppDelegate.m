//
//  AppDelegate.m
//  SampleProject
//
//  Created by Pollfish Inc. on 11/3/15.
//  Copyright © 2015 POLLFISH. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [Pollfish initAtPosition:PollFishPositionMiddleRight
                 withPadding:0
             andDeveloperKey:@"af89aaf1-b7d4-46c1-8e91-b2625c2d5dbe"
               andDebuggable:true andCustomMode:false];
    
    // set custom Attributes
    
    UserAttributesDictionary *userAttributesDictionary = [[UserAttributesDictionary alloc] init];
    
    [userAttributesDictionary setAge:AGE(_36)];
    [userAttributesDictionary setGender: GENDER(MALE)];
    [userAttributesDictionary setAgeGroup: AGE_GROUP(_35_44)];
    [userAttributesDictionary setFacebookId:@"facebookId"];
    [userAttributesDictionary setTwitterId:@"twitterId"];
    [userAttributesDictionary setMaritalStatus:MARITAL_STATUS(DIVORCED)];
    
    [userAttributesDictionary setCustomAtributesWithKey:@"PARAM_KEY" andAttrValue: @"PARAM_VALUE"];
    
    [Pollfish setAttributeDictionary:userAttributesDictionary];
    
    // update location
    
    [Pollfish updateLocationWithLatitude:42.682435 andLongitude:-76.376953 andHorizontalAccuracy:3.1];
    
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    [Pollfish destroy];
}

@end
