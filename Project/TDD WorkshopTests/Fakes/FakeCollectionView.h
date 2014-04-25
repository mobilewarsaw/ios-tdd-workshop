//
// Copyright 2014 Taptera Inc. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface FakeCollectionView : NSObject
@property (nonatomic, assign) id <UICollectionViewDataSource> dataSource;

@property(nonatomic, assign) Class registeredClass;
@property(nonatomic, copy) NSString *registerIndentifier;

- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;

@property(nonatomic, strong) UICollectionViewCell *cellToDequeue;

- (id)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

@end
