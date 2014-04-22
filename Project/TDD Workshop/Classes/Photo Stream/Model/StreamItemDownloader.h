//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>

@protocol StreamItemDownloader;

@interface StreamItemDownloader : NSObject

@property(nonatomic, weak) id <StreamItemDownloader> delegate;

- (void)downloadStreamItems;

@end

@protocol StreamItemDownloader <NSObject>
- (void)streamItemDownloader:(StreamItemDownloader *)streamItemDownloader didDownloadItems:(NSArray *)items;
@end