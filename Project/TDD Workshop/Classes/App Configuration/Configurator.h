//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>

@protocol Configuration;


@interface Configurator : NSObject
- (void)configureAppUsingConfiguration:(id <Configuration>)configuration launchOptions:(NSDictionary *)launchOptions;
@end