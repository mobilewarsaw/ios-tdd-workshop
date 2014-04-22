/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "RootTabBarController.h"
#import "SpeakersViewController.h"
#import "PhotoStreamViewController.h"


@implementation RootTabBarController

- (void)awakeFromNib {
    [super awakeFromNib];

    SpeakersViewController *speakersViewController = [SpeakersViewController new];
    UINavigationController *speakersNavigationController = [[UINavigationController alloc] initWithRootViewController:speakersViewController];

    PhotoStreamViewController *photoStreamViewController = [PhotoStreamViewController new];
    UINavigationController *photoStreamNavigationController = [[UINavigationController alloc] initWithRootViewController:photoStreamViewController];

    self.viewControllers = @[speakersNavigationController, photoStreamNavigationController];
}

@end
