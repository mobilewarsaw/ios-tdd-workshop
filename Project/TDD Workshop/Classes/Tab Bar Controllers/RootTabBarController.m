/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "RootTabBarController.h"
#import "SpeakersViewController.h"
#import "PhotoStreamViewController.h"
#import "AgendaViewController.h"
#import "PollViewController.h"


@implementation RootTabBarController

- (void)awakeFromNib {
    [super awakeFromNib];

    SpeakersViewController *speakersViewController = [SpeakersViewController new];
    UINavigationController *speakersNavigationController = [[UINavigationController alloc] initWithRootViewController:speakersViewController];

    PhotoStreamViewController *photoStreamViewController = [PhotoStreamViewController new];
    UINavigationController *photoStreamNavigationController = [[UINavigationController alloc] initWithRootViewController:photoStreamViewController];

    AgendaViewController *agendaViewController = [AgendaViewController new];
    UINavigationController *agendaNavigationController = [[UINavigationController alloc] initWithRootViewController:agendaViewController];

    PollViewController *pollController = [PollViewController new];
    UINavigationController *pollNavigationController = [[UINavigationController alloc] initWithRootViewController:pollController];

    self.viewControllers = @[speakersNavigationController, photoStreamNavigationController, agendaNavigationController, pollNavigationController];
}

@end
