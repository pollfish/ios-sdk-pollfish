//
//  UIViewController+PermissionHelper.h
//  SampleProject
//
//  Created by Fotis Mitropoulos on 25/8/20.
//  Copyright © 2020 POLLFISH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AppTrackingTransparency/ATTrackingManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (PermissionExtension)

- (void)requestIDFAPermission:(void (^)(void))permissionGrantedHandler;

@end

NS_ASSUME_NONNULL_END
