//
//  UIViewController+AlertHelper.m
//  SampleProject
//
//  Created by Fotis Mitropoulos on 25/8/20.
//  Copyright © 2020 POLLFISH. All rights reserved.
//

#import "UIViewController+AlertHelper.h"

@implementation UIViewController (AlertExtension)

- (void)showNoPermissionAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Pollfish"
                                                                             message:@"Unfortunately Pollfish cannot proceed without the Tracking Permission. Please go to your Application Settings and enable \"Allow Tracking\"."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *actionClose = [UIAlertAction actionWithTitle:@"Close"
                                                          style:UIAlertActionStyleDefault
                                                        handler:nil];
    
    UIAlertAction *actionGoToSettings = [UIAlertAction actionWithTitle:@"Go to Settings"
                                                                 style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction* action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]
                                           options:@{}
                                 completionHandler:nil];
    }];
    
    [alertController addAction:actionClose];
    [alertController addAction:actionGoToSettings];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
