//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>

@class StreamItem;
@protocol StreamItemUploaderDelegate;

@interface StreamItemUploader : NSObject

@property(nonatomic, weak) id <StreamItemUploaderDelegate> delegate;

- (instancetype)initWithDelegate:(id <StreamItemUploaderDelegate>)delegate;
+ (instancetype)uploaderWithDelegate:(id <StreamItemUploaderDelegate>)delegate;

- (void)uploadStreamItem:(StreamItem *)streamItem;

@end

@protocol StreamItemUploaderDelegate <NSObject>
@required
- (void)streamItemUploader:(StreamItemUploader *)streamItemUploader didUploadItem:(StreamItem *)streamItem;
@optional
- (void)streamItemUploader:(StreamItemUploader *)streamItemUploader didFailToUploadWithError:(NSError *)error;
@end