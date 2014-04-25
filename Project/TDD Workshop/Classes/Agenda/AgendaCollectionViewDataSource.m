//
//  TDD Workshop
//
//  Created by Lukasz Warchol on 22/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import "AgendaCollectionViewDataSource.h"
#import "AgendaProvider.h"
#import "AgendaCollectionViewCell.h"
#import "Speaker.h"

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
    collectionView.dataSource = self;
    [collectionView registerClass:[AgendaCollectionViewCell class]
       forCellWithReuseIdentifier:AgendaCollectionViewCellIdentifier];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.agendaProvider.agendaItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AgendaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AgendaCollectionViewCellIdentifier
                                                                               forIndexPath:indexPath];
    AgendaItem *agendaItem = self.agendaProvider.agendaItems[(NSUInteger) indexPath.item];
    [self setupCell:cell forAgendaItem:agendaItem];

    return cell;
}

- (void)setupCell:(AgendaCollectionViewCell *)cell forAgendaItem:(AgendaItem *)agendaItem {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setLocale:[NSLocale currentLocale]];

    cell.titleLabel.text = agendaItem.title;
    cell.startDateLabel.text = [formatter stringFromDate:agendaItem.startDate];
    cell.durationLabel.text = [NSString stringWithFormat:@"%.0fm", agendaItem.duration / 60];

    NSMutableArray *speakersNames = [NSMutableArray array];
    for (Speaker *speaker in agendaItem.speakers) {
        [speakersNames addObject:speaker.name];
    }
    cell.speakersLabel.text = [speakersNames componentsJoinedByString:@", "];
}

@end
