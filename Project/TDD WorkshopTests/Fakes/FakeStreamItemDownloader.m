//
// Copyright 2014 Taptera Inc. All rights reserved.
//


#import "FakeStreamItemDownloader.h"
#import "StreamItemDownloader.h"


@implementation FakeStreamItemDownloader

- (void)downloadStreamItems {
    self.downloadStreamItemsCalled = YES;
}

- (void)simulateDidDownloadItems:(NSArray *)items {
    [self.delegate streamItemDownloader:(id) self
                       didDownloadItems:items];
}

@end
