//
//  Pollfish.h
//
//  Copyright (c) 2020 Pollfish. All rights reserved.
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

typedef NS_ENUM(NSInteger, SurveyFormat) {
    SurveyFormatBasic=0,
    SurveyFormatPlayful=1,
    SurveyFormatRandom=2,
    SurveyFormatMediation=3
};

@class PollfishParams;
typedef void(^PollfishParamsBlock)(PollfishParams *pollfishParams);

@interface PollfishParams : NSObject

@property (nonatomic, readwrite) int indicatorPosition;
@property (nonatomic, readwrite) int indicatorPadding;
@property (nonatomic, readwrite) int surveyFormat;
@property (nonatomic, readwrite) BOOL releaseMode;
@property (nonatomic, readwrite) BOOL rewardMode;
@property (nonatomic, readwrite) BOOL offerwallMode;
@property (nonatomic, readwrite, strong) NSString *requestUUID;
@property (nonatomic, readwrite, strong) UIView * pollfishViewContainer;
@property (nonatomic, readwrite, strong) NSMutableDictionary * userAttributes;

+ (instancetype) initWith:(PollfishParamsBlock)block;

@end


@interface Pollfish : NSObject


/**
 Initializes Pollfish within the app. This function requests a new survey
 each time is called, from Pollfish servers.
 
  @param apiKey Your Pollfish API Key
  @param pollfishParams Pollfish panel configuration settings
 
 */

+ (void)initWithAPIKey:(NSString*)apiKey andParams:(PollfishParams *) pollfishParams;

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
 * Check if a Pollfish panel is open
 */
+ (BOOL) isPollfishPanelOpen;

/**
 * Used to explicitly destroy Pollfish object if needed
 * Should be called from UI thread
 */
+ (void)destroy;

@end

