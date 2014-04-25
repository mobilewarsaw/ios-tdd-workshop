//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>

@class StreamItem;

@interface StreamPreviewItemViewController : UIViewController
@property(nonatomic, strong) StreamItem *streamItem;

- (instancetype)initWithStreamItem:(StreamItem *)streamItem;
+ (instancetype)controllerWithStreamItem:(StreamItem *)streamItem;

@end