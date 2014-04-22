//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "PhotoStreamViewController.h"
#import "PFObject.h"

@interface PhotoStreamViewController ()
@property(nonatomic, strong) UIRefreshControl *refreshControl;
@end


@implementation PhotoStreamViewController

#pragma mark - Constants

NSString * const PhotoStreamViewControllerCellId = @"PhotoStreamViewControllerCellId";

#pragma mark - Object life cycle

- (id)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.title = NSLocalizedString(@"Photo Stream", @"Photo Stream");
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[[UIImage imageNamed:@"PhotoStream"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]
                                                          tag:0];
    }
    return self;
}

#pragma mark - View life cycle

- (void)loadView {
    [super loadView];
    [self setupCollectionView];
    [self setupRefreshControl];
}

- (void)setupCollectionView {
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:PhotoStreamViewControllerCellId];
}

- (void)setupRefreshControl {
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(didPullToRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:self.refreshControl];
    self.collectionView.alwaysBounceVertical = YES;
}

#pragma mark - Actions

- (void)didPullToRefresh:(UIRefreshControl *)sender {
    [self.refreshControl endRefreshing];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoStreamViewControllerCellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end