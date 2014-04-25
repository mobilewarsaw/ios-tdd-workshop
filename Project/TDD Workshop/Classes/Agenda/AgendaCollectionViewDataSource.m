//
//  TDD Workshop
//
//  Created by Lukasz Warchol on 22/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import "AgendaCollectionViewDataSource.h"
#import "AgendaProvider.h"
#import "AgendaCollectionViewCell.h"

NSString *const AgendaCollectionViewCellIdentifier = @"AgendaCollectionViewCellId";

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
    return self.agendaProvider.agendaItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AgendaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AgendaCollectionViewCellIdentifier
                                                                               forIndexPath:indexPath];
    return cell;
}

@end
