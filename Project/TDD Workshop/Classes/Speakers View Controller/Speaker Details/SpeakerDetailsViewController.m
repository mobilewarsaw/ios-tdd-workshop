/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "SpeakerDetailsViewController.h"
#import "Speaker.h"


@implementation SpeakerDetailsViewController

- (instancetype)initWithSpeaker:(Speaker *)speaker {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:flowLayout];
    if (self) {
        _speaker = speaker;
    }

    return self;
}

@end
