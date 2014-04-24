//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamItem.h"

@interface StreamItem ()
@property(nonatomic, strong) UIImage *cachedImage;
@end


@implementation StreamItem

- (UIImage *)image {
    if (!self.cachedImage) {
        self.cachedImage = [[UIImage alloc] initWithData:self.data];
    }
    return self.cachedImage;
}

@end