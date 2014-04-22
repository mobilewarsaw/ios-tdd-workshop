//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>

@class StreamItem;


@interface StreamItemUploader : NSObject
- (void)uploadStreamItem:(StreamItem *)streamItem;
@end