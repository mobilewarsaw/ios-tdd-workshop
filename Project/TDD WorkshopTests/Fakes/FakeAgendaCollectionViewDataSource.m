//
// Copyright 2014 Taptera Inc. All rights reserved.
//


#import "FakeAgendaCollectionViewDataSource.h"


@implementation FakeAgendaCollectionViewDataSource

- (void)setupWithCollectionView:(UICollectionView *)collectionView {
    self.setupWithCollectionViewCalled = YES;
    self.passedCollectionView = collectionView;
}

@end
