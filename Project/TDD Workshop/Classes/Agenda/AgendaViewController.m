//
//  TDD Workshop
//
//  Created by Maciej Oczko on 22/04/14.
//  Copyright (c) 2014 Mobile Warsaw. All rights reserved.
//

#import "AgendaViewController.h"
#import "AgendaManager.h"
#import "AgendaCollectionViewCell.h"


@implementation AgendaViewController {

}

+ (instancetype)defaultController {
    return [[self alloc] initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
}

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        NSString *title = [AgendaManager sharedInstance].title;
        self.title = title;
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[[UIImage imageNamed:[title lowercaseString]] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
                                                          tag:0];
    }

    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.alwaysBounceVertical = YES;
    self.collectionView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);

    [self.collectionView registerClass:[AgendaCollectionViewCell class]
            forCellWithReuseIdentifier:NSStringFromClass([AgendaCollectionViewCell class])];
}

#pragma mark - Data Source & Delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [AgendaManager sharedInstance].agendaItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AgendaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([AgendaCollectionViewCell class])
                                                                                   forIndexPath:indexPath];
    AgendaItem *agendaItem = [AgendaManager sharedInstance].agendaItems[(NSUInteger) indexPath.item];
    [cell configureForAgendaItem:agendaItem];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    AgendaItem *agendaItem = [AgendaManager sharedInstance].agendaItems[(NSUInteger) indexPath.item];
    if (agendaItem.type == AgendaItemTypeBreak) {
        return CGSizeMake(CGRectGetWidth(self.view.bounds), 48);
    }
    return CGSizeMake(CGRectGetWidth(self.view.bounds), 68);
}

@end
