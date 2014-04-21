//
//  SpeakersViewController.m
//  TDD Workshop
//
//  Created by Pawel Dudek on 20/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//

#import "SpeakersViewController.h"
#import "SpeakersCollectionViewDataSource.h"
#import "Speaker.h"

@implementation SpeakersViewController

- (id)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.speakersDataSource = [[SpeakersCollectionViewDataSource alloc] initWithSpeakers:[self defaultSpeakers]];
        self.title = @"Speakers";
    }

    return self;
}

#pragma mark - Init Helpers

- (NSArray *)defaultSpeakers {
    NSString *speakersPath = [[NSBundle mainBundle] pathForResource:@"Speakers" ofType:@"JSON"];
    NSData *speakersData = [NSData dataWithContentsOfFile:speakersPath];
    NSArray *JSONSpeakers = [NSJSONSerialization JSONObjectWithData:speakersData options:0 error:nil];

    NSMutableArray *speakers = [NSMutableArray array];

    for (NSDictionary *JSONSpeaker in JSONSpeakers) {
        Speaker *speaker = [[Speaker alloc] initWithName:JSONSpeaker[@"name"]];
        [speakers addObject:speaker];
    }

    return speakers;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:SpeakersCollectionViewCellIdentifier];
}

#pragma mark - Overriden Setters

- (void)setSpeakersDataSource:(SpeakersCollectionViewDataSource *)speakersDataSource {
    _speakersDataSource = speakersDataSource;
    self.collectionView.dataSource = self.speakersDataSource;
}

@end
