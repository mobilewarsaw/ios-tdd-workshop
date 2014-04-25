//
// Copyright 2014 Taptera Inc. All rights reserved.
//


#import "FakeCollectionView.h"


@implementation FakeCollectionView

- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier {
    self.registeredClass = cellClass;
    self.registerIndentifier = identifier;
}

- (id)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return self.cellToDequeue;
}

@end
