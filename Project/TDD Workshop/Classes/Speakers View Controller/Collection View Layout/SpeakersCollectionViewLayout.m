/*
 * Copyright 2014 Taptera Inc. All rights reserved.
 */


#import "SpeakersCollectionViewLayout.h"
#import "SeparatorView.h"


@implementation SpeakersCollectionViewLayout

- (void)prepareLayout {
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;

    [super prepareLayout];

    [self registerClass:[SeparatorView class] forDecorationViewOfKind:@"Separator"];
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributes = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *separatorsAttributes = [self separatorAttributesForBaseAttributes:attributes];
    return [attributes arrayByAddingObjectsFromArray:separatorsAttributes];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *cellAttributes = [[self collectionView] layoutAttributesForItemAtIndexPath:indexPath];
    return [self layoutAttributesForDecorationViewOfKind:decorationViewKind forCellAttributes:cellAttributes];
}

#pragma mark - Helpers

- (NSMutableArray *)separatorAttributesForBaseAttributes:(NSArray *)attributes {
    NSMutableArray *separatorsAttributes = [NSMutableArray array];

    for (UICollectionViewLayoutAttributes *layoutAttributes in attributes) {
        BOOL isCellAttribute = layoutAttributes.representedElementCategory == UICollectionElementCategoryCell;
        BOOL isNotLastCellInSection = ![self isIndexPathLastInSection:layoutAttributes.indexPath];
        if (isCellAttribute && isNotLastCellInSection) {
            UICollectionViewLayoutAttributes *separatorAttributes = [self layoutAttributesForDecorationViewOfKind:@"Separator"
                                                                                                forCellAttributes:layoutAttributes];
            [separatorsAttributes addObject:separatorAttributes];
        }
    }
    return separatorsAttributes;
}

- (BOOL)isIndexPathLastInSection:(NSIndexPath *)indexPath {
    NSInteger lastItem = [self.collectionView.dataSource collectionView:self.collectionView
                                                 numberOfItemsInSection:indexPath.section] - 1;
    return lastItem == indexPath.row;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)string forCellAttributes:(UICollectionViewLayoutAttributes *)attributes {
    UICollectionViewLayoutAttributes *decorationAttributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:@"Separator"
                                                                                                                         withIndexPath:attributes.indexPath];
    decorationAttributes.bounds = CGRectMake(0, 0, CGRectGetWidth(self.collectionView.bounds), 1 / [UIScreen mainScreen].scale);
    decorationAttributes.center = CGPointMake(CGRectGetMidX(self.collectionView.bounds), CGRectGetMaxY(attributes.frame));
    return decorationAttributes;
}

@end
