//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>

@class StreamItem;
@class PFObject;

@interface StreamItemTransformer : NSObject

- (PFObject *)parseObjectFromStreamItem:(StreamItem *)streamItem;
- (StreamItem *)streamItemFromParseObject:(PFObject *)parseObject;

@end