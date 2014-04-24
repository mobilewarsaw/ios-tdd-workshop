//  
//  Copyright (c) 2014 Mobile Warsaw All rights reserved.
//  


#import "PhotoStreamViewController.h"
#import "StreamItem.h"
#import "PhotoStreamLayout.h"
#import "PhotoStreamCell.h"
#import "StreamItemViewController.h"

@interface PhotoStreamViewController ()
@property(nonatomic, strong) UIRefreshControl *refreshControl;
@property(nonatomic, strong) NSArray *streamItems;
@end

@implementation PhotoStreamViewController

#pragma mark - Constants

NSString * const PhotoStreamViewControllerCellId = @"PhotoStreamViewControllerCellId";

#pragma mark - Object life cycle

- (id)init {
    PhotoStreamLayout *layout = [[PhotoStreamLayout alloc] init];
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        self.streamItemUploader = [StreamItemUploader uploaderWithDelegate:self];
        self.streamItemCreator = [StreamItemCreator creatorWithDelegate:self];
        self.streamItemDownloader = [StreamItemDownloader downloaderWithDelegate:self];
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

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.streamItemDownloader downloadStreamItems];
}

- (void)setupCollectionView {
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[PhotoStreamCell class] forCellWithReuseIdentifier:PhotoStreamViewControllerCellId];
}

- (void)setupRefreshControl {
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(didPullToRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:self.refreshControl];
    self.collectionView.alwaysBounceVertical = YES;
}

#pragma mark - Actions

- (void)addBarButtonItemPressed:(UIBarButtonItem *)sender {
    [self.streamItemCreator createStreamItem];
}

- (void)didPullToRefresh:(UIRefreshControl *)sender {
    [self.streamItemDownloader downloadStreamItems];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.streamItems count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoStreamCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoStreamViewControllerCellId forIndexPath:indexPath];
    StreamItem *streamItem = self.streamItems[(NSUInteger) indexPath.item];
    cell.imageView.image = [streamItem image];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    StreamItem *streamItem = self.streamItems[(NSUInteger) indexPath.item];
    StreamItemViewController *streamItemViewController = [StreamItemViewController controllerWithStreamItem:streamItem];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:streamItemViewController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark - StreamItemDownloaderDelegate

- (void)streamItemDownloader:(StreamItemDownloader *)streamItemDownloader didDownloadItems:(NSArray *)items {
    self.streamItems = items;
    [self.collectionView reloadData];
    [self.refreshControl endRefreshing];
}

#pragma mark - StreamItemCreatorDelegate

- (void)streamItemCreator:(StreamItemCreator *)streamItemCreator didCreateItem:(StreamItem *)streamItem {
    [self.streamItemUploader uploadStreamItem:streamItem];
}

- (UIViewController *)viewControllerToPresentOnImagePickerForStreamItemCreator:(StreamItemCreator *)streamItemCreator {
    return self;
}

- (UITabBar *)tabBarToPresentOnImagePickOptionsForStreamItemCreator:(StreamItemCreator *)streamItemCreator {
    return self.tabBarController.tabBar;
}

#pragma mark - StreamItemUploaderDelegate

- (void)streamItemUploader:(StreamItemUploader *)streamItemUploader didUploadItem:(StreamItem *)streamItem {
    [self.streamItemDownloader downloadStreamItems];
}

@end