//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "Configurator.h"
#import "Configuration.h"
#import "Parse.h"


@implementation Configurator

- (void)configureAppUsingConfiguration:(id <Configuration>)configuration launchOptions:(NSDictionary *)launchOptions {
    [Parse setApplicationId:configuration.parseApplicationId
                  clientKey:configuration.parseClientId];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
}

@end