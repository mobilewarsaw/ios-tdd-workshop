//
// Copyright 2014 Taptera Inc. All rights reserved.
//


#import "AgendaCollectionViewDataSource.h"
#import "AgendaProvider.h"
#import "AgendaCollectionViewCell.h"

NSString * const AgendaCollectionViewCellIdentifier = @"AgendaCollectionViewCellId";

@implementation AgendaCollectionViewDataSource

- (id)initWithProvider:(AgendaProvider *)agendaProvider {
    self = [super init];
    if (self) {
        self.agendaProvider = agendaProvider;
    }
    return self;
}

- (void)setupWithCollectionView:(UICollectionView *)collectionView {
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AgendaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AgendaCollectionViewCellIdentifier
                                                                               forIndexPath:indexPath];
    return cell;
}

@end
