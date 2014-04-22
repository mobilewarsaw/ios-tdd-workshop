//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Foundation/Foundation.h>
#import "StreamItemDownloader.h"

@class StreamItemUploader;
@class StreamItemCreator;
@class StreamItemDownloader;


@interface PhotoStreamViewController : UICollectionViewController <StreamItemDownloader>
@property(nonatomic, strong) StreamItemUploader *streamItemUploader;
@property(nonatomic, strong) StreamItemCreator *streamItemCreator;
@property(nonatomic, strong) StreamItemDownloader *streamItemDownloader;
@end