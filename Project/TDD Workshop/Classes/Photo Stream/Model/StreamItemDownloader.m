//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import <Parse-iOS-SDK/PFQuery.h>
#import "StreamItemDownloader.h"
#import "StreamItem.h"


@implementation StreamItemDownloader

#pragma mark - Object life cycle

- (instancetype)initWithDelegate:(id <StreamItemDownloaderDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

+ (instancetype)downloaderWithDelegate:(id <StreamItemDownloaderDelegate>)delegate {
    return [[self alloc] initWithDelegate:delegate];
}

#pragma mark - Public methods

- (void)downloadStreamItems {
    PFQuery *query = [PFQuery queryWithClassName:NSStringFromClass([StreamItem class])];
    StreamItemDownloader * __weak weakSelf = self;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSMutableArray *streamItems = [NSMutableArray new];
        for (PFObject *object in objects) {
            StreamItem *streamItem = [StreamItem new];
            //TODO improve this!
            streamItem.title = object[@"title"];
            streamItem.data = object[@"data"];
            [streamItems addObject:streamItem];
        }
        [weakSelf.delegate streamItemDownloader:self didDownloadItems:streamItems];
    }];
}

@end