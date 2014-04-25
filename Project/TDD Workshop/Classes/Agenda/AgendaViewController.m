//
//  TDD Workshop
//
//  Created by Lukasz Warchol on 22/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//

#import "AgendaViewController.h"
#import "AgendaProvider.h"
#import "AgendaCollectionViewDataSource.h"


@implementation AgendaViewController

- (id)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
		self.tabBarItem.image = [UIImage imageNamed:@"agenda"];

        self.agendaProvider = [AgendaProvider new];
        self.agendaDataSource = [[AgendaCollectionViewDataSource alloc] initWithProvider:nil];
    }
    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Setup collection view.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) self.collectionViewLayout;
    flowLayout.itemSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 66);
}

#pragma mark - Data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

@end
