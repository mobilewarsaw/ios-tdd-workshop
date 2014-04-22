//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "PhotoStreamViewController.h"
#import "PFObject.h"
#import "StreamItemUploader.h"
#import "StreamItemCreator.h"
#import "StreamItemDownloader.h"
#import "StreamItem.h"

@interface PhotoStreamViewController ()
@property(nonatomic, strong) UIRefreshControl *refreshControl;
@property(nonatomic, strong) NSArray *streamItems;
@end

@implementation PhotoStreamViewController

#pragma mark - Constants

NSString * const PhotoStreamViewControllerCellId = @"PhotoStreamViewControllerCellId";

#pragma mark - Object life cycle

- (id)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.streamItemUploader = [StreamItemUploader new];
        self.streamItemCreator = [StreamItemCreator new];
        self.streamItemDownloader = [StreamItemDownloader new];
        self.streamItemDownloader.delegate = self;

        self.title = NSLocalizedString(@"Photo Stream", @"Photo Stream");
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:self.title
                                                        image:[UIImage imageNamed:@"PhotoStream"]
                                                          tag:0];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                               target:self
                                                                                               action:@selector(addBarButtonItemPressed:)];
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

- (void)addBarButtonItemPressed:(UIBarButtonItem *)sender {
    StreamItem *streamItem = [self.streamItemCreator createStreamItem];
    [self.streamItemUploader uploadStreamItem:streamItem];
}

- (void)didPullToRefresh:(UIRefreshControl *)sender {
    [self.streamItemDownloader downloadStreamItems];
}

#pragma mark - StreamItemDownloader

- (void)streamItemDownloader:(StreamItemDownloader *)streamItemDownloader didDownloadItems:(NSArray *)items {
    self.streamItems = items;
    [self.collectionView reloadData];
    [self.refreshControl endRefreshing];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.streamItems count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoStreamViewControllerCellId forIndexPath:indexPath];
    StreamItem *streamItem = self.streamItems[(NSUInteger) indexPath.item];
    UIImage *image = [[UIImage alloc] initWithData:streamItem.data];
    cell.backgroundView = [[UIImageView alloc] initWithImage:image];
    return cell;
}

@end