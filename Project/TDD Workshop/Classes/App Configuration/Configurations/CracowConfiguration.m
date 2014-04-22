//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "CracowConfiguration.h"


@implementation CracowConfiguration
@synthesize parseApplicationId, parseClientId;

#pragma mark - Object life cycle

- (id)init {
    self = [super init];
    if (self) {
        self.parseApplicationId = @"cahiIRCtRUJ5ZnrqM9zPp60kUHsTf6KMAN1GjdPZ";
        self.parseClientId = @"vXlKFINU4E3KFv8lA1KJgnVVY62dMCvHdAnoiutU";
    }
    return self;
}

@end