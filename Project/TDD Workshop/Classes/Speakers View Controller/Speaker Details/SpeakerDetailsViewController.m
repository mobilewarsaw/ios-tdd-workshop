/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "SpeakerDetailsViewController.h"
#import "Speaker.h"


@implementation SpeakerDetailsViewController

- (instancetype)initWithSpeaker:(Speaker *)speaker {
    self = [super init];
    if (self) {
        _speaker = speaker;

        self.title = self.speaker.name;
    }

    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
}

@end
