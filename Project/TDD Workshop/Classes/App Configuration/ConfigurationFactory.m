//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "ConfigurationFactory.h"
#import "Configuration.h"
#import "CracowConfiguration.h"


@interface ConfigurationFactory ()
@property(nonatomic, strong) NSString *mappingKey;
@property(nonatomic, strong) NSDictionary *configurationMapping;
@end

@implementation ConfigurationFactory

#pragma mark - Object life cycle

- (id)init {
    self = [super init];
    if (self) {
        self.mappingKey = [[NSBundle mainBundle] bundleIdentifier];
        self.configurationMapping = @{
            @"com.mobile-warsaw.TDD-Workshop" : [CracowConfiguration class]
        };
    }
    return self;
}

#pragma mark - Public methods

- (id <Configuration>)applicationConfiguration {
    return [self.configurationMapping[self.mappingKey] new];
}

@end