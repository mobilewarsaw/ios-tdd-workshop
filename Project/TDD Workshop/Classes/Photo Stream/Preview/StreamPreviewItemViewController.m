//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "StreamPreviewItemViewController.h"
#import "StreamItem.h"


@implementation StreamPreviewItemViewController

#pragma mark - Object life cycle

- (instancetype)initWithStreamItem:(StreamItem *)streamItem {
    self = [super init];
    if (self) {
        self.streamItem = streamItem;
        self.title = self.streamItem.title;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                               target:self
                                                                                               action:@selector(doneBarButtonPressed:)];
    }
    return self;
}

+ (instancetype)controllerWithStreamItem:(StreamItem *)streamItem {
    return [[self alloc] initWithStreamItem:streamItem];
}

#pragma mark - View life cycle

- (void)loadView {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[self.streamItem image]];
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.view = imageView;
}

#pragma mark - Actions

- (void)doneBarButtonPressed:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end