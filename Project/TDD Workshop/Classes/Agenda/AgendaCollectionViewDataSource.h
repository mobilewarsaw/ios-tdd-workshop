//
// Copyright 2014 Taptera Inc. All rights reserved.
//


#import <Foundation/Foundation.h>

@class AgendaProvider;

@interface AgendaCollectionViewDataSource : NSObject <UICollectionViewDataSource>

@property(nonatomic, strong) AgendaProvider *agendaProvider;

- (id)initWithProvider:(AgendaProvider *)agendaProvider;

- (void)setupWithCollectionView:(UICollectionView *)collectionView;

@end
