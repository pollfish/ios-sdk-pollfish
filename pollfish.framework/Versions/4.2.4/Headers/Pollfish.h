//
//  Pollfish.h
//
//  Copyright (c) 2016 Pollfish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserAttributesDictionary.h"
#import <CoreLocation/CoreLocation.h>
typedef NS_ENUM(NSInteger, PollfishPosition) {
    PollFishPositionTopLeft,
    PollFishPositionTopRight,
    PollFishPositionBottomLeft,
    PollFishPositionBottomRight,
    PollFishPositionMiddleLeft,
    PollFishPositionMiddleRight
};

@interface Pollfish : NSObject

/**
 Initializes Pollfish within the app. This function requests a new survey
 each time is called, from Pollfish servers.

 Init function is the standard way of using Pollfish in your apps. Using
 init function with custom mode false enables controlling the behavior of Pollfish in an app from
 Pollfish panel.

 @param pos The Position where you wish to place the PollFishPosition indicator.
 @param margin The margin from top or bottom according to Position of the indicator specified before
 @param key Your Pollfish API Key
 @param isDebuggable Indicates if you are using in Release or Debug mode
 @param isCustomMode Indicates if you are using Pollfish in custom mode
 */
+ (void)initAtPosition:(int)pos withPadding:(int)margin andDeveloperKey:(NSString*)key andDebuggable: (BOOL) isDebuggable andCustomMode: (BOOL) isCustomMode;


/**
 Initializes Pollfish within the app. This function requests a new survey
 each time is called, from Pollfish servers.
 
 Init function is the standard way of using Pollfish in your apps. Using
 init function with custom mode false enables controlling the behavior of Pollfish in an app from
 Pollfish panel.
 
 @param pos The Position where you wish to place the PollFishPosition indicator.
 @param margin The margin from top or bottom according to Position of the indicator specified before
 @param key Your Pollfish API Key
 @param isDebuggable Indicates if you are using in Release or Debug mode
 @param isCustomMode Indicates if you are using Pollfish in custom mode
 @param userAttributes Dictionary of user attributes
 */
+ (void)initAtPosition:(int)pos withPadding:(int)margin andDeveloperKey:(NSString*)key andDebuggable: (BOOL) isDebuggable andCustomMode: (BOOL) isCustomMode andUserAttributes: (NSMutableDictionary *) userAttributes;


/**
 Initializes Pollfish within the app. This function requests a new survey
 each time is called, from Pollfish servers.
 
 Init function is the standard way of using Pollfish in your apps. Using
 init function with custom mode false enables controlling the behavior of Pollfish in an app from
 Pollfish panel.
 
 @param pos The Position where you wish to place the PollFishPosition indicator.
 @param margin The margin from top or bottom according to Position of the indicator specified before
 @param key Your Pollfish API Key
 @param isDebuggable Indicates if you are using in Release or Debug mode
 @param isCustomMode Indicates if you are using Pollfish in custom mode
 @param request_uuid  Used with postback calls to dev server. Use nil if not provided
 */

+ (void)initAtPosition:(int)pos withPadding:(int)margin andDeveloperKey:(NSString*)key andDebuggable: (BOOL) isDebuggable andCustomMode: (BOOL) isCustomMode andRequestUUID: (NSString *) request_uuid;

/**
 Initializes Pollfish within the app. This function requests a new survey
 each time is called, from Pollfish servers.
 
 Init function is the standard way of using Pollfish in your apps. Using
 init function with custom mode false enables controlling the behavior of Pollfish in an app from
 Pollfish panel.
 
 @param pos The Position where you wish to place the PollFishPosition indicator.
 @param margin The margin from top or bottom according to Position of the indicator specified before
 @param key Your Pollfish API Key
 @param isDebuggable Indicates if you are using in Release or Debug mode
 @param isCustomMode Indicates if you are using Pollfish in custom mode
 @param request_uuid  Used with postback calls to dev server. Use nil if not provided
 @param userAttributes Dictionary of user attributes
 */

+ (void)initAtPosition:(int)pos withPadding:(int)margin andDeveloperKey:(NSString*)key andDebuggable: (BOOL) isDebuggable andCustomMode: (BOOL) isCustomMode andRequestUUID: (NSString *) request_uuid andUserAttributes: (NSMutableDictionary *) userAttributes;


/**
 * Used from developer to manually show Pollfish
 */
+ (void)show;


/**
 * Used from developer to manually hide Pollfish
 */
+ (void)hide;

/**
 * Check if a Pollfish survey is present on device
 */
+ (BOOL) isPollfishPresent;


/**
 * Used to destroy Pollfish object
 */
+ (void)destroy;

/**
 Updates user location data anytime after initialization to get better fill rate on surveys

 @param lat latitude
 @param lon longitude
 @param acc accuracy
 */
+ (void)updateLocationWithLatitude:(double)lat andLongitude:(double)lon andHorizontalAccuracy:(double)acc;

/**
 Updates user location data anytime after initialization to get better fill rate on surveys

 @param location CLLocation object
 */

+ (void)updateLocationWith:(CLLocation *)location;


/**
 Updates beacon data anytime after initialization to receive beacon enabled surveys
 
 @param beacon CLBeacon object
 */


+ (void)sendBeaconInfo:(CLBeacon *)beacon;


/**
 Used to set attributes about a user as received from an app, in order to receive a better fill rate and higher priced surveys. 
 
 @param dict Dictionary of user attributes of type UserAttributesDictionary
 */

+ (void)setAttributeDictionary:(NSMutableDictionary *) dict DEPRECATED_MSG_ATTRIBUTE("Submit user attributes through the relevant init function");


@end


