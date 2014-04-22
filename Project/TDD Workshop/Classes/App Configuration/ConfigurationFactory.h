//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>

@protocol Configuration;

@interface ConfigurationFactory : NSObject
- (id <Configuration>)applicationConfiguration;
@end