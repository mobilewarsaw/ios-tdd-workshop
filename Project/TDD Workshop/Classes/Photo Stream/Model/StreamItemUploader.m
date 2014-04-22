//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamItemUploader.h"
#import "StreamItem.h"



@implementation StreamItemUploader

#pragma mark - Constants

NSString *const StreamItemDataKey = @"data";
NSString *const StreamItemTitleKey = @"title";

#pragma mark - Public methods

- (void)uploadStreamItem:(StreamItem *)streamItem {
    PFObject *parseObject = [PFObject objectWithClassName:NSStringFromClass([streamItem class])];
    parseObject[StreamItemDataKey] = streamItem.data;
    parseObject[StreamItemTitleKey] = streamItem.title;
    [parseObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        NSLog(@"succeeded = %d", succeeded);
        NSLog(@"error = %@", error);
    }];
}

@end