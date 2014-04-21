/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "SpeakersCollectionViewDataSource.h"
#import "SpeakerCell.h"
#import "Speaker.h"

NSString *SpeakersCollectionViewCellIdentifier = @"SpeakersCollectionViewCellIdentifier";

@implementation SpeakersCollectionViewDataSource

- (instancetype)initWithSpeakers:(NSArray *)speakers {
    self = [super init];
    if (self) {
        _speakers = [speakers copy];
    }

    return self;
}

#pragma mark - Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.speakers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell<SpeakerCell> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SpeakersCollectionViewCellIdentifier
                                                                           forIndexPath:indexPath];
    Speaker *speaker = self.speakers[(NSUInteger) indexPath.row];
    cell.nameLabel.text = speaker.name;
    return cell;
}

@end
