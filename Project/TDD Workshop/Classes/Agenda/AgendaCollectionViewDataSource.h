//
//  TDD Workshop
//
//  Created by Lukasz Warchol on 22/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//


#import <Foundation/Foundation.h>

@class AgendaProvider;

@interface AgendaCollectionViewDataSource : NSObject <UICollectionViewDataSource>

@property(nonatomic, strong) AgendaProvider *agendaProvider;

- (id)initWithProvider:(AgendaProvider *)agendaProvider;

- (void)setupWithCollectionView:(UICollectionView *)collectionView;

@end
