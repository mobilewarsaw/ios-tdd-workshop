//
// Copyright 2014 Taptera Inc. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol StreamItemDownloaderDelegate;


@interface FakeStreamItemDownloader : NSObject

@property(nonatomic, weak) id <StreamItemDownloaderDelegate> delegate;

@property(nonatomic) BOOL downloadStreamItemsCalled;

- (void)downloadStreamItems;


- (void)simulateDidDownloadItems:(NSArray *)items;

@end
