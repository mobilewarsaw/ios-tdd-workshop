//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>
#import "StreamItemDownloader.h"
#import "StreamItemCreator.h"
#import "StreamItemUploader.h"

@class StreamItemUploader;
@class StreamItemCreator;
@class StreamItemDownloader;

@interface PhotoStreamViewController : UICollectionViewController
    <StreamItemDownloaderDelegate, StreamItemCreatorDelegate, StreamItemUploaderDelegate>

@property(nonatomic, strong) StreamItemCreator *streamItemCreator;
@property(nonatomic, strong) StreamItemUploader *streamItemUploader;
@property(nonatomic, strong) StreamItemDownloader *streamItemDownloader;

@end