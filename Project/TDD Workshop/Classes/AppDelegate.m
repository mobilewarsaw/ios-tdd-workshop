//
//  AppDelegate.m
//  TDD Workshop
//
//  Created by Pawel Dudek on 20/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+TDDWorkshop.h"
#import <Parse/Parse.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self modifyAppearance];
    [self setupParseWithOptions:launchOptions];
    return YES;
}

- (void)setupParseWithOptions:(NSDictionary *)launchOptions {
    [Parse setApplicationId:@"9vGduDxHcWaNK0HnFPLEpws7V8ShgxrWIvigOKMQ"
                  clientKey:@"fbcn6K0CFiFWnHIbTAj9TY3FALUBsPFsn5V1FI8W"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
}

- (void)modifyAppearance {
    UIColor *workshopBackgroundColor = [UIColor barsBackgroundTintColor];
    UIColor *tintColor = [UIColor textColor];
    [[UINavigationBar appearance] setBarTintColor:workshopBackgroundColor];
    [[UINavigationBar appearance] setTintColor:tintColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : tintColor}];

    [[UITabBar appearance] setBarTintColor:workshopBackgroundColor];
    [[UITabBar appearance] setTintColor:tintColor];

    [[UIRefreshControl appearance] setTintColor:tintColor];
}

@end
