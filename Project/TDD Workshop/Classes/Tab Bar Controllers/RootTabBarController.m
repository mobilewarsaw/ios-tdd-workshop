/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "RootTabBarController.h"
#import "SpeakersViewController.h"
#import "PhotoStreamViewController.h"
#import "AgendaViewController.h"


@implementation RootTabBarController

- (void)awakeFromNib {
    [super awakeFromNib];

    SpeakersViewController *speakersViewController = [SpeakersViewController new];
    UINavigationController *speakersNavigationController = [[UINavigationController alloc] initWithRootViewController:speakersViewController];

    PhotoStreamViewController *photoStreamViewController = [PhotoStreamViewController new];
    UINavigationController *photoStreamNavigationController = [[UINavigationController alloc] initWithRootViewController:photoStreamViewController];
    
    AgendaViewController *agendaViewController = [AgendaViewController defaultController];
    UINavigationController *agendaNavigationController = [[UINavigationController alloc] initWithRootViewController:agendaViewController];

    self.viewControllers = @[speakersNavigationController, photoStreamNavigationController, agendaNavigationController];
}

@end
