/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "Speaker.h"


@implementation Speaker

- (instancetype)initWithName:(NSString *)name photo:(UIImage *)photo {
    self = [super init];
    if (self) {
        _name = name;
        _photo = photo;
    }

    return self;
}

@end
