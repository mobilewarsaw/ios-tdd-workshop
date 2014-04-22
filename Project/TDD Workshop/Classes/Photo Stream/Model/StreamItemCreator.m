//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamItemCreator.h"
#import "StreamItem.h"


@implementation StreamItemCreator

- (StreamItem *)createStreamItem {
    StreamItem *streamItem = [StreamItem new];
    UIImage *testImage = [UIImage imageNamed:@"PhotoStream"];
    streamItem.data = UIImagePNGRepresentation(testImage);
    streamItem.title = @"Test title";
    return streamItem;
}

@end