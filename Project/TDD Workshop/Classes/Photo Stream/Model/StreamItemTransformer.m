//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamItemTransformer.h"
#import "StreamItem.h"
#import "PFObject.h"


@implementation StreamItemTransformer

#pragma mark - Constants

NSString *const StreamItemDataKey = @"data";
NSString *const StreamItemTitleKey = @"title";
NSString *const StreamItemWidthKey = @"width";
NSString *const StreamItemHeightKey = @"height";

#pragma mark - Public methods

- (PFObject *)parseObjectFromStreamItem:(StreamItem *)streamItem {
    PFObject *parseObject = [PFObject objectWithClassName:NSStringFromClass([streamItem class])];
    parseObject[StreamItemDataKey] = streamItem.data;
    parseObject[StreamItemTitleKey] = streamItem.title;
    parseObject[StreamItemWidthKey] = @(streamItem.size.width);
    parseObject[StreamItemHeightKey] = @(streamItem.size.height);
    return parseObject;
}

- (StreamItem *)streamItemFromParseObject:(PFObject *)parseObject {
    StreamItem *streamItem = [StreamItem new];
    streamItem.title = parseObject[StreamItemTitleKey];
    streamItem.data = parseObject[StreamItemDataKey];
    streamItem.size = CGSizeMake([parseObject[StreamItemWidthKey] floatValue], [parseObject[StreamItemHeightKey] floatValue]);
    return streamItem;
}

@end