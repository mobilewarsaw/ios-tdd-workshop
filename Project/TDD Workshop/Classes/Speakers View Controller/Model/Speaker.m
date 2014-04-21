/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "Speaker.h"


@implementation Speaker

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
    }

    return self;
}

@end
