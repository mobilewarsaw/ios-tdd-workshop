//
// Copyright 2014 Taptera Inc. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface FakeAgendaCollectionViewDataSource : NSObject

@property(nonatomic) BOOL setupWithCollectionViewCalled;

@property(nonatomic, strong) UICollectionView *passedCollectionView;

- (void)setupWithCollectionView:(UICollectionView *)collectionView;

@end
