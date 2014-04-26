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
#import "SpeakerDetailsViewController.h"
#import "SpeakersCollectionViewLayout.h"

@implementation SpeakersViewController

- (id)init {
    UICollectionViewFlowLayout *layout = [[SpeakersCollectionViewLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        _speakers = [self defaultSpeakers];

        self.speakersDataSource = [[SpeakersCollectionViewDataSource alloc] initWithSpeakers:self.speakers];
        self.title = @"Speakers";

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
        Speaker *speaker = [[Speaker alloc] initWithName:JSONSpeaker[@"name"] photo:nil];
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
    flowLayout.itemSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 80);
}

#pragma mark - Overriden Setters

- (void)setSpeakersDataSource:(SpeakersCollectionViewDataSource *)speakersDataSource {
    _speakersDataSource = speakersDataSource;
    self.collectionView.dataSource = self.speakersDataSource;
}

#pragma mark - UICollection View Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Speaker *speaker = [self speakers][(NSUInteger) indexPath.row];
    SpeakerDetailsViewController *detailsViewController = [[SpeakerDetailsViewController alloc] initWithSpeaker:speaker];
    [self.navigationController pushViewController:detailsViewController animated:YES];
}

@end
