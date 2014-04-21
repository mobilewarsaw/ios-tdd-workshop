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
#import "SpeakerCollectionViewCell.h"

@implementation SpeakersViewController

- (id)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.speakersDataSource = [[SpeakersCollectionViewDataSource alloc] initWithSpeakers:[self defaultSpeakers]];
        self.title = @"Soeakers";

        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[UIImage imageNamed:@"Contact"]
                                                          tag:0];
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

    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.alwaysBounceVertical = YES;

    [self.collectionView registerClass:[SpeakerCollectionViewCell class]
            forCellWithReuseIdentifier:SpeakersCollectionViewCellIdentifier];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) self.collectionViewLayout;
    flowLayout.itemSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 44);
}

#pragma mark - Overriden Setters

- (void)setSpeakersDataSource:(SpeakersCollectionViewDataSource *)speakersDataSource {
    _speakersDataSource = speakersDataSource;
    self.collectionView.dataSource = self.speakersDataSource;
}

@end
