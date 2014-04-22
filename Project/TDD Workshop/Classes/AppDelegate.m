//
//  AppDelegate.m
//  TDD Workshop
//
//  Created by Pawel Dudek on 20/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+TDDWorkshop.h"
#import "Configurator.h"
#import "ConfigurationFactory.h"
#import <Parse/Parse.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureAppWithLaunchOptions:launchOptions];
    [self modifyAppearance];
    return YES;
}

- (void)configureAppWithLaunchOptions:(NSDictionary *)launchOptions {
    Configurator *configurator = [Configurator new];
    ConfigurationFactory *configurationFactory = [ConfigurationFactory new];
    [configurator configureAppUsingConfiguration:[configurationFactory applicationConfiguration] launchOptions:launchOptions];
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
