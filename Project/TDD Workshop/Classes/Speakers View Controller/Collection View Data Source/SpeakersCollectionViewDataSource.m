/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "SpeakersCollectionViewDataSource.h"


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
    return nil;
}

@end
