//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamItemUploader.h"
#import "StreamItem.h"
#import "StreamItemTransformer.h"

@interface StreamItemUploader ()
@property(nonatomic, strong) StreamItemTransformer *transformer;
@end

@implementation StreamItemUploader

#pragma mark - Object life cycle

- (instancetype)initWithDelegate:(id <StreamItemUploaderDelegate>)delegate {
    self = [super init];
    if (self) {
        self.transformer = [StreamItemTransformer new];
        self.delegate = delegate;
    }
    return self;
}

+ (instancetype)uploaderWithDelegate:(id <StreamItemUploaderDelegate>)delegate {
    return [[self alloc] initWithDelegate:delegate];
}

#pragma mark - Public methods

- (void)uploadStreamItem:(StreamItem *)streamItem {
    StreamItemUploader * __weak weakSelf = self;
    PFObject *parseObject = [self.transformer parseObjectFromStreamItem:streamItem];
    [parseObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [weakSelf.delegate streamItemUploader:weakSelf didUploadItem:streamItem];
        } else {
            [weakSelf.delegate streamItemUploader:weakSelf didFailToUploadWithError:error];
        }
    }];
}

@end