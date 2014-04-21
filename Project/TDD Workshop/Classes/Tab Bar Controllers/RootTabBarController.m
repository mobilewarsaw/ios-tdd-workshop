/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "RootTabBarController.h"
#import "SpeakersViewController.h"


@implementation RootTabBarController

- (void)awakeFromNib {
    [super awakeFromNib];

    SpeakersViewController *controller = [[SpeakersViewController alloc] init];
    self.viewControllers = @[controller];
}

@end
