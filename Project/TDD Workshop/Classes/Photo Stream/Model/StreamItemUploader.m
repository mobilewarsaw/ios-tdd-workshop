//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamItemUploader.h"
#import "StreamItem.h"



@implementation StreamItemUploader

#pragma mark - Constants

NSString *const StreamItemDataKey = @"data";
NSString *const StreamItemTitleKey = @"title";
NSString *const StreamItemWidthKey = @"width";
NSString *const StreamItemHeightKey = @"height";

#pragma mark - Object life cycle

- (instancetype)initWithDelegate:(id <StreamItemUploaderDelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

+ (instancetype)uploaderWithDelegate:(id <StreamItemUploaderDelegate>)delegate {
    return [[self alloc] initWithDelegate:delegate];
}

#pragma mark - Public methods

- (void)uploadStreamItem:(StreamItem *)streamItem {
    PFObject *parseObject = [PFObject objectWithClassName:NSStringFromClass([streamItem class])];

    //TODO improve this
    parseObject[StreamItemDataKey] = streamItem.data;
    parseObject[StreamItemTitleKey] = streamItem.title;
    parseObject[StreamItemWidthKey] = @(streamItem.size.width);
    parseObject[StreamItemHeightKey] = @(streamItem.size.height);
    StreamItemUploader * __weak weakSelf = self;
    [parseObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [weakSelf.delegate streamItemUploader:weakSelf didUploadItem:streamItem];
        } else {
            [weakSelf.delegate streamItemUploader:weakSelf didFailToUploadWithError:error];
        }
    }];
}

@end