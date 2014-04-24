//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>

@protocol StreamItemDownloaderDelegate;

@interface StreamItemDownloader : NSObject

@property(nonatomic, weak) id <StreamItemDownloaderDelegate> delegate;

- (instancetype)initWithDelegate:(id <StreamItemDownloaderDelegate>)delegate;
+ (instancetype)downloaderWithDelegate:(id <StreamItemDownloaderDelegate>)delegate;

- (void)downloadStreamItems;

@end

@protocol StreamItemDownloaderDelegate <NSObject>
- (void)streamItemDownloader:(StreamItemDownloader *)streamItemDownloader didDownloadItems:(NSArray *)items;
@end