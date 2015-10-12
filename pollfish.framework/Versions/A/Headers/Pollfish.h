//
//  Pollfish.h
//
//  Copyright (c) 2015 Pollfish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserAttributesDictionary.h"

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
 init function enables controlling the behavior of Pollfish in an app from
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
 init function enables controlling the behavior of Pollfish in an app from
 Pollfish panel.
 
 @param pos The Position where you wish to place the PollFishPosition indicator.
 @param margin The margin from top or bottom according to Position of the indicator specified before
 @param key Your Pollfish API Key
 @param isDebuggable Indicates if you are using in Release or Debug mode
 @param isCustomMode Indicates if you are using Pollfish in custom mode
 @param request_uuid  used with postback calls to dev server. Use nil if not provided
 */

+ (void)initAtPosition:(int)pos withPadding:(int)margin andDeveloperKey:(NSString*)key andDebuggable: (BOOL) isDebuggable andCustomMode: (BOOL) isCustomMode andRequestUUID: (NSString *) request_uuid;

/**
 * Used from developer to manually show Pollfish
 */
+ (void)show;


/**
 * Used from developer to manually hide Pollfish
 */
+ (void)hide;


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
 Used to set attributes about a user as received from an app, in order to receive a better fill rate and higher priced surveys. 
 
 @param dict Dictionary of user attributes of type UserAttributesDictionary
 */

+ (void)setAttributeDictionary:(NSMutableDictionary *) dict;


@end


