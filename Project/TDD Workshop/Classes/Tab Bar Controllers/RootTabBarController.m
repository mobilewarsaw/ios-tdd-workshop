/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "RootTabBarController.h"
#import "SpeakersViewController.h"


@implementation RootTabBarController

- (void)awakeFromNib {
    [super awakeFromNib];

    SpeakersViewController *controller = [[SpeakersViewController alloc] init];
    UINavigationController *speakersNavigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    self.viewControllers = @[speakersNavigationController];
}

@end
